import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appConfigProvider = Provider<AppConfig>((_) {
  throw UnimplementedError('AppConfig has not been loaded');
});

class AppConfig {
  AppConfig({
    required this.vertexAiEndpoint,
    required this.vertexAiProjectId,
    required this.firebaseApiKey,
    required this.firebaseProjectId,
    required this.googleOAuthClientId,
    required this.googleOAuthClientSecret,
    required this.mockApiBaseUrl,
    required this.serviceAuthToken,
  });

  final String vertexAiEndpoint;
  final String vertexAiProjectId;
  final String firebaseApiKey;
  final String firebaseProjectId;
  final String googleOAuthClientId;
  final String googleOAuthClientSecret;
  final String mockApiBaseUrl;
  final String serviceAuthToken;

  static Future<AppConfig> load({String fileName = '.env'}) async {
    await dotenv.load(fileName: fileName, mergeWith: const {
      'VERTEX_AI_ENDPOINT': 'http://localhost:8787',
      'VERTEX_AI_PROJECT_ID': 'local-dev-project',
      'FIREBASE_API_KEY': 'local-dev-key',
      'FIREBASE_PROJECT_ID': 'local-dev-project',
      'GOOGLE_OAUTH_CLIENT_ID': 'local-dev-client-id',
      'GOOGLE_OAUTH_CLIENT_SECRET': 'local-dev-client-secret',
      'MOCK_API_BASE_URL': 'http://localhost:8787',
      'SERVICE_AUTH_TOKEN': 'local-service-token',
    });

    return AppConfig(
      vertexAiEndpoint: _readRequired('VERTEX_AI_ENDPOINT'),
      vertexAiProjectId: _readRequired('VERTEX_AI_PROJECT_ID'),
      firebaseApiKey: _readRequired('FIREBASE_API_KEY'),
      firebaseProjectId: _readRequired('FIREBASE_PROJECT_ID'),
      googleOAuthClientId: _readRequired('GOOGLE_OAUTH_CLIENT_ID'),
      googleOAuthClientSecret: _readRequired('GOOGLE_OAUTH_CLIENT_SECRET'),
      mockApiBaseUrl: _readRequired('MOCK_API_BASE_URL'),
      serviceAuthToken: _readRequired('SERVICE_AUTH_TOKEN'),
    );
  }

  static String _readRequired(String key) {
    final value = dotenv.maybeGet(key);
    if (value == null || value.isEmpty) {
      throw StateError('Missing env variable $key');
    }
    return value;
  }
}
