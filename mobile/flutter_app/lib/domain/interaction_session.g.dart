// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LatencyMetricsImpl _$$LatencyMetricsImplFromJson(Map<String, dynamic> json) =>
    _$LatencyMetricsImpl(
      networkMs: (json['networkMs'] as num).toInt(),
      processingMs: (json['processingMs'] as num).toInt(),
      totalMs: (json['totalMs'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LatencyMetricsImplToJson(
  _$LatencyMetricsImpl instance,
) => <String, dynamic>{
  'networkMs': instance.networkMs,
  'processingMs': instance.processingMs,
  'totalMs': instance.totalMs,
};

_$InteractionActionImpl _$$InteractionActionImplFromJson(
  Map<String, dynamic> json,
) => _$InteractionActionImpl(
  type: json['type'] as String,
  payload: json['payload'] as Map<String, dynamic>?,
  occurredAt: json['occurredAt'] == null
      ? null
      : DateTime.parse(json['occurredAt'] as String),
);

Map<String, dynamic> _$$InteractionActionImplToJson(
  _$InteractionActionImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'payload': instance.payload,
  'occurredAt': instance.occurredAt?.toIso8601String(),
};

_$InteractionSessionImpl _$$InteractionSessionImplFromJson(
  Map<String, dynamic> json,
) => _$InteractionSessionImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  channel: $enumDecode(_$InteractionChannelEnumMap, json['channel']),
  startedAt: DateTime.parse(json['startedAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
  intentLabels:
      (json['intentLabels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  transcriptReference: json['transcriptReference'] as String?,
  actionsTaken:
      (json['actionsTaken'] as List<dynamic>?)
          ?.map((e) => InteractionAction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  latencyMetrics: json['latencyMetrics'] == null
      ? null
      : LatencyMetrics.fromJson(json['latencyMetrics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$InteractionSessionImplToJson(
  _$InteractionSessionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'channel': _$InteractionChannelEnumMap[instance.channel]!,
  'startedAt': instance.startedAt.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
  'intentLabels': instance.intentLabels,
  'transcriptReference': instance.transcriptReference,
  'actionsTaken': instance.actionsTaken,
  'latencyMetrics': instance.latencyMetrics,
};

const _$InteractionChannelEnumMap = {
  InteractionChannel.text: 'text',
  InteractionChannel.voice: 'voice',
};
