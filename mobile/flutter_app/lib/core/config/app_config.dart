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
    required this.firebaseAndroidAppId,
    required this.firebaseIosAppId,
    required this.firebaseIosBundleId,
    required this.firebaseWebAppId,
    required this.firebaseMessagingSenderId,
    required this.googleOAuthClientId,
    required this.googleOAuthClientSecret,
    required this.mockApiBaseUrl,
    required this.serviceAuthToken,
    this.firebaseStorageBucket,
    this.firebaseWebAuthDomain,
    this.firebaseWebMeasurementId,
  });

  final String vertexAiEndpoint;
  final String vertexAiProjectId;
  final String firebaseApiKey;
  final String firebaseProjectId;
  final String firebaseAndroidAppId;
  final String firebaseIosAppId;
  final String firebaseIosBundleId;
  final String firebaseWebAppId;
  final String firebaseMessagingSenderId;
  final String googleOAuthClientId;
  final String googleOAuthClientSecret;
  final String mockApiBaseUrl;
  final String serviceAuthToken;
  final String? firebaseStorageBucket;
  final String? firebaseWebAuthDomain;
  final String? firebaseWebMeasurementId;

  static Future<AppConfig> load({String fileName = '.env'}) async {
    const defaults = {
      'VERTEX_AI_ENDPOINT': 'http://localhost:8787',
      'VERTEX_AI_PROJECT_ID': 'local-dev-project',
      'FIREBASE_API_KEY': 'local-dev-key',
      'FIREBASE_PROJECT_ID': 'local-dev-project',
      'FIREBASE_ANDROID_APP_ID': '1:000000000000:android:local',
      'FIREBASE_IOS_APP_ID': '1:000000000000:ios:local',
      'FIREBASE_IOS_BUNDLE_ID': 'com.example.local',
      'FIREBASE_WEB_APP_ID': '1:000000000000:web:local',
      'FIREBASE_MESSAGING_SENDER_ID': '000000000000',
      'FIREBASE_STORAGE_BUCKET': 'local-dev.appspot.com',
      'FIREBASE_WEB_AUTH_DOMAIN': 'local-dev.firebaseapp.com',
      'FIREBASE_WEB_MEASUREMENT_ID': 'G-LOCALDEV',
      'GOOGLE_OAUTH_CLIENT_ID': 'local-dev-client-id',
      'GOOGLE_OAUTH_CLIENT_SECRET': 'local-dev-client-secret',
      'MOCK_API_BASE_URL': 'http://localhost:8787',
      'SERVICE_AUTH_TOKEN': 'local-service-token',
    };

    Map<String, String> config = Map.from(defaults);
    
    try {
      await dotenv.load(fileName: fileName);
      // Override defaults with loaded values
      config.addAll(dotenv.env);
    } catch (e) {
      // .env file not found, using defaults only
      // ignore: avoid_print
      print('Using default configuration (no .env file found)');
    }

    return AppConfig(
      vertexAiEndpoint: config['VERTEX_AI_ENDPOINT']!,
      vertexAiProjectId: config['VERTEX_AI_PROJECT_ID']!,
      firebaseApiKey: config['FIREBASE_API_KEY']!,
      firebaseProjectId: config['FIREBASE_PROJECT_ID']!,
      firebaseAndroidAppId: config['FIREBASE_ANDROID_APP_ID']!,
      firebaseIosAppId: config['FIREBASE_IOS_APP_ID']!,
      firebaseIosBundleId: config['FIREBASE_IOS_BUNDLE_ID']!,
      firebaseWebAppId: config['FIREBASE_WEB_APP_ID']!,
      firebaseMessagingSenderId: config['FIREBASE_MESSAGING_SENDER_ID']!,
      googleOAuthClientId: config['GOOGLE_OAUTH_CLIENT_ID']!,
      googleOAuthClientSecret: config['GOOGLE_OAUTH_CLIENT_SECRET']!,
      mockApiBaseUrl: config['MOCK_API_BASE_URL']!,
      serviceAuthToken: config['SERVICE_AUTH_TOKEN']!,
      firebaseStorageBucket: config['FIREBASE_STORAGE_BUCKET'],
      firebaseWebAuthDomain: config['FIREBASE_WEB_AUTH_DOMAIN'],
      firebaseWebMeasurementId: config['FIREBASE_WEB_MEASUREMENT_ID'],
    );
  }

  static String _readRequired(String key) {
    final value = dotenv.maybeGet(key);
    if (value == null || value.isEmpty) {
      throw StateError('Missing env variable $key');
    }
    return value;
  }

  static String? _readOptional(String key) {
    final value = dotenv.maybeGet(key);
    if (value == null || value.isEmpty) {
      return null;
    }
    return value;
  }
}
