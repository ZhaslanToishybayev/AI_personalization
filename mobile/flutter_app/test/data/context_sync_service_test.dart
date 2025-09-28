import 'dart:collection';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_app/data/context_sync_service.dart';
import 'package:flutter_app/data/local/local_store.dart';
import 'package:flutter_app/domain/context_signal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockAssistantApiClient extends Mock implements AssistantApiClient {}

class _MockLocalStore extends Mock implements LocalStore {}

void main() {
  late _MockAssistantApiClient apiClient;
  late _MockLocalStore localStore;
  late ContextSyncService service;
  final now = DateTime.utc(2025, 9, 27, 12);

  setUpAll(() {
    registerFallbackValue(<ContextSignal>[]);
    registerFallbackValue(Duration.zero);
  });

  setUp(() {
    apiClient = _MockAssistantApiClient();
    localStore = _MockLocalStore();
    service = ContextSyncService(
      localStore: localStore,
      apiClient: apiClient,
      retentionWindow: const Duration(days: 10),
      clock: () => now,
    );

    when(() => localStore.upsertContextSignals(any())).thenAnswer((_) async {});
    when(
      () => localStore.pruneContextSignals(retention: any(named: 'retention')),
    ).thenAnswer((_) async {});
    when(
      () => localStore.deleteContextSignalsByIds(any()),
    ).thenAnswer((_) async {});
  });

  group('syncCalendar', () {
    test(
      'dedupes unchanged events, deletes tombstoned entries, and prunes',
      () async {
        const events = [
          {
            'external_id': 'event-kept',
            'title': 'Product sync',
            'start': '2025-09-27T13:00:00Z',
            'end': '2025-09-27T13:30:00Z',
          },
          {
            'external_id': 'event-new',
            'title': 'Executive briefing',
            'start': '2025-09-27T20:00:00Z',
            'end': '2025-09-27T21:00:00Z',
            'location': 'Room 401',
          },
        ];

        final unchangedId = _stableId(
          userId: 'user-123',
          source: ContextSource.calendar,
          externalId: 'event-kept',
        );
        final unchangedDigest = _hashPayload({
          'external_id': 'event-kept',
          'title': 'Product sync',
          'start': '2025-09-27T13:00:00Z',
          'end': '2025-09-27T13:30:00Z',
        });

        when(
          () => apiClient.ingestCalendarEvents(
            userId: any(named: 'userId'),
            events: any(named: 'events'),
            deletedEventIds: any(named: 'deletedEventIds'),
            syncToken: any(named: 'syncToken'),
            serviceToken: any(named: 'serviceToken'),
          ),
        ).thenAnswer((_) async {});

        when(() => localStore.fetchContextSignalDigests(any())).thenAnswer((
          invocation,
        ) async {
          final ids = Set<String>.from(
            invocation.positionalArguments.first as Iterable<String>,
          );
          return ids.contains(unchangedId)
              ? {unchangedId: unchangedDigest}
              : <String, String>{};
        });

        await service.syncCalendar(
          userId: 'user-123',
          events: events,
          deletedEventIds: const ['event-removed'],
          syncToken: 'sync-token',
          serviceToken: 'svc-token',
        );

        verify(
          () => apiClient.ingestCalendarEvents(
            userId: 'user-123',
            events: events,
            deletedEventIds: const ['event-removed'],
            syncToken: 'sync-token',
            serviceToken: 'svc-token',
          ),
        ).called(1);

        final captured =
            verify(
                  () => localStore.upsertContextSignals(captureAny()),
                ).captured.single
                as List<ContextSignal>;

        expect(captured, hasLength(1));
        final signal = captured.single;
        expect(signal.source, ContextSource.calendar);
        expect(signal.sourceIdentifier, 'event-new');
        expect(signal.permissionsScope, 'calendar.read');
        expect(signal.payloadDigest, isNotEmpty);
        expect(signal.ingestedAt, now.toUtc());

        verify(
          () => localStore.deleteContextSignalsByIds([
            _stableId(
              userId: 'user-123',
              source: ContextSource.calendar,
              externalId: 'event-removed',
            ),
          ]),
        ).called(1);

        verify(
          () => localStore.pruneContextSignals(
            retention: const Duration(days: 10),
          ),
        ).called(1);
      },
    );
  });

  group('syncGmail', () {
    test('stores new messages and skips already ingested ones', () async {
      const messages = [
        {
          'external_id': 'msg-existing',
          'subject': 'Status update',
          'snippet': 'All systems nominal',
          'importance': 'normal',
          'received_at': '2025-09-26T22:00:00Z',
        },
        {
          'external_id': 'msg-new',
          'subject': 'Action required',
          'snippet': 'Need approval by EOD',
          'importance': 'high',
          'received_at': '2025-09-27T10:30:00Z',
        },
      ];

      final existingId = _stableId(
        userId: 'user-123',
        source: ContextSource.email,
        externalId: 'msg-existing',
      );
      final existingDigest = _hashPayload({
        'external_id': 'msg-existing',
        'subject': 'Status update',
        'snippet': 'All systems nominal',
        'importance': 'normal',
        'received_at': '2025-09-26T22:00:00Z',
      });

      when(
        () => apiClient.ingestGmailMessages(
          userId: any(named: 'userId'),
          messages: any(named: 'messages'),
          syncToken: any(named: 'syncToken'),
          serviceToken: any(named: 'serviceToken'),
        ),
      ).thenAnswer((_) async {});

      when(() => localStore.fetchContextSignalDigests(any())).thenAnswer((
        invocation,
      ) async {
        final ids = Set<String>.from(
          invocation.positionalArguments.first as Iterable<String>,
        );
        return ids.contains(existingId)
            ? {existingId: existingDigest}
            : <String, String>{};
      });

      await service.syncGmail(
        userId: 'user-123',
        messages: messages,
        syncToken: 'gmail-sync',
        serviceToken: 'svc-token',
      );

      verify(
        () => apiClient.ingestGmailMessages(
          userId: 'user-123',
          messages: messages,
          syncToken: 'gmail-sync',
          serviceToken: 'svc-token',
        ),
      ).called(1);

      final captured =
          verify(
                () => localStore.upsertContextSignals(captureAny()),
              ).captured.single
              as List<ContextSignal>;

      expect(captured, hasLength(1));
      final signal = captured.single;
      expect(signal.source, ContextSource.email);
      expect(signal.sourceIdentifier, 'msg-new');
      expect(signal.permissionsScope, 'inbox.read');
      expect(signal.priority, SignalPriority.high);
      expect(signal.ingestedAt, now.toUtc());
      expect(signal.expiresAt, isNotNull);

      verify(
        () =>
            localStore.pruneContextSignals(retention: const Duration(days: 10)),
      ).called(1);
    });
  });
}

String _stableId({
  required String userId,
  required ContextSource source,
  required String externalId,
}) {
  final bytes = utf8.encode('$userId|${source.name}|$externalId');
  return sha256.convert(bytes).toString();
}

String _hashPayload(Map<String, dynamic> payload) {
  Object? normalize(Object? value) {
    if (value is Map) {
      final sorted = SplayTreeMap<String, Object?>((a, b) => a.compareTo(b));
      value.forEach((key, dynamic val) {
        if (val != null) {
          sorted[key] = normalize(val);
        }
      });
      return sorted;
    }
    if (value is Iterable) {
      return value.map<Object?>(normalize).toList(growable: false);
    }
    if (value is DateTime) {
      return value.toUtc().toIso8601String();
    }
    return value;
  }

  final normalized = normalize(payload);
  final json = jsonEncode(normalized);
  return sha256.convert(utf8.encode(json)).toString();
}
