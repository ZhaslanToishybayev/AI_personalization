import 'dart:async';

import 'package:flutter_app/core/analytics/analytics_service.dart';
import 'package:flutter_app/features/interaction/voice_input_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:mocktail/mocktail.dart';

class _MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
  group('VoiceInputController', () {
    test('initializes and moves to ready state', () async {
      final fakeRecognizer = FakeSpeechRecognizer();
      final analytics = _MockAnalyticsService();
      final controller = VoiceInputController(
        recognizer: fakeRecognizer,
        analytics: analytics,
      );

      await controller.initialize();

      expect(controller.state.status, VoiceStatus.ready);
      expect(fakeRecognizer.isInitialized, isTrue);
      controller.dispose();
    });

    test('updates transcripts while listening', () async {
      final fakeRecognizer = FakeSpeechRecognizer();
      final analytics = _MockAnalyticsService();
      final controller = VoiceInputController(
        recognizer: fakeRecognizer,
        analytics: analytics,
      );

      await controller.startListening();
      expect(controller.state.status, VoiceStatus.listening);

      fakeRecognizer.emitPartial('hello there');
      expect(controller.state.partialTranscript, 'hello there');

      fakeRecognizer.emitFinal('hello there general');
      expect(controller.state.finalTranscript, 'hello there general');
      expect(controller.state.status, VoiceStatus.ready);
      expect(controller.state.fallbackSuggested, isFalse);

      controller.dispose();
    });

    test('transitions to ready after stop', () async {
      final fakeRecognizer = FakeSpeechRecognizer();
      final analytics = _MockAnalyticsService();
      final controller = VoiceInputController(
        recognizer: fakeRecognizer,
        analytics: analytics,
      );

      await controller.startListening();
      await controller.stopListening();
      expect(controller.state.status, VoiceStatus.processing);

      await fakeRecognizer.completeStop();
      expect(controller.state.status, VoiceStatus.ready);

      controller.dispose();
    });

    test('reports errors from recognizer', () async {
      final fakeRecognizer = FakeSpeechRecognizer();
      final analytics = _MockAnalyticsService();
      final controller = VoiceInputController(
        recognizer: fakeRecognizer,
        analytics: analytics,
      );

      await controller.startListening();
      fakeRecognizer.emitError('network');

      expect(controller.state.status, VoiceStatus.error);
      expect(controller.state.errorMessage, 'network');
      expect(controller.state.fallbackSuggested, isTrue);

      verify(
        () => analytics.recordVoiceInteraction(
          success: false,
          recognitionLatency: null,
          errorCode: 'network',
          fallbackUsed: true,
        ),
      ).called(1);

      controller.dispose();
    });

    test('suggests fallback when initialization fails', () async {
      final fakeRecognizer = FakeSpeechRecognizer(initializeResult: false);
      final analytics = _MockAnalyticsService();
      final controller = VoiceInputController(
        recognizer: fakeRecognizer,
        analytics: analytics,
      );

      await controller.startListening();

      expect(controller.state.status, VoiceStatus.error);
      expect(controller.state.errorMessage, 'Speech recognition unavailable');
      expect(controller.state.fallbackSuggested, isTrue);

      verify(
        () => analytics.recordVoiceInteraction(
          success: false,
          recognitionLatency: null,
          errorCode: 'initialization_failed',
          fallbackUsed: true,
        ),
      ).called(1);

      controller.dispose();
    });

    test('logs latency on final recognition result', () async {
      final fakeRecognizer = FakeSpeechRecognizer();
      final analytics = _MockAnalyticsService();
      final timestamps = <DateTime>[
        DateTime.utc(2025, 9, 27, 9, 0, 0, 0),
        DateTime.utc(2025, 9, 27, 9, 0, 1, 200),
      ];
      var index = 0;
      DateTime clock() => timestamps[index];

      final controller = VoiceInputController(
        recognizer: fakeRecognizer,
        analytics: analytics,
        clock: clock,
      );

      await controller.startListening();
      index = 1;
      fakeRecognizer.emitFinal('agenda locked');

      expect(
        controller.state.recognitionLatency,
        const Duration(milliseconds: 1200),
      );

      verify(
        () => analytics.recordVoiceInteraction(
          success: true,
          recognitionLatency: const Duration(milliseconds: 1200),
          errorCode: null,
          fallbackUsed: false,
        ),
      ).called(1);

      controller.dispose();
    });
  });
}

class FakeSpeechRecognizer implements SpeechRecognizer {
  FakeSpeechRecognizer({this.initializeResult = true})
    : _statusController = StreamController<String>.broadcast();

  final StreamController<String> _statusController;
  late SpeechResultHandler _onResult;
  late SpeechErrorHandler _onError;
  bool _initialized = false;
  bool _listening = false;
  final bool initializeResult;

  @override
  bool get isInitialized => _initialized;

  @override
  bool get isListening => _listening;

  @override
  Future<bool> initialize({
    required SpeechResultHandler onResult,
    required SpeechErrorHandler onError,
    required SpeechStatusHandler onStatus,
  }) async {
    _onResult = onResult;
    _onError = onError;
    onStatus(_statusController.stream);
    _initialized = initializeResult;
    return initializeResult;
  }

  @override
  Future<void> start({String? localeId}) async {
    _listening = true;
  }

  @override
  Future<void> stop() async {}

  Future<void> completeStop() async {
    _listening = false;
    _statusController.add('notListening');
  }

  @override
  Future<void> cancel() async {
    _listening = false;
    _statusController.add('notListening');
  }

  @override
  void dispose() {
    _statusController.close();
  }

  void emitPartial(String text) {
    _onResult(_buildResult(text, false));
  }

  void emitFinal(String text) {
    _listening = false;
    _onResult(_buildResult(text, true));
    _statusController.add('notListening');
  }

  void emitError(String message) {
    _listening = false;
    _onError(message);
  }

  SpeechRecognitionResult _buildResult(String text, bool isFinal) {
    return SpeechRecognitionResult([
      SpeechRecognitionWords(text, SpeechRecognitionWords.confidenceThreshold),
    ], isFinal);
  }
}
