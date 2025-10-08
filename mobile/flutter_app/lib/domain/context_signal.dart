import 'package:freezed_annotation/freezed_annotation.dart';

part 'context_signal.freezed.dart';
part 'context_signal.g.dart';

enum ContextSource { calendar, email, tasks, manual }

enum SignalPriority { low, normal, high, urgent, critical }

@freezed
class ContextSignal with _$ContextSignal {
  const factory ContextSignal({
    required String id,
    required String userId,
    required ContextSource source,
    required String sourceIdentifier,
    required DateTime ingestedAt,
    required SignalPriority priority,
    required String permissionsScope,
    required String payloadDigest,
    double? confidenceHint,
    DateTime? expiresAt,
  }) = _ContextSignal;

  const ContextSignal._();

  factory ContextSignal.fromJson(Map<String, dynamic> json) =>
      _$ContextSignalFromJson(json);

  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);

  int priorityScore({DateTime? reference}) {
    final now = reference ?? DateTime.now();
    final freshnessMinutes = now.difference(ingestedAt).inMinutes;
    final priorityWeight = switch (priority) {
      SignalPriority.critical => 4,
      SignalPriority.urgent => 3,
      SignalPriority.high => 2,
      SignalPriority.normal => 1,
      SignalPriority.low => 0,
    };
    final freshnessModifier = (freshnessMinutes < 60)
        ? 1.5
        : (freshnessMinutes < 240)
            ? 1.2
            : 1.0;
    final confidenceBoost = confidenceHint != null
        ? (confidenceHint!.clamp(0.0, 1.0) * 20).round()
        : 0;
    return (priorityWeight * 100 * freshnessModifier).round() + confidenceBoost;
  }
}
