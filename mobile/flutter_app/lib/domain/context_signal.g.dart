// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_signal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContextSignalImpl _$$ContextSignalImplFromJson(Map<String, dynamic> json) =>
    _$ContextSignalImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      source: $enumDecode(_$ContextSourceEnumMap, json['source']),
      sourceIdentifier: json['sourceIdentifier'] as String,
      ingestedAt: DateTime.parse(json['ingestedAt'] as String),
      priority: $enumDecode(_$SignalPriorityEnumMap, json['priority']),
      permissionsScope: json['permissionsScope'] as String,
      payloadDigest: json['payloadDigest'] as String,
      confidenceHint: (json['confidenceHint'] as num?)?.toDouble(),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$ContextSignalImplToJson(_$ContextSignalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'source': _$ContextSourceEnumMap[instance.source]!,
      'sourceIdentifier': instance.sourceIdentifier,
      'ingestedAt': instance.ingestedAt.toIso8601String(),
      'priority': _$SignalPriorityEnumMap[instance.priority]!,
      'permissionsScope': instance.permissionsScope,
      'payloadDigest': instance.payloadDigest,
      'confidenceHint': instance.confidenceHint,
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };

const _$ContextSourceEnumMap = {
  ContextSource.calendar: 'calendar',
  ContextSource.email: 'email',
  ContextSource.tasks: 'tasks',
  ContextSource.manual: 'manual',
};

const _$SignalPriorityEnumMap = {
  SignalPriority.low: 'low',
  SignalPriority.normal: 'normal',
  SignalPriority.high: 'high',
  SignalPriority.urgent: 'urgent',
};
