import 'package:flutter_app/domain/consent_audit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ConsentAuditLog', () {
    test('records entry with scope metadata and retrieves by user', () async {
      final log = InMemoryConsentAuditLog();
      final entry = ConsentAuditEntry(
        userId: 'user-123',
        eventType: 'consent_granted',
        scope: 'calendar.read',
        occurredAt: DateTime.utc(2025, 9, 27, 8),
        notes: 'Initial onboarding consent',
      );

      await log.record(entry);

      final results = await log.entriesForUser('user-123').take(1).toList();

      expect(results, isNotEmpty);
      expect(results.first.scope, equals('calendar.read'));
    });

    test('purge removes entries before cutoff timestamp', () async {
      final log = InMemoryConsentAuditLog();

      await log.record(
        ConsentAuditEntry(
          userId: 'user-123',
          eventType: 'consent_granted',
          scope: 'calendar.read',
          occurredAt: DateTime.utc(2025, 1, 1, 9),
        ),
      );
      await log.record(
        ConsentAuditEntry(
          userId: 'user-123',
          eventType: 'consent_revoked',
          scope: 'inbox.read',
          occurredAt: DateTime.utc(2025, 9, 1, 9),
        ),
      );

      await log.purgeBefore(DateTime.utc(2025, 6));

      final entries = await log.entriesForUser('user-123').toList();
      expect(entries.length, equals(1));
      expect(entries.first.scope, equals('inbox.read'));
    });
  });
}
