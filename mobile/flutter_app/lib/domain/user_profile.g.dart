// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      locale: json['locale'] as String,
      timeZone: json['timeZone'] as String,
      workingHours: WorkingHours.fromJson(
        json['workingHours'] as Map<String, dynamic>,
      ),
      notificationSettings: NotificationSettings.fromJson(
        json['notificationSettings'] as Map<String, dynamic>,
      ),
      privacyConsents: (json['privacyConsents'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, ConsentRecord.fromJson(e as Map<String, dynamic>)),
      ),
      personalBoundaries: PersonalBoundaries.fromJson(
        json['personalBoundaries'] as Map<String, dynamic>,
      ),
      quietHoursEnabled: json['quietHoursEnabled'] as bool? ?? false,
      lastExportRequestAt: json['lastExportRequestAt'] == null
          ? null
          : DateTime.parse(json['lastExportRequestAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'locale': instance.locale,
      'timeZone': instance.timeZone,
      'workingHours': instance.workingHours,
      'notificationSettings': instance.notificationSettings,
      'privacyConsents': instance.privacyConsents,
      'personalBoundaries': instance.personalBoundaries,
      'quietHoursEnabled': instance.quietHoursEnabled,
      'lastExportRequestAt': instance.lastExportRequestAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };

_$WorkingHoursImpl _$$WorkingHoursImplFromJson(Map<String, dynamic> json) =>
    _$WorkingHoursImpl(
      startMinutes: (json['startMinutes'] as num).toInt(),
      endMinutes: (json['endMinutes'] as num).toInt(),
      weekdays: (json['weekdays'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$WorkingHoursImplToJson(_$WorkingHoursImpl instance) =>
    <String, dynamic>{
      'startMinutes': instance.startMinutes,
      'endMinutes': instance.endMinutes,
      'weekdays': instance.weekdays,
    };

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationSettingsImpl(
  channels: (json['channels'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  quietHours: json['quietHours'] == null
      ? null
      : QuietHours.fromJson(json['quietHours'] as Map<String, dynamic>),
  allowCriticalAlerts: json['allowCriticalAlerts'] as bool,
);

Map<String, dynamic> _$$NotificationSettingsImplToJson(
  _$NotificationSettingsImpl instance,
) => <String, dynamic>{
  'channels': instance.channels,
  'quietHours': instance.quietHours,
  'allowCriticalAlerts': instance.allowCriticalAlerts,
};

_$QuietHoursImpl _$$QuietHoursImplFromJson(Map<String, dynamic> json) =>
    _$QuietHoursImpl(
      startMinutes: (json['startMinutes'] as num).toInt(),
      endMinutes: (json['endMinutes'] as num).toInt(),
      timeZone: json['timeZone'] as String,
    );

Map<String, dynamic> _$$QuietHoursImplToJson(_$QuietHoursImpl instance) =>
    <String, dynamic>{
      'startMinutes': instance.startMinutes,
      'endMinutes': instance.endMinutes,
      'timeZone': instance.timeZone,
    };

_$ConsentRecordImpl _$$ConsentRecordImplFromJson(Map<String, dynamic> json) =>
    _$ConsentRecordImpl(
      status: $enumDecode(_$ConsentStatusEnumMap, json['status']),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: json['version'] as String?,
    );

Map<String, dynamic> _$$ConsentRecordImplToJson(_$ConsentRecordImpl instance) =>
    <String, dynamic>{
      'status': _$ConsentStatusEnumMap[instance.status]!,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'version': instance.version,
    };

const _$ConsentStatusEnumMap = {
  ConsentStatus.granted: 'granted',
  ConsentStatus.revoked: 'revoked',
};

_$EscalationRuleImpl _$$EscalationRuleImplFromJson(Map<String, dynamic> json) =>
    _$EscalationRuleImpl(
      id: json['id'] as String,
      channel: json['channel'] as String,
      target: json['target'] as String,
    );

Map<String, dynamic> _$$EscalationRuleImplToJson(
  _$EscalationRuleImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'channel': instance.channel,
  'target': instance.target,
};

_$SuppressionWindowImpl _$$SuppressionWindowImplFromJson(
  Map<String, dynamic> json,
) => _$SuppressionWindowImpl(
  startAt: DateTime.parse(json['startAt'] as String),
  endAt: DateTime.parse(json['endAt'] as String),
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$$SuppressionWindowImplToJson(
  _$SuppressionWindowImpl instance,
) => <String, dynamic>{
  'startAt': instance.startAt.toIso8601String(),
  'endAt': instance.endAt.toIso8601String(),
  'reason': instance.reason,
};

_$PersonalBoundariesImpl _$$PersonalBoundariesImplFromJson(
  Map<String, dynamic> json,
) => _$PersonalBoundariesImpl(
  topicsToAvoid: (json['topicsToAvoid'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  enforcedQuietHours: json['enforcedQuietHours'] == null
      ? null
      : QuietHours.fromJson(json['enforcedQuietHours'] as Map<String, dynamic>),
  escalationRules:
      (json['escalationRules'] as List<dynamic>?)
          ?.map((e) => EscalationRule.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  suppressionWindows:
      (json['suppressionWindows'] as List<dynamic>?)
          ?.map((e) => SuppressionWindow.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$PersonalBoundariesImplToJson(
  _$PersonalBoundariesImpl instance,
) => <String, dynamic>{
  'topicsToAvoid': instance.topicsToAvoid,
  'enforcedQuietHours': instance.enforcedQuietHours,
  'escalationRules': instance.escalationRules,
  'suppressionWindows': instance.suppressionWindows,
};
