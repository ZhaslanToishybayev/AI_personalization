import 'dart:convert';

import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('GET /assistant/suggestions contract', () {
    test(
      'includes auth headers and decodes structured explanation payload',
      () async {
        final mock = MockClient((request) async {
          expect(request.method, equals('GET'));
          expect(request.url.path, equals('/assistant/suggestions'));
          expect(
            request.headers['X-Service-Token'],
            equals('test-service-token'),
            reason: 'service authentication required',
          );
          expect(
            request.headers['Authorization'],
            equals('Bearer user-token'),
            reason: 'user bearer token required',
          );
          expect(request.headers['Accept-Language'], equals('de-DE'));
          expect(request.url.queryParameters['max_results'], equals('20'));
          expect(
            request.url.queryParameters['filter'],
            equals('summary,alert'),
          );

          final suggestion = {
            'id': 'suggestion-1',
            'user_id': 'user-123',
            'trigger_context_ids': ['signal-123'],
            'generated_at': '2025-09-27T08:00:00Z',
            'suggestion_type': 'summary',
            'message': 'Summarized updates waiting',
            'explanation': {
              'sources': [
                {
                  'signal_id': 'signal-123',
                  'summary': 'Calendar conflict discovered',
                },
              ],
              'rationale': 'High-priority messages since yesterday',
              'confidence_band': 'high',
              'next_steps': ['Review conflicts', 'Send follow-up'],
            },
            'confidence_score': 0.82,
            'status': 'delivered',
            'boundary_checks': [
              {'rule_id': 'quiet-hours', 'status': 'passed'},
            ],
            'actions': [
              {'type': 'accept', 'label': 'Open summary'},
            ],
            'boundary_violation_flag': false,
          };

          return http.Response(
            jsonEncode({
              'suggestions': [suggestion],
            }),
            200,
            headers: {'content-type': 'application/json'},
          );
        });

        final client = AssistantApiClient(
          baseUrl: 'https://api.test.local',
          httpClient: mock,
        );

        await client.listSuggestions(
          cursor: 'cursor-1',
          maxResults: 20,
          filter: 'summary,alert',
          bearerToken: 'user-token',
          serviceToken: 'test-service-token',
          acceptLanguage: 'de-DE',
        );
      },
    );
  });
}
