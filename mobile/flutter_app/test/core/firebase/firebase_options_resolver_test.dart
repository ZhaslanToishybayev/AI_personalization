import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/core/firebase/firebase_options_resolver.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final config = AppConfig(
    vertexAiEndpoint: 'https://vertex-ai.example.com',
    vertexAiProjectId: 'project-123',
    firebaseApiKey: 'test-api-key',
    firebaseProjectId: 'test-project',
    firebaseAndroidAppId: '1:1234567890:android:test',
    firebaseIosAppId: '1:1234567890:ios:test',
    firebaseIosBundleId: 'com.example.test',
    firebaseWebAppId: '1:1234567890:web:test',
    firebaseMessagingSenderId: '1234567890',
    googleOAuthClientId: 'client-id',
    googleOAuthClientSecret: 'client-secret',
    mockApiBaseUrl: 'https://mock-api.example.com',
    serviceAuthToken: 'service-token',
    firebaseStorageBucket: 'test-bucket',
    firebaseWebAuthDomain: 'test.firebaseapp.com',
    firebaseWebMeasurementId: 'G-TEST',
  );

  test('returns Android options when platform override is android', () {
    final options = resolveFirebaseOptions(
      config,
      platformOverride: TargetPlatform.android,
      isWebOverride: false,
    );

    expect(options.appId, config.firebaseAndroidAppId);
    expect(options.apiKey, config.firebaseApiKey);
    expect(options.projectId, config.firebaseProjectId);
    expect(options.messagingSenderId, config.firebaseMessagingSenderId);
    expect(options.storageBucket, config.firebaseStorageBucket);
  });

  test('returns iOS options when platform override is iOS', () {
    final options = resolveFirebaseOptions(
      config,
      platformOverride: TargetPlatform.iOS,
      isWebOverride: false,
    );

    expect(options.appId, config.firebaseIosAppId);
    expect(options.apiKey, config.firebaseApiKey);
    expect(options.projectId, config.firebaseProjectId);
    expect(options.messagingSenderId, config.firebaseMessagingSenderId);
    expect(options.iosBundleId, config.firebaseIosBundleId);
  });

  test('returns web options when override indicates web', () {
    final options = resolveFirebaseOptions(
      config,
      platformOverride: TargetPlatform.android,
      isWebOverride: true,
    );

    expect(options.appId, config.firebaseWebAppId);
    expect(options.apiKey, config.firebaseApiKey);
    expect(options.projectId, config.firebaseProjectId);
    expect(options.messagingSenderId, config.firebaseMessagingSenderId);
    expect(options.authDomain, config.firebaseWebAuthDomain);
    expect(options.storageBucket, config.firebaseStorageBucket);
    expect(options.measurementId, config.firebaseWebMeasurementId);
  });
}
