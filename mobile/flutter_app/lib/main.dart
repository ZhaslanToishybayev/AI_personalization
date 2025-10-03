import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/core/firebase/firebase_manager.dart';
import 'package:flutter_app/core/firebase/firebase_options_resolver.dart';
import 'package:flutter_app/features/home/home_screen_simple.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/l10n/locale_controller.dart';
import 'package:flutter_app/theme/simple_material_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = await AppConfig.load();
  
  FirebaseManager? firebaseManager;
  try {
    firebaseManager = FirebaseManager(
      initializer: Firebase.initializeApp,
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    );

    final firebaseOptions = resolveFirebaseOptions(config);
    await firebaseManager.initialize(options: firebaseOptions);
  } catch (e) {
    // Firebase initialization failed, running without Firebase
    // ignore: avoid_print
    print('Firebase initialization failed: $e');
    print('Running in offline mode without Firebase');
  }

  runApp(
    ProviderScope(
      overrides: [
        appConfigProvider.overrideWithValue(config),
        if (firebaseManager != null)
          firebaseManagerProvider.overrideWithValue(firebaseManager),
      ],
      child: const PersonalAssistantApp(),
    ),
  );
}

class PersonalAssistantApp extends ConsumerWidget {
  const PersonalAssistantApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appConfigProvider);
    final localeOverride = ref.watch(localeControllerProvider);

    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      locale: localeOverride,
      theme: SimpleMaterialTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      localeListResolutionCallback: (localeList, supportedLocales) {
        if (localeOverride != null) {
          return localeOverride;
        }
        if (localeList == null || localeList.isEmpty) {
          return supportedLocales.first;
        }
        final controller = ref.read(localeControllerProvider.notifier);
        final resolved = controller.resolveLocaleFromTag(
          localeList.first.toLanguageTag(),
        );
        return resolved ?? supportedLocales.first;
      },

      home: const HomeScreen(),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
