import 'package:flutter_app/core/analytics/analytics_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('recordVoiceInteraction logs when telemetry enabled', () {
    final sink = _TestAnalyticsSink();
    final analytics = AnalyticsService(sink: sink, telemetryEnabled: true);

    analytics.recordVoiceInteraction(
      success: true,
      recognitionLatency: const Duration(milliseconds: 320),
      fallbackUsed: true,
    );

    expect(sink.events, hasLength(1));
    final event = sink.events.first;
    expect(event.name, 'voice_interaction');
    expect(event.payload['success'], true);
    expect(event.payload['recognition_latency_ms'], 320);
    expect(event.payload['fallback_used'], true);
  });

  test('voice interaction suppressed when telemetry disabled', () {
    final sink = _TestAnalyticsSink();
    final analytics = AnalyticsService(sink: sink, telemetryEnabled: false);

    analytics.recordVoiceInteraction(success: true);

    expect(sink.events, isEmpty);
  });

  test('recordSuggestionFeedback logs detailed payload', () {
    final sink = _TestAnalyticsSink();
    final analytics = AnalyticsService(sink: sink);

    analytics.recordSuggestionFeedback(
      suggestionId: 'suggestion-1',
      action: SuggestionFeedbackAction.accepted,
      responseLatency: const Duration(seconds: 2),
      confidenceScore: 0.84,
      suggestionType: 'daily_plan',
    );

    final event = sink.events.single;
    expect(event.name, 'suggestion_feedback');
    expect(event.payload['suggestion_id'], 'suggestion-1');
    expect(event.payload['action'], 'accepted');
    expect(event.payload['response_latency_ms'], 2000);
    expect(event.payload['confidence_score'], 0.84);
    expect(event.payload['suggestion_type'], 'daily_plan');
  });

  test('recordSuggestionDelivery respects telemetry consent flag', () {
    final sink = _TestAnalyticsSink();
    final analytics = AnalyticsService(sink: sink, telemetryEnabled: false);

    analytics.recordSuggestionDelivery(
      suggestionId: 'suggestion-2',
      suggestionType: 'alert',
      quietHoursConflict: true,
    );
    expect(sink.events, isEmpty);

    analytics.updateTelemetryConsent(true);
    analytics.recordSuggestionDelivery(
      suggestionId: 'suggestion-2',
      suggestionType: 'alert',
      quietHoursConflict: true,
    );

    final event = sink.events.single;
    expect(event.name, 'suggestion_delivery');
    expect(event.payload['suggestion_id'], 'suggestion-2');
    expect(event.payload['suggestion_type'], 'alert');
    expect(event.payload['quiet_hours_conflict'], true);
  });
}

class _TestAnalyticsSink implements AnalyticsSink {
  final List<_LoggedEvent> events = [];

  @override
  void logEvent(String name, Map<String, Object?> payload) {
    events.add(_LoggedEvent(name, Map<String, Object?>.from(payload)));
  }
}

class _LoggedEvent {
  _LoggedEvent(this.name, this.payload);

  final String name;
  final Map<String, Object?> payload;
}
