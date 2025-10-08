// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_queue_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QueuedNotificationImpl _$$QueuedNotificationImplFromJson(
  Map<String, dynamic> json,
) => _$QueuedNotificationImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  channel: json['channel'] as String,
  scheduledFor: DateTime.parse(json['scheduledFor'] as String),
  suggestionId: json['suggestionId'] as String?,
  priority:
      $enumDecodeNullable(_$NotificationPriorityEnumMap, json['priority']) ??
      NotificationPriority.normal,
  quietHoursOverride: json['quietHoursOverride'] as bool? ?? false,
  deliveredAt: json['deliveredAt'] == null
      ? null
      : DateTime.parse(json['deliveredAt'] as String),
  deliveryAttempts: (json['deliveryAttempts'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$QueuedNotificationImplToJson(
  _$QueuedNotificationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'channel': instance.channel,
  'scheduledFor': instance.scheduledFor.toIso8601String(),
  'suggestionId': instance.suggestionId,
  'priority': _$NotificationPriorityEnumMap[instance.priority]!,
  'quietHoursOverride': instance.quietHoursOverride,
  'deliveredAt': instance.deliveredAt?.toIso8601String(),
  'deliveryAttempts': instance.deliveryAttempts,
};

const _$NotificationPriorityEnumMap = {
  NotificationPriority.normal: 'normal',
  NotificationPriority.critical: 'critical',
};
