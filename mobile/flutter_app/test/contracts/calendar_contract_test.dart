import 'dart:convert';

import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('POST /context/calendar contract', () {
    test('sends sync token, events, and deleted IDs', () async {
      final mock = MockClient((request) async {
        expect(request.method, equals('POST'));
        expect(request.url.path, equals('/context/calendar'));
        expect(
          request.headers['X-Service-Token'],
          equals('test-service-token'),
        );

        final payload = jsonDecode(request.body) as Map<String, dynamic>;
        expect(payload['user_id'], equals('user-123'));
        expect(payload['sync_token'], equals('sync-xyz'));
        expect(payload['deleted_event_ids'], equals(['event-9']));

        final events = payload['events'] as List<dynamic>;
        expect(events, hasLength(1));
        final event = events.first as Map<String, dynamic>;
        expect(event['external_id'], equals('event-123'));
        expect(event['sensitivity'], equals('private'));

        return http.Response('', 202);
      });

      final client = AssistantApiClient(
        baseUrl: 'https://api.test.local',
        httpClient: mock,
      );

      await client.ingestCalendarEvents(
        userId: 'user-123',
        events: const [
          {
            'external_id': 'event-123',
            'title': 'Strategy sync',
            'start': '2025-09-27T09:00:00Z',
            'end': '2025-09-27T10:00:00Z',
            'sensitivity': 'private',
          },
        ],
        syncToken: 'sync-xyz',
        deletedEventIds: const ['event-9'],
        serviceToken: 'test-service-token',
      );
    });
  });
}
