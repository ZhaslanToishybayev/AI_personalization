import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsServiceProvider = Provider<AnalyticsService>(
  (ref) => const AnalyticsService(),
);

/// Analytics service placeholder.
///
/// Actual implementation will be provided during T032.
class AnalyticsService {
  const AnalyticsService();

  void recordVoiceInteraction({
    required bool success,
    Duration? recognitionLatency,
    String? errorCode,
    bool fallbackUsed = false,
  }) {}
}
