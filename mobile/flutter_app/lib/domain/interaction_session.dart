import 'package:freezed_annotation/freezed_annotation.dart';

part 'interaction_session.freezed.dart';
part 'interaction_session.g.dart';

enum InteractionChannel { text, voice }

@freezed
class LatencyMetrics with _$LatencyMetrics {
  const factory LatencyMetrics({
    required int networkMs,
    required int processingMs,
    int? totalMs,
  }) = _LatencyMetrics;

  factory LatencyMetrics.fromJson(Map<String, dynamic> json) =>
      _$LatencyMetricsFromJson(json);
}

@freezed
class InteractionAction with _$InteractionAction {
  const factory InteractionAction({
    required String type,
    Map<String, dynamic>? payload,
    DateTime? occurredAt,
  }) = _InteractionAction;

  factory InteractionAction.fromJson(Map<String, dynamic> json) =>
      _$InteractionActionFromJson(json);
}

@freezed
class InteractionSession with _$InteractionSession {
  const factory InteractionSession({
    required String id,
    required String userId,
    required InteractionChannel channel,
    required DateTime startedAt,
    DateTime? endedAt,
    @Default([]) List<String> intentLabels,
    String? transcriptReference,
    @Default([]) List<InteractionAction> actionsTaken,
    LatencyMetrics? latencyMetrics,
  }) = _InteractionSession;

  const InteractionSession._();

  factory InteractionSession.fromJson(Map<String, dynamic> json) =>
      _$InteractionSessionFromJson(json);

  bool get isActive => endedAt == null;

  InteractionSession addAction(InteractionAction action) {
    return copyWith(actionsTaken: [...actionsTaken, action]);
  }

  InteractionSession close({DateTime? at}) {
    return copyWith(endedAt: at ?? DateTime.now());
  }
}
