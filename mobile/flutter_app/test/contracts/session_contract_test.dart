import 'dart:convert';

import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_app/domain/interaction_session.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('POST /assistant/session contract', () {
    test('sends auth headers and client capabilities payload', () async {
      const serviceToken = 'test-service-token';

      final mock = MockClient((request) async {
        expect(request.method, equals('POST'));
        expect(request.url.path, equals('/assistant/session'));
        expect(
          request.headers['X-Service-Token'],
          equals(serviceToken),
          reason: 'service auth header required by contract',
        );
        expect(
          request.headers['Authorization'],
          equals('Bearer test-user-token'),
          reason: 'user bearer token required by contract',
        );

        final body = jsonDecode(request.body) as Map<String, dynamic>;
        expect(body['channel'], equals('voice'));
        expect(body['locale'], equals('en-US'));
        expect(
          body['client_capabilities'],
          equals({
            'supports_voice_feedback': true,
            'supports_offline_mode': true,
          }),
        );
        expect(body['context_overrides'], equals(['calendar:today']));

        return http.Response(
          jsonEncode({
            'session_id': 'session-123',
            'expires_at': DateTime.now()
                .add(const Duration(hours: 1))
                .toIso8601String(),
            'warmup_summary': 'Ready to assist',
            'personalization_state': {
              'daily_focus_theme': 'Deep Work',
              'upcoming_conflicts': 1,
              'quiet_hours_active': false,
            },
          }),
          200,
          headers: {'content-type': 'application/json'},
        );
      });

      final client = AssistantApiClient(
        baseUrl: 'https://api.test.local',
        httpClient: mock,
      );

      await client.openSession(
        channel: InteractionChannel.voice,
        locale: 'en-US',
        contextOverrides: const ['calendar:today'],
        bearerToken: 'test-user-token',
        serviceToken: serviceToken,
        clientCapabilities: const {
          'supports_voice_feedback': true,
          'supports_offline_mode': true,
        },
      );
    });
  });
}
