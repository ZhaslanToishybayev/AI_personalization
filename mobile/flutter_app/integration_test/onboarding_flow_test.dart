import 'package:flutter/material.dart';
import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/features/onboarding/onboarding_flow.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Onboarding captures consents, locales, and offline fallback', (
    tester,
  ) async {
    final completions = <OnboardingResult>[];

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: OnboardingFlow(onCompleted: completions.add),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.text('Welcome to Personal AI Assistant'), findsOneWidget);

    await tester.tap(find.text('Get started'));
    await tester.pumpAndSettle();

    // Locale selection step should offer EN/ES/DE options
    await tester.tap(find.text('Choose language'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Deutsch (DE)'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Language set to German'), findsOneWidget);

    // Consent toggles per data source with quiet hours configuration
    await tester.tap(find.text('Enable Calendar Sync'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Enable Gmail Summaries'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Push Notifications'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(SwitchListTile).first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    await tester.enterText(
      find.widgetWithText(TextFormField, 'Start (HH:MM)'),
      '21:30',
    );
    await tester.enterText(
      find.widgetWithText(TextFormField, 'End (HH:MM)'),
      '07:00',
    );
    await tester.tap(find.text('Add boundary topic'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).last, 'finance');
    await tester.tap(find.text('Save boundary'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Compliance acknowledgements
    await tester.tap(find.text('I agree to the Terms of Service'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('I allow anonymized telemetry'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('View data export options'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Export data as JSON or ICS'), findsOneWidget);
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Offline fallback banner should appear before finish
    expect(find.text('Offline mode ready — last plan cached'), findsOneWidget);
    await tester.tap(find.text('Finish'));
    await tester.pumpAndSettle();

    expect(completions, hasLength(1));
    final result = completions.single;
    expect(result.locale, equals('de-DE'));
    expect(result.channels, containsAll(<String>['calendar', 'gmail', 'push']));
    expect(result.personalBoundaries, contains('finance'));
    expect(result.quietHoursStart, equals('21:30'));
    expect(result.quietHoursEnd, equals('07:00'));
    expect(result.consents['terms_of_service']?.status, ConsentStatus.granted);
    expect(result.consents['telemetry']?.status, ConsentStatus.granted);
  });
}
