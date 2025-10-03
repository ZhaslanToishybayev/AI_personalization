import 'package:flutter_app/core/analytics/analytics_service.dart';
import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_app/data/assistant_api_client_provider.dart';
import 'package:flutter_app/features/alerts/conflict_alert_controller.dart';
import 'package:flutter_app/services/notification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockNotificationService extends Mock implements NotificationService {}

class _MockAssistantApiClient extends Mock implements AssistantApiClient {}

class _MockAnalyticsService extends Mock implements AnalyticsService {}

void main() {
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

  setUpAll(() {
    registerFallbackValue(DateTime.now());
    registerFallbackValue(Duration.zero);
    registerFallbackValue(SuggestionFeedbackAction.accepted);
  });

  test(
    'scheduleAfterQuietHours delegates to notification service and updates status',
    () async {
      final notification = _MockNotificationService();
      final apiClient = _MockAssistantApiClient();
      final analytics = _MockAnalyticsService();
      final scenario = ConflictAlertScenario(
        userId: 'user-1',
        title: 'Quiet hours active',
        description: 'Sending now violates quiet hours',
        conflictStart: DateTime(2025, 1, 1, 23, 0),
        suggestionId: 'suggestion-quiet-hours',
      );

      when(
        () => notification.scheduleReminder(
          userId: any(named: 'userId'),
          when: any(named: 'when'),
          title: any(named: 'title'),
          body: any(named: 'body'),
          quietHours: any(named: 'quietHours'),
        ),
      ).thenAnswer((_) async => DateTime(2025, 1, 2, 6, 1));

      final container = ProviderContainer(
        overrides: [
          notificationServiceProvider.overrideWithValue(notification),
          assistantApiClientProvider.overrideWithValue(apiClient),
          appConfigProvider.overrideWithValue(config),
          analyticsServiceProvider.overrideWithValue(analytics),
        ],
      );
      addTearDown(container.dispose);

      final provider = conflictAlertControllerProvider(scenario);
      final controller = container.read(provider.notifier);

      await controller.scheduleAfterQuietHours();

      verify(
        () => notification.scheduleReminder(
          userId: 'user-1',
          when: scenario.conflictStart,
          title: scenario.title,
          body: scenario.description,
          quietHours: scenario.quietHours,
        ),
      ).called(1);

      final state = container.read(provider);
      expect(state?.statusLabel, 'Scheduled for 06:01');
      expect(state?.alternatives, isEmpty);

      verify(
        () => analytics.recordSuggestionDelivery(
          suggestionId: scenario.suggestionId!,
          suggestionType: 'conflict_alert',
          quietHoursConflict: true,
        ),
      ).called(1);

      verify(
        () => analytics.recordSuggestionFeedback(
          suggestionId: scenario.suggestionId!,
          action: SuggestionFeedbackAction.snoozed,
          responseLatency: any(named: 'responseLatency'),
          boundaryOverride: false,
          suggestionType: 'conflict_alert',
        ),
      ).called(1);
    },
  );

  test(
    'overrideQuietHours sends alert immediately and updates status',
    () async {
      final notification = _MockNotificationService();
      final apiClient = _MockAssistantApiClient();
      final analytics = _MockAnalyticsService();
      final scenario = ConflictAlertScenario(
        userId: 'user-1',
        title: 'Conflict alert',
        description: 'This conflicts with quiet hours.',
        conflictStart: DateTime(2025, 1, 1, 23, 0),
        suggestionId: 'suggestion-123',
      );

      when(
        () => notification.scheduleReminder(
          userId: any(named: 'userId'),
          when: any(named: 'when'),
          title: any(named: 'title'),
          body: any(named: 'body'),
          quietHours: any(named: 'quietHours'),
        ),
      ).thenAnswer((_) async => scenario.conflictStart);

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
          analyticsServiceProvider.overrideWithValue(analytics),
        ],
      );
      addTearDown(container.dispose);

      final provider = conflictAlertControllerProvider(scenario);
      final controller = container.read(provider.notifier);

      await controller.overrideQuietHours();

      verify(
        () => apiClient.enqueueAlert(
          userId: 'user-1',
          priority: 'high',
          title: scenario.title,
          body: scenario.description,
          suggestionId: scenario.suggestionId,
          quietHoursOverride: true,
          expiresAt: any(named: 'expiresAt'),
          serviceToken: 'service-token',
        ),
      ).called(1);

      final state = container.read(provider);
      expect(state?.statusLabel, 'Override sent · user notified');
      expect(state?.alternatives, isEmpty);

      verify(
        () => analytics.recordSuggestionDelivery(
          suggestionId: scenario.suggestionId!,
          suggestionType: 'conflict_alert',
          quietHoursConflict: false,
        ),
      ).called(1);

      verify(
        () => analytics.recordSuggestionFeedback(
          suggestionId: scenario.suggestionId!,
          action: SuggestionFeedbackAction.boundaryOverride,
          responseLatency: any(named: 'responseLatency'),
          boundaryOverride: true,
          suggestionType: 'conflict_alert',
        ),
      ).called(1);
    },
  );

  test('dismiss logs decline analytics event', () async {
    final notification = _MockNotificationService();
    final apiClient = _MockAssistantApiClient();
    final analytics = _MockAnalyticsService();
    final scenario = ConflictAlertScenario(
      userId: 'user-1',
      title: 'Conflict alert',
      description: 'Conflict description',
      conflictStart: DateTime(2025, 1, 1, 20, 0),
      suggestionId: 'suggestion-dismiss',
    );

    final container = ProviderContainer(
      overrides: [
        notificationServiceProvider.overrideWithValue(notification),
        assistantApiClientProvider.overrideWithValue(apiClient),
        appConfigProvider.overrideWithValue(config),
        analyticsServiceProvider.overrideWithValue(analytics),
      ],
    );
    addTearDown(container.dispose);

    final provider = conflictAlertControllerProvider(scenario);
    container.read(provider.notifier).dismiss();

    verify(
      () => analytics.recordSuggestionDelivery(
        suggestionId: scenario.suggestionId!,
        suggestionType: 'conflict_alert',
        quietHoursConflict: false,
      ),
    ).called(1);

    verify(
      () => analytics.recordSuggestionFeedback(
        suggestionId: scenario.suggestionId!,
        action: SuggestionFeedbackAction.declined,
        responseLatency: any(named: 'responseLatency'),
        boundaryOverride: false,
        suggestionType: 'conflict_alert',
      ),
    ).called(1);
  });
}
