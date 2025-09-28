import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

enum ConsentStatus { granted, revoked }

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String displayName,
    required String email,
    required String locale,
    required String timeZone,
    required WorkingHours workingHours,
    required NotificationSettings notificationSettings,
    required Map<String, ConsentRecord> privacyConsents,
    required PersonalBoundaries personalBoundaries,
    @Default(false) bool quietHoursEnabled,
    DateTime? lastExportRequestAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) = _UserProfile;

  const UserProfile._();

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  bool get isDeleted => deletedAt != null;
}

@freezed
class WorkingHours with _$WorkingHours {
  const factory WorkingHours({
    required int startMinutes,
    required int endMinutes,
    required List<int> weekdays,
  }) = _WorkingHours;

  const WorkingHours._();

  factory WorkingHours.fromJson(Map<String, dynamic> json) =>
      _$WorkingHoursFromJson(json);

  bool isWithin(DateTime dateTime) {
    final weekdayIndex = dateTime.weekday;
    if (!weekdays.contains(weekdayIndex)) {
      return false;
    }
    final minutes = dateTime.hour * 60 + dateTime.minute;
    return minutes >= startMinutes && minutes <= endMinutes;
  }
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    required List<String> channels,
    required QuietHours? quietHours,
    required bool allowCriticalAlerts,
  }) = _NotificationSettings;

  const NotificationSettings._();

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);

  bool isQuietTime(DateTime dateTime, String timeZone) {
    final quiet = quietHours;
    if (quiet == null) {
      return false;
    }
    return quiet.isQuiet(dateTime, timeZone);
  }
}

@freezed
class QuietHours with _$QuietHours {
  const factory QuietHours({
    required int startMinutes,
    required int endMinutes,
    required String timeZone,
  }) = _QuietHours;

  const QuietHours._();

  factory QuietHours.fromJson(Map<String, dynamic> json) =>
      _$QuietHoursFromJson(json);

  bool isQuiet(DateTime dateTime, String profileTimeZone) {
    final minutes = dateTime.hour * 60 + dateTime.minute;
    if (startMinutes <= endMinutes) {
      return minutes >= startMinutes && minutes <= endMinutes;
    }
    // Overnight wrap-around (e.g., 22:00 - 06:00)
    return minutes >= startMinutes || minutes <= endMinutes;
  }
}

@freezed
class ConsentRecord with _$ConsentRecord {
  const factory ConsentRecord({
    required ConsentStatus status,
    required DateTime updatedAt,
    String? version,
  }) = _ConsentRecord;

  factory ConsentRecord.fromJson(Map<String, dynamic> json) =>
      _$ConsentRecordFromJson(json);
}

@freezed
class EscalationRule with _$EscalationRule {
  const factory EscalationRule({
    required String id,
    required String channel,
    required String target,
  }) = _EscalationRule;

  factory EscalationRule.fromJson(Map<String, dynamic> json) =>
      _$EscalationRuleFromJson(json);
}

@freezed
class SuppressionWindow with _$SuppressionWindow {
  const factory SuppressionWindow({
    required DateTime startAt,
    required DateTime endAt,
    String? reason,
  }) = _SuppressionWindow;

  const SuppressionWindow._();

  factory SuppressionWindow.fromJson(Map<String, dynamic> json) =>
      _$SuppressionWindowFromJson(json);

  bool contains(DateTime reference) {
    return reference.isAfter(startAt) && reference.isBefore(endAt);
  }
}

@freezed
class PersonalBoundaries with _$PersonalBoundaries {
  const factory PersonalBoundaries({
    required List<String> topicsToAvoid,
    required QuietHours? enforcedQuietHours,
    @Default([]) List<EscalationRule> escalationRules,
    @Default([]) List<SuppressionWindow> suppressionWindows,
  }) = _PersonalBoundaries;

  const PersonalBoundaries._();

  factory PersonalBoundaries.fromJson(Map<String, dynamic> json) =>
      _$PersonalBoundariesFromJson(json);

  bool disallowsTopic(String topic) => topicsToAvoid.any(
        (rule) => topic.toLowerCase().contains(rule.toLowerCase()),
      );

  bool isSuppressed(DateTime reference) =>
      suppressionWindows.any((window) => window.contains(reference));
}
