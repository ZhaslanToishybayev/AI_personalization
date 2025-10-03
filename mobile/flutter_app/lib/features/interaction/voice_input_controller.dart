import 'dart:async';

import 'package:flutter_app/core/analytics/analytics_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

final voiceInputControllerProvider =
    StateNotifierProvider.autoDispose<VoiceInputController, VoiceInputState>((
      ref,
    ) {
      final analytics = ref.watch(analyticsServiceProvider);
      return VoiceInputController(
        recognizer: SpeechToTextAdapter(SpeechToText()),
        analytics: analytics,
      );
    });

class VoiceInputController extends StateNotifier<VoiceInputState> {
  VoiceInputController({
    required SpeechRecognizer recognizer,
    AnalyticsService? analytics,
    DateTime Function()? clock,
  }) : _recognizer = recognizer,
       _analytics = analytics ?? AnalyticsService(),
       _clock = clock ?? DateTime.now,
       super(const VoiceInputState());

  final SpeechRecognizer _recognizer;
  StreamSubscription<String>? _statusSubscription;
  final AnalyticsService _analytics;
  final DateTime Function() _clock;

  Future<void> initialize() async {
    if (state.status != VoiceStatus.idle) {
      return;
    }
    state = state.copyWith(
      status: VoiceStatus.initializing,
      errorMessage: null,
    );
    final success = await _recognizer.initialize(
      onResult: _handleRecognition,
      onError: _handleError,
      onStatus: _handleStatus,
    );
    if (!success) {
      state = state.copyWith(
        status: VoiceStatus.error,
        errorMessage: 'Speech recognition unavailable',
        fallbackSuggested: true,
      );
      _analytics.recordVoiceInteraction(
        success: false,
        errorCode: 'initialization_failed',
        fallbackUsed: true,
      );
      return;
    }

    state = state.copyWith(
      status: VoiceStatus.ready,
      errorMessage: null,
      fallbackSuggested: false,
    );
  }

  Future<void> startListening() async {
    if (state.status == VoiceStatus.listening) {
      return;
    }
    if (!_recognizer.isInitialized) {
      await initialize();
      if (state.status != VoiceStatus.ready) {
        return;
      }
    }
    state = state.copyWith(
      status: VoiceStatus.listening,
      partialTranscript: '',
      finalTranscript: '',
      startedAt: _clock(),
      finishedAt: null,
      recognitionLatency: null,
      fallbackSuggested: false,
      errorMessage: null,
    );
    await _recognizer.start(localeId: state.localeId);
  }

  Future<void> stopListening() async {
    if (!state.isListening) {
      return;
    }
    state = state.copyWith(status: VoiceStatus.processing);
    await _recognizer.stop();
  }

  Future<void> cancel() async {
    await _recognizer.cancel();
    state = const VoiceInputState();
  }

  void _handleRecognition(SpeechRecognitionResult result) {
    final transcript = result.recognizedWords;
    if (result.finalResult) {
      final start = state.startedAt;
      final finishedAt = _clock();
      final latency = start == null ? null : finishedAt.difference(start);
      final fallbackUsed = state.fallbackSuggested;
      state = state.copyWith(
        finalTranscript: transcript,
        partialTranscript: '',
        status: VoiceStatus.ready,
        finishedAt: finishedAt,
        recognitionLatency: latency,
        fallbackSuggested: false,
      );
      _analytics.recordVoiceInteraction(
        success: true,
        recognitionLatency: latency,
        fallbackUsed: fallbackUsed,
      );
    } else {
      state = state.copyWith(partialTranscript: transcript);
    }
  }

  void _handleError(String message) {
    state = state.copyWith(
      status: VoiceStatus.error,
      errorMessage: message,
      fallbackSuggested: true,
    );
    _analytics.recordVoiceInteraction(
      success: false,
      errorCode: message,
      fallbackUsed: true,
    );
  }

  void _handleStatus(Stream<String> statusStream) {
    _statusSubscription?.cancel();
    _statusSubscription = statusStream.listen((status) {
      if (status == 'notListening' && state.status == VoiceStatus.processing) {
        state = state.copyWith(status: VoiceStatus.ready);
      }
    });
  }

