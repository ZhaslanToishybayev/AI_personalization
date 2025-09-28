import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/features/home/home_screen.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/l10n/locale_controller.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = await AppConfig.load();

  runApp(
    ProviderScope(
      overrides: [appConfigProvider.overrideWithValue(config)],
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
      theme: GlassTheme.light(),
      darkTheme: GlassTheme.dark(),
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
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final reduceTransparency =
            mediaQuery.highContrast ||
            mediaQuery.accessibleNavigation ||
            mediaQuery.disableAnimations;
        final currentTheme = Theme.of(context);
        final glassEnvironment =
            currentTheme.extension<GlassEnvironment>() ??
            const GlassEnvironment(reduceTransparency: false);

        final resolvedTheme = currentTheme.copyWith(
          extensions: <ThemeExtension<dynamic>>[
            glassEnvironment.copyWith(reduceTransparency: reduceTransparency),
          ],
        );

        return Theme(
          data: resolvedTheme,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const HomeShellScreen(),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
