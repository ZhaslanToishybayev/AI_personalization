import 'dart:convert';

import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('POST /context/gmail contract', () {
    test('payload includes sync token and message metadata', () async {
      final mock = MockClient((request) async {
        expect(request.method, equals('POST'));
        expect(request.url.path, equals('/context/gmail'));

        final payload = jsonDecode(request.body) as Map<String, dynamic>;
        expect(payload['user_id'], equals('user-123'));
        expect(payload['sync_token'], equals('sync-abc'));
        expect(payload['messages'], isA<List<dynamic>>());

        return http.Response('', 202);
      });

      final client = AssistantApiClient(
        baseUrl: 'https://api.test.local',
        httpClient: mock,
      );

      await client.ingestGmailMessages(
        userId: 'user-123',
        messages: const [
          {
            'external_id': 'msg-1',
            'received_at': '2025-09-27T07:45:00Z',
            'subject': 'Board update',
            'snippet': 'Please review attached deck',
            'importance': 'high',
          },
        ],
        syncToken: 'sync-abc',
        serviceToken: 'test-service-token',
      );
    });
  });
}
