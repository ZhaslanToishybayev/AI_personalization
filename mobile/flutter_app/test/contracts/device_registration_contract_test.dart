import 'dart:convert';

import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('PUT /notifications/devices contract', () {
    test('sends locale, quiet hours policy, and auth header', () async {
      final mock = MockClient((request) async {
        expect(request.method, equals('PUT'));
        expect(request.url.path, equals('/notifications/devices'));
        expect(
          request.headers['X-Service-Token'],
          equals('test-service-token'),
        );

        final payload = jsonDecode(request.body) as Map<String, dynamic>;
        expect(payload['device_id'], equals('device-123'));
        expect(payload['platform'], equals('ios'));
        expect(payload['push_token'], equals('push-token-abc'));
        expect(payload['locale'], equals('de-DE'));
        expect(
          payload['quiet_hours'],
          equals({
            'start': '22:00',
            'end': '07:00',
            'timezone': 'Europe/Berlin',
            'allow_critical_overrides': false,
          }),
        );

        return http.Response('', 204);
      });

      final client = AssistantApiClient(
        baseUrl: 'https://api.test.local',
        httpClient: mock,
      );

      await client.registerDevice(
        deviceId: 'device-123',
        platform: 'ios',
        pushToken: 'push-token-abc',
        locale: 'de-DE',
        quietHours: const {
          'start': '22:00',
          'end': '07:00',
          'timezone': 'Europe/Berlin',
          'allow_critical_overrides': false,
        },
        serviceToken: 'test-service-token',
      );
    });
  });
}
