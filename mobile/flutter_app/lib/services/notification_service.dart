import 'dart:async';

import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

class NotificationService {
  NotificationService({
    NotificationScheduler? scheduler,
    DeviceRegistrar? registrar,
  }) : _scheduler = scheduler ?? LocalNotificationScheduler(),
       _registrar = registrar ?? TokenDeviceRegistrar();

  final NotificationScheduler _scheduler;
  final DeviceRegistrar _registrar;

  Future<void> registerDevice({
    required String userId,
    required String deviceToken,
    required String platform,
    QuietHours? quietHours,
  }) {
    return _registrar.register(
      userId: userId,
      deviceToken: deviceToken,
      platform: platform,
      quietHours: quietHours,
    );
  }

  Future<void> unregisterDevice(String deviceToken) {
    return _registrar.unregister(deviceToken);
  }

  Future<DateTime> scheduleReminder({
    required String userId,
    required DateTime when,
    required String title,
    required String body,
    QuietHours? quietHours,
  }) async {
    final target =
        (quietHours != null && quietHours.isQuiet(when, quietHours.timeZone))
        ? _nextAvailableWindow(when, quietHours)
        : when;

    await _scheduler.schedule(
      userId: userId,
      when: target,
      title: title,
      body: body,
    );
    return target;
  }

  Future<void> cancelNotifications(String userId) {
    return _scheduler.cancelForUser(userId);
  }

  DateTime _nextAvailableWindow(DateTime reference, QuietHours quietHours) {
    final start = quietHours.startMinutes;
    final end = quietHours.endMinutes;
    final minutes = reference.hour * 60 + reference.minute;

    DateTime nextDay(DateTime base) =>
        DateTime(base.year, base.month, base.day + 1);

    DateTime fromMinutes(DateTime day, int minute) {
      final totalMinutes = minute % (24 * 60);
      final extraDays = minute ~/ (24 * 60);
      return DateTime(
        day.year,
        day.month,
        day.day + extraDays,
        totalMinutes ~/ 60,
        totalMinutes % 60,
      );
    }

    final dayStart = DateTime(reference.year, reference.month, reference.day);

    if (start <= end) {
      final inWindow = minutes >= start && minutes <= end;
      if (!inWindow) {
        return reference;
      }
      final candidate = fromMinutes(dayStart, end + 1);
      return candidate.isAfter(reference)
          ? candidate
          : candidate.add(const Duration(days: 1));
    } else {
      final inWindow = minutes >= start || minutes <= end;
      if (!inWindow) {
        return reference;
      }
      if (minutes >= start) {
        final next = nextDay(dayStart);
        return fromMinutes(next, end + 1);
      }
      return fromMinutes(dayStart, end + 1);
    }
  }
}

abstract class NotificationScheduler {
  Future<void> schedule({
    required String userId,
    required DateTime when,
    required String title,
    required String body,
  });

  Future<void> cancelForUser(String userId);
}

abstract class DeviceRegistrar {
  Future<void> register({
    required String userId,
    required String deviceToken,
    required String platform,
    QuietHours? quietHours,
  });

  Future<void> unregister(String deviceToken);
}

class LocalNotificationScheduler implements NotificationScheduler {
  @override
  Future<void> cancelForUser(String userId) async {
    // TODO(zhaslan): integrate platform-specific cancellation.
  }

  @override
  Future<void> schedule({
    required String userId,
    required DateTime when,
    required String title,
    required String body,
  }) async {
    // TODO(zhaslan): integrate platform-specific scheduling.
  }
}

class TokenDeviceRegistrar implements DeviceRegistrar {
  @override
  Future<void> register({
    required String userId,
    required String deviceToken,
    required String platform,
    QuietHours? quietHours,
  }) async {
    // TODO(zhaslan): call backend registration endpoint.
  }

  @override
  Future<void> unregister(String deviceToken) async {
    // TODO(zhaslan): call backend unregister endpoint.
  }
}
