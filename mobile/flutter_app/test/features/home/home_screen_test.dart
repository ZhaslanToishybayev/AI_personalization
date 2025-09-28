import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_app/data/assistant_api_client_provider.dart';
import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/features/alerts/conflict_alert_controller.dart';
import 'package:flutter_app/features/home/daily_plan_screen.dart';
import 'package:flutter_app/features/home/home_screen.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/services/notification_service.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNotificationService extends Mock implements NotificationService {}

class _MockAssistantApiClient extends Mock implements AssistantApiClient {}

class _FakeScenario extends ConflictAlertScenario {
  _FakeScenario()
    : super(
        userId: 'user-1',
        title: 'Quiet hours active',
        description: 'Sending now violates quiet hours.',
        conflictStart: DateTime(2025, 1, 1, 23, 0),
        quietHours: const QuietHours(
          startMinutes: 22 * 60,
          endMinutes: 6 * 60,
          timeZone: 'America/Los_Angeles',
        ),
        tone: GlassTone.dusk,
      );
}

void main() {
  setUpAll(() {
    registerFallbackValue(DateTime.now());
  });

  testWidgets('renders plan and conflict banner', (tester) async {
    final notification = _MockNotificationService();
    final apiClient = _MockAssistantApiClient();
    final scenario = _FakeScenario();
    final config = AppConfig(
      vertexAiEndpoint: 'http://localhost:8080',
      vertexAiProjectId: 'proj',
      firebaseApiKey: 'key',
      firebaseProjectId: 'firebase',
      googleOAuthClientId: 'client',
      googleOAuthClientSecret: 'secret',
      mockApiBaseUrl: 'http://localhost:8787',
      serviceAuthToken: 'service-token',
    );

    when(
      () => notification.scheduleReminder(
        userId: any(named: 'userId'),
        when: any(named: 'when'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        quietHours: any(named: 'quietHours'),
      ),
    ).thenAnswer(
      (_) async =>
          scenario.conflictStart.add(const Duration(hours: 7, minutes: 1)),
    );

    when(
      () => apiClient.enqueueAlert(
        userId: any(named: 'userId'),
        priority: any(named: 'priority'),
        title: any(named: 'title'),
        body: any(named: 'body'),
        suggestionId: any(named: 'suggestionId'),
        quietHoursOverride: any(named: 'quietHoursOverride'),
        expiresAt: any(named: 'expiresAt'),
        serviceToken: any(named: 'serviceToken'),
      ),
    ).thenAnswer((_) async {});

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
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const HomeShellScreen(),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Quiet hours active'), findsOneWidget);
    expect(find.text('Daily plan'), findsOneWidget);

    await tester.tap(find.text('Schedule after quiet hours'));
    await tester.pump();

    expect(find.text('Scheduled for 06:01'), findsOneWidget);
  });
}
