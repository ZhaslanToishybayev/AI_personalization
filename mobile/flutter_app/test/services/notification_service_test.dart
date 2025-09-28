import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/services/notification_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotificationService', () {
    test('registers device via registrar', () async {
      final registrar = FakeRegistrar();
      final service = NotificationService(registrar: registrar);
      const quiet = QuietHours(
        startMinutes: 22 * 60,
        endMinutes: 6 * 60,
        timeZone: 'America/Los_Angeles',
      );

      await service.registerDevice(
        userId: 'user-1',
        deviceToken: 'token-abc',
        platform: 'ios',
        quietHours: quiet,
      );

      expect(registrar.registered.single.userId, 'user-1');
      expect(registrar.registered.single.quietHours, quiet);
    });

    test('schedules respecting quiet hours', () async {
      final scheduler = FakeScheduler();
      final service = NotificationService(scheduler: scheduler);
      const quiet = QuietHours(
        startMinutes: 22 * 60,
        endMinutes: 6 * 60,
        timeZone: 'America/Los_Angeles',
      );

      final now = DateTime(2024, 1, 1, 23);
      final scheduledFor = await service.scheduleReminder(
        userId: 'user-1',
        when: now,
        title: 'Conflict overlap',
        body: 'Reschedule demo',
        quietHours: quiet,
      );

      final scheduled = scheduler.scheduled.single;
      expect(scheduled.when.isAfter(now), isTrue);
      expect(scheduled.when.hour, 6);
      expect(scheduled.when.minute, 1);
      expect(scheduledFor, scheduled.when);
    });

    test('passes through when outside quiet hours', () async {
      final scheduler = FakeScheduler();
      final service = NotificationService(scheduler: scheduler);
      const quiet = QuietHours(
        startMinutes: 22 * 60,
        endMinutes: 6 * 60,
        timeZone: 'America/Los_Angeles',
      );

      final now = DateTime(2024, 1, 1, 12, 30);
      final scheduledFor = await service.scheduleReminder(
        userId: 'user-1',
        when: now,
        title: 'Reminder',
        body: 'Check notes',
        quietHours: quiet,
      );

      expect(scheduler.scheduled.single.when, now);
      expect(scheduledFor, now);
    });
  });
}

class FakeRegistrar implements DeviceRegistrar {
  final List<RegRecord> registered = [];

  @override
  Future<void> register({
    required String userId,
    required String deviceToken,
    required String platform,
    QuietHours? quietHours,
  }) async {
    registered.add(
      RegRecord(
        userId: userId,
        deviceToken: deviceToken,
        platform: platform,
        quietHours: quietHours,
      ),
    );
  }

  @override
  Future<void> unregister(String deviceToken) async {}
}

class FakeScheduler implements NotificationScheduler {
  final List<ScheduledNotification> scheduled = [];

  @override
  Future<void> cancelForUser(String userId) async {}

  @override
  Future<void> schedule({
    required String userId,
    required DateTime when,
    required String title,
    required String body,
  }) async {
    scheduled.add(
      ScheduledNotification(
        userId: userId,
        when: when,
        title: title,
        body: body,
      ),
    );
  }
}

class RegRecord {
  RegRecord({
    required this.userId,
    required this.deviceToken,
    required this.platform,
    required this.quietHours,
  });

  final String userId;
  final String deviceToken;
  final String platform;
  final QuietHours? quietHours;
}

class ScheduledNotification {
  ScheduledNotification({
    required this.userId,
    required this.when,
    required this.title,
    required this.body,
  });

  final String userId;
  final DateTime when;
  final String title;
  final String body;
}
