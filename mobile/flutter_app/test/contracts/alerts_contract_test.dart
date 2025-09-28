import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('POST /notifications/alerts contract', () {
    test('queues alert with quiet hours override metadata', () async {
      final mock = MockClient((request) async {
        expect(request.method, equals('POST'));
        expect(request.url.path, equals('/notifications/alerts'));
        expect(
          request.headers['X-Service-Token'],
          equals('test-service-token'),
        );

        return http.Response('', 202);
      });

      final client = AssistantApiClient(
        baseUrl: 'https://api.test.local',
        httpClient: mock,
      );

      await client.enqueueAlert(
        userId: 'user-123',
        priority: 'critical',
        title: 'Conflict detected',
        body: 'Meeting overlaps focus block',
        suggestionId: 'suggestion-1',
        quietHoursOverride: true,
        expiresAt: DateTime.parse('2025-09-27T09:00:00Z'),
        serviceToken: 'test-service-token',
      );
    });
  });
}