  @override
  void dispose() {
    _statusSubscription?.cancel();
    _recognizer.dispose();
    super.dispose();
  }
}

enum VoiceStatus { idle, initializing, ready, listening, processing, error }

typedef SpeechResultHandler = void Function(SpeechRecognitionResult result);

typedef SpeechErrorHandler = void Function(String message);

typedef SpeechStatusHandler = void Function(Stream<String> stream);

abstract class SpeechRecognizer {
  bool get isInitialized;
  bool get isListening;

  Future<bool> initialize({
    required SpeechResultHandler onResult,
    required SpeechErrorHandler onError,
    required SpeechStatusHandler onStatus,
  });

  Future<void> start({String? localeId});
  Future<void> stop();
  Future<void> cancel();
  void dispose();
}

class SpeechToTextAdapter implements SpeechRecognizer {
  SpeechToTextAdapter(this._inner);

  final SpeechToText _inner;
  late SpeechResultHandler _onResult;
  late SpeechErrorHandler _onError;
  late StreamController<String> _statusController;
  bool _initialized = false;

  @override
  bool get isInitialized => _initialized;

  @override
  bool get isListening => _inner.isListening;

  @override
  Future<bool> initialize({
    required SpeechResultHandler onResult,
    required SpeechErrorHandler onError,
    required SpeechStatusHandler onStatus,
  }) async {
    _onResult = onResult;
    _onError = onError;
    _statusController = StreamController<String>.broadcast();
    onStatus(_statusController.stream);

    final available = await _inner.initialize(
      onError: (SpeechRecognitionError error) => _onError(error.errorMsg),
      onStatus: _statusController.add,
    );
    _initialized = available;
    return available;
  }

  @override
  Future<void> start({String? localeId}) {
    return _inner.listen(
      onResult: _onResult,
      listenOptions: SpeechListenOptions(listenMode: ListenMode.dictation),
      localeId: localeId,
    );
  }

  @override
  Future<void> stop() => _inner.stop();

  @override
  Future<void> cancel() => _inner.cancel();

  @override
  void dispose() {
    _statusController.close();
    _inner.cancel();
  }
}

class VoiceInputState {
  const VoiceInputState({
    this.status = VoiceStatus.idle,
    this.partialTranscript = '',
    this.finalTranscript = '',
    this.errorMessage,
    this.startedAt,
    this.finishedAt,
    this.localeId,
    this.recognitionLatency,
    this.fallbackSuggested = false,
  });

  final VoiceStatus status;
  final String partialTranscript;
  final String finalTranscript;
  final String? errorMessage;
  final DateTime? startedAt;
  final DateTime? finishedAt;
  final String? localeId;
  final Duration? recognitionLatency;
  final bool fallbackSuggested;

  bool get isListening => status == VoiceStatus.listening;

  VoiceInputState copyWith({
    VoiceStatus? status,
    String? partialTranscript,
    String? finalTranscript,
    Object? errorMessage = _sentinel,
    DateTime? startedAt,
    Object? finishedAt = _sentinel,
    Object? recognitionLatency = _sentinel,
    Object? fallbackSuggested = _sentinel,
    String? localeId,
  }) {
    return VoiceInputState(
      status: status ?? this.status,
      partialTranscript: partialTranscript ?? this.partialTranscript,
      finalTranscript: finalTranscript ?? this.finalTranscript,
      errorMessage: identical(errorMessage, _sentinel)
          ? this.errorMessage
          : errorMessage as String?,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: identical(finishedAt, _sentinel)
          ? this.finishedAt
          : finishedAt as DateTime?,
      recognitionLatency: identical(recognitionLatency, _sentinel)
          ? this.recognitionLatency
          : recognitionLatency as Duration?,
      fallbackSuggested: identical(fallbackSuggested, _sentinel)
          ? this.fallbackSuggested
          : fallbackSuggested as bool,
      localeId: localeId ?? this.localeId,
    );
  }
}

const _sentinel = Object();
