import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsServiceProvider = Provider<AnalyticsService>(
  (ref) => AnalyticsService(),
);

enum SuggestionFeedbackAction { accepted, declined, snoozed, boundaryOverride }

abstract class AnalyticsSink {
  void logEvent(String name, Map<String, Object?> payload);
}

class NoopAnalyticsSink implements AnalyticsSink {
  const NoopAnalyticsSink();

  @override
  void logEvent(String name, Map<String, Object?> payload) {}
}

class AnalyticsService {
  AnalyticsService({AnalyticsSink? sink, bool telemetryEnabled = true})
    : _sink = sink ?? const NoopAnalyticsSink(),
      _telemetryEnabled = telemetryEnabled;

  final AnalyticsSink _sink;
  bool _telemetryEnabled;

  void updateTelemetryConsent(bool enabled) {
    _telemetryEnabled = enabled;
  }

  void recordVoiceInteraction({
    required bool success,
    Duration? recognitionLatency,
    String? errorCode,
    bool fallbackUsed = false,
  }) {
    if (!_telemetryEnabled) return;
    _sink.logEvent('voice_interaction', {
      'success': success,
      if (recognitionLatency != null)
        'recognition_latency_ms': recognitionLatency.inMilliseconds,
      if (errorCode != null) 'error_code': errorCode,
      'fallback_used': fallbackUsed,
    });
  }

  void recordSuggestionFeedback({
    required String suggestionId,
    required SuggestionFeedbackAction action,
    Duration? responseLatency,
    double? confidenceScore,
    bool boundaryOverride = false,
    String? suggestionType,
  }) {
    if (!_telemetryEnabled) return;
    _sink.logEvent('suggestion_feedback', {
      'suggestion_id': suggestionId,
      'action': action.name,
      if (responseLatency != null)
        'response_latency_ms': responseLatency.inMilliseconds,
      if (confidenceScore != null) 'confidence_score': confidenceScore,
      'boundary_override': boundaryOverride,
      if (suggestionType != null) 'suggestion_type': suggestionType,
    });
  }

  void recordSuggestionDelivery({
    required String suggestionId,
    String? suggestionType,
    double? confidenceScore,
    bool quietHoursConflict = false,
  }) {
    if (!_telemetryEnabled) return;
    _sink.logEvent('suggestion_delivery', {
      'suggestion_id': suggestionId,
      if (suggestionType != null) 'suggestion_type': suggestionType,
      if (confidenceScore != null) 'confidence_score': confidenceScore,
      'quiet_hours_conflict': quietHoursConflict,
    });
  }
}
