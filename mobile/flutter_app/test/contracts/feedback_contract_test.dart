import 'dart:convert';

import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('POST /assistant/feedback contract', () {
    test(
      'sends status, note, and quiet hours override with auth headers',
      () async {
        final mock = MockClient((request) async {
          expect(request.method, equals('POST'));
          expect(request.url.path, equals('/assistant/feedback'));
          expect(
            request.headers['X-Service-Token'],
            equals('test-service-token'),
          );
          expect(request.headers['Authorization'], equals('Bearer user-token'));

          final payload = jsonDecode(request.body) as Map<String, dynamic>;
          expect(payload['suggestion_id'], equals('suggestion-123'));
          expect(payload['status'], equals('accepted'));
          expect(payload['note'], equals('sounds good'));
          expect(payload['quiet_hours_override'], isTrue);

          return http.Response('', 204);
        });

        final client = AssistantApiClient(
          baseUrl: 'https://api.test.local',
          httpClient: mock,
        );

        await client.sendFeedback(
          suggestionId: 'suggestion-123',
          status: 'accepted',
          note: 'sounds good',
          quietHoursOverride: true,
          bearerToken: 'user-token',
          serviceToken: 'test-service-token',
        );
      },
    );
  });
}
