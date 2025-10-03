import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/features/alerts/conflict_alert_controller.dart';
import 'package:flutter_app/features/home/daily_plan_screen.dart';
import 'package:flutter_app/features/home/home_screen.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final config = AppConfig(
    vertexAiEndpoint: 'https://vertex-ai.example.com',
    vertexAiProjectId: 'project-123',
    firebaseApiKey: 'test-key',
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

  const plan = DailyPlanViewModel(
    headerTitle: 'Daily plan',
    greeting: 'Good morning, Casey',
    summary:
        'Morning focus block at 09:30. Two high-priority follow-ups ready.',
    agendaSection: AgendaSectionModel(title: 'Agenda', entries: []),
    suggestionsSection: SuggestionsSectionModel(
      title: 'Suggestions',
      items: [],
    ),
    focusSection: FocusSectionModel(title: 'Focus tasks', tasks: []),
  );

  final scenario = ConflictAlertScenario(
    userId: 'demo-user',
    title: 'Quiet hours active',
    description: "Sending now would break Casey's quiet hours.",
    conflictStart: DateTime(2025, 1, 1, 23),
    quietHours: const QuietHours(
      startMinutes: 22 * 60,
      endMinutes: 7 * 60,
      timeZone: 'America/Los_Angeles',
    ),
  );

  testWidgets('Home screen renders sample plan and conflict banner', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(config),
          dailyPlanProvider.overrideWithValue(plan),
          homeScenarioProvider.overrideWithValue(scenario),
        ],
        child: const PersonalAssistantApp(),
      ),
    );

    await tester.pump();

    expect(find.text('Daily plan'), findsOneWidget);
    expect(find.text('Quiet hours active'), findsOneWidget);
  });
}
