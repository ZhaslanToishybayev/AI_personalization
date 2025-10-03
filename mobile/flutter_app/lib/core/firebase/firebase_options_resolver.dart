import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../config/app_config.dart';

FirebaseOptions resolveFirebaseOptions(
  AppConfig config, {
  TargetPlatform? platformOverride,
  bool? isWebOverride,
}) {
  final isWeb = isWebOverride ?? kIsWeb;
  if (isWeb) {
    return FirebaseOptions(
      apiKey: config.firebaseApiKey,
      appId: config.firebaseWebAppId,
      projectId: config.firebaseProjectId,
      messagingSenderId: config.firebaseMessagingSenderId,
      authDomain: config.firebaseWebAuthDomain,
      storageBucket: config.firebaseStorageBucket,
      measurementId: config.firebaseWebMeasurementId,
    );
  }

  final platform = platformOverride ?? defaultTargetPlatform;
  switch (platform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return FirebaseOptions(
        apiKey: config.firebaseApiKey,
        appId: config.firebaseIosAppId,
        projectId: config.firebaseProjectId,
        messagingSenderId: config.firebaseMessagingSenderId,
        storageBucket: config.firebaseStorageBucket,
        iosBundleId: config.firebaseIosBundleId,
      );
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return FirebaseOptions(
        apiKey: config.firebaseApiKey,
        appId: config.firebaseAndroidAppId,
        projectId: config.firebaseProjectId,
        messagingSenderId: config.firebaseMessagingSenderId,
        storageBucket: config.firebaseStorageBucket,
      );
  }
}
