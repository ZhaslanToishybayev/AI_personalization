import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/data/assistant_api_client.dart'
    show AssistantApiClient;
import 'package:flutter_app/data/assistant_api_client_provider.dart';
import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/features/alerts/conflict_alert_controller.dart';
import 'package:flutter_app/features/home/daily_plan_screen.dart';
import 'package:flutter_app/features/home/home_screen.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/services/notification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNotificationService extends Mock implements NotificationService {}

class _MockAssistantApiClient extends Mock implements AssistantApiClient {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(DateTime.now());
  });

  testWidgets('Assistant flags scheduling conflicts with alternatives', (
    tester,
  ) async {
    final notification = _MockNotificationService();
    final apiClient = _MockAssistantApiClient();
    final scenario = ConflictAlertScenario(
      userId: 'user-1',
      title: 'Quiet hours active',
      description: 'Sending now violates quiet hours.',
      conflictStart: DateTime(2025, 1, 1, 23, 0),
      contextNote: 'Quiet hours end at 07:00 in America/Los_Angeles.',
      suggestionId: 'suggestion-123',
      quietHours: const QuietHours(
        startMinutes: 22 * 60,
        endMinutes: 7 * 60,
        timeZone: 'America/Los_Angeles',
      ),
      scheduleAfterLabel: 'Schedule after quiet hours',
      sendAnywayLabel: 'Send anyway',
      dismissLabel: 'Dismiss',
    );
    final config = AppConfig(
      vertexAiEndpoint: 'http://localhost:8080',
      vertexAiProjectId: 'project',
      firebaseApiKey: 'key',
      firebaseProjectId: 'firebase-project',
      firebaseAndroidAppId: '1:1234567890:android:test',
      firebaseIosAppId: '1:1234567890:ios:test',
      firebaseIosBundleId: 'com.example.test',
      firebaseWebAppId: '1:1234567890:web:test',
      firebaseMessagingSenderId: '1234567890',
      googleOAuthClientId: 'client-id',
      googleOAuthClientSecret: 'client-secret',
      mockApiBaseUrl: 'http://localhost:8787',
      serviceAuthToken: 'service-token',
      firebaseStorageBucket: 'test-bucket',
      firebaseWebAuthDomain: 'test.firebaseapp.com',
      firebaseWebMeasurementId: 'G-TEST',
    );

    when(
      () => notification.scheduleReminder(
        userId: any(named: 'userId'),
        when: any(named: 'when'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        quietHours: any(named: 'quietHours'),
      ),
    ).thenAnswer((_) async => DateTime(2025, 1, 2, 7, 5));

    final container = ProviderContainer(
      overrides: [
        notificationServiceProvider.overrideWithValue(notification),
        assistantApiClientProvider.overrideWithValue(apiClient),
        appConfigProvider.overrideWithValue(config),
        homeScenarioProvider.overrideWithValue(scenario),
        dailyPlanProvider.overrideWithValue(
          const DailyPlanViewModel(
            headerTitle: 'Daily plan',
            greeting: 'Hi Casey',
            summary: 'You have 3 events today.',
            agendaSection: AgendaSectionModel(title: 'Agenda', entries: []),
            suggestionsSection: SuggestionsSectionModel(
              title: 'Suggestions',
              items: [],
            ),
            focusSection: FocusSectionModel(title: 'Focus', tasks: []),
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomeShellScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Daily plan'), findsOneWidget);
    expect(find.text('Quiet hours active'), findsOneWidget);
    expect(
      find.text('Quiet hours end at 07:00 in America/Los_Angeles.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Schedule after quiet hours'));
    await tester.pumpAndSettle();

    expect(find.text('Scheduled for 07:05'), findsOneWidget);
    verify(
      () => notification.scheduleReminder(
        userId: 'user-1',
        when: scenario.conflictStart,
        title: scenario.title,
        body: scenario.description,
        quietHours: scenario.quietHours,
      ),
    ).called(1);

    await tester.tap(find.text('Dismiss'));
    await tester.pumpAndSettle();
    expect(find.text('Quiet hours active'), findsNothing);
    expect(find.text('Daily plan'), findsOneWidget);
  });
}
