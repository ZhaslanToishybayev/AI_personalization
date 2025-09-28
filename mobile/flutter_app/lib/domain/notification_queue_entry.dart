import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_queue_entry.freezed.dart';
part 'notification_queue_entry.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum NotificationPriority { normal, critical }

@freezed
class QueuedNotification with _$QueuedNotification {
  const factory QueuedNotification({
    required String id,
    required String userId,
    required String channel,
    required DateTime scheduledFor,
    String? suggestionId,
    @Default(NotificationPriority.normal) NotificationPriority priority,
    @Default(false) bool quietHoursOverride,
    DateTime? deliveredAt,
    @Default(0) int deliveryAttempts,
  }) = _QueuedNotification;

  factory QueuedNotification.fromJson(Map<String, dynamic> json) =>
      _$QueuedNotificationFromJson(json);
}
