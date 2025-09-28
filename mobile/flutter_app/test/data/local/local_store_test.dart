// ignore_for_file: avoid_redundant_argument_values

import 'package:drift/native.dart';
import 'package:flutter_app/data/local/local_store.dart';
import 'package:flutter_app/domain/consent_audit.dart' as audit_domain;
import 'package:flutter_app/domain/context_signal.dart';
import 'package:flutter_app/domain/notification_queue_entry.dart'
    as notification_domain;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocalStore consent audits', () {
    late LocalStore store;

    setUp(() {
      store = LocalStore.forTesting(NativeDatabase.memory());
    });

    tearDown(() async {
      await store.close();
    });

    test('records entries and streams them ordered by occurredAt', () async {
      final events = <List<audit_domain.ConsentAuditEntry>>[];
      final sub = store.consentAuditLog('user-123').listen(events.add);

      await store.insertConsentAuditEntry(
        audit_domain.ConsentAuditEntry(
          userId: 'user-123',
          eventType: 'consent_granted',
          scope: 'calendar.read',
          occurredAt: DateTime.utc(2025, 9, 27, 8),
        ),
      );
      await store.insertConsentAuditEntry(
        audit_domain.ConsentAuditEntry(
          userId: 'user-123',
          eventType: 'consent_revoked',
          scope: 'inbox.read',
          occurredAt: DateTime.utc(2025, 9, 28, 8),
        ),
      );

      await Future<void>.delayed(const Duration(milliseconds: 10));
      expect(events.last.map((entry) => entry.scope), [
        'calendar.read',
        'inbox.read',
      ]);

      await sub.cancel();
    });

    test('purge removes entries older than cutoff', () async {
      await store.insertConsentAuditEntry(
        audit_domain.ConsentAuditEntry(
          userId: 'user-123',
          eventType: 'consent_granted',
          scope: 'calendar.read',
          occurredAt: DateTime(2025, 1, 1),
        ),
      );
      await store.insertConsentAuditEntry(
        audit_domain.ConsentAuditEntry(
          userId: 'user-123',
          eventType: 'consent_granted',
          scope: 'inbox.read',
          occurredAt: DateTime(2025, 9, 1),
        ),
      );

      await store.purgeConsentAuditEntries(DateTime(2025, 6, 1));
      final remaining = await store.consentAuditLog('user-123').first;

      expect(remaining, hasLength(1));
      expect(remaining.single.scope, 'inbox.read');
    });
  });

  group('LocalStore notification queue', () {
    late LocalStore store;

    setUp(() {
      store = LocalStore.forTesting(NativeDatabase.memory());
    });

    tearDown(() async {
      await store.close();
    });

    test('enqueues and retrieves pending notifications', () async {
      final entry = notification_domain.QueuedNotification(
        id: 'notif-1',
        userId: 'user-123',
        suggestionId: 'suggestion-1',
        channel: 'push',
        priority: notification_domain.NotificationPriority.critical,
        quietHoursOverride: true,
        scheduledFor: DateTime.now().subtract(const Duration(minutes: 5)),
      );

      await store.upsertNotification(entry);

      final pending = await store.pendingNotifications('user-123');
      expect(pending, hasLength(1));
      expect(
        pending.single.priority,
        notification_domain.NotificationPriority.critical,
      );
      expect(pending.single.quietHoursOverride, isTrue);
    });

    test('mark delivered increments attempts and sets timestamp', () async {
      final entry = notification_domain.QueuedNotification(
        id: 'notif-2',
        userId: 'user-123',
        channel: 'push',
        scheduledFor: DateTime.now(),
      );
      await store.upsertNotification(entry);

      final deliveredAt = DateTime.now();
      await store.markNotificationDelivered('notif-2', deliveredAt);

      final pending = await store.pendingNotifications('user-123');
      expect(pending, isEmpty);

      final stored = await store.notificationById('notif-2');
      expect(stored?.deliveredAt, isNotNull);
      expect(stored?.deliveryAttempts, 1);
    });

    test('purges delivered notifications after retention window', () async {
      final now = DateTime.now();
      final delivered = notification_domain.QueuedNotification(
        id: 'notif-3',
        userId: 'user-123',
        channel: 'push',
        scheduledFor: now.subtract(const Duration(hours: 1)),
        deliveredAt: now.subtract(const Duration(days: 3)),
      );
      await store.upsertNotification(delivered);

      await store.purgeDeliveredNotifications(
        retention: const Duration(days: 2),
      );
      await store.purgeDeliveredNotifications();
      final removed = await store.notificationById('notif-3');
      expect(removed, isNull);
    });
  });

  group('LocalStore context signals', () {
    late LocalStore store;

    setUp(() {
      store = LocalStore.forTesting(NativeDatabase.memory());
    });

    tearDown(() async {
      await store.close();
    });

    test('fetchContextSignalDigests returns keyed payload digests', () async {
      final signal = ContextSignal(
        id: 'sig-1',
        userId: 'user-123',
        source: ContextSource.calendar,
        sourceIdentifier: 'event-1',
        ingestedAt: DateTime.utc(2025, 9, 27),
        priority: SignalPriority.high,
        permissionsScope: 'calendar.read',
        payloadDigest: 'digest-123',
        expiresAt: DateTime.utc(2025, 9, 27, 12),
      );

      await store.upsertContextSignals([signal]);

      final digests = await store.fetchContextSignalDigests([
        signal.id,
        'missing-signal',
      ]);

      expect(digests, containsPair(signal.id, 'digest-123'));
      expect(digests.containsKey('missing-signal'), isFalse);
    });

    test('deleteContextSignalsByIds removes matching rows', () async {
      final now = DateTime.utc(2025, 9, 27, 8);
      final signals = [
        ContextSignal(
          id: 'sig-delete',
          userId: 'user-123',
          source: ContextSource.email,
          sourceIdentifier: 'msg-1',
          ingestedAt: now,
          priority: SignalPriority.normal,
          permissionsScope: 'inbox.read',
          payloadDigest: 'digest-delete',
        ),
        ContextSignal(
          id: 'sig-keep',
          userId: 'user-123',
          source: ContextSource.calendar,
          sourceIdentifier: 'event-2',
          ingestedAt: now,
          priority: SignalPriority.high,
          permissionsScope: 'calendar.read',
          payloadDigest: 'digest-keep',
        ),
      ];

      await store.upsertContextSignals(signals);

      await store.deleteContextSignalsByIds(['sig-delete', 'unknown']);

      final remaining = await store.activeContextSignals('user-123');
      expect(remaining.map((signal) => signal.id), ['sig-keep']);
    });
  });
}
