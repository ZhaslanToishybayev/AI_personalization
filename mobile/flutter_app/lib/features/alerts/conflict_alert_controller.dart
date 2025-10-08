import 'package:flutter/material.dart';
import 'package:flutter_app/core/analytics/analytics_service.dart';
import 'package:flutter_app/core/config/app_config.dart';
import 'package:flutter_app/data/assistant_api_client.dart';
import 'package:flutter_app/data/assistant_api_client_provider.dart';
import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/features/alerts/conflict_alert_banner.dart';
import 'package:flutter_app/services/notification_service.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ConflictAlertScenario {
  const ConflictAlertScenario({
    required this.userId,
    required this.title,
    required this.description,
    required this.conflictStart,
    this.contextNote,
    this.suggestionId,
    this.quietHours,
    this.tone = GlassTone.dusk,
    this.scheduleAfterLabel = 'Schedule after quiet hours',
    this.scheduleLaterLabel = 'Schedule later',
    this.sendAnywayLabel = 'Send anyway',
    this.dismissLabel = 'Dismiss',
    this.overrideSuccessLabel = 'Override sent · user notified',
    this.overrideFailureBuilder = _defaultOverrideFailure,
    this.scheduleStatusBuilder = _defaultScheduleStatus,
  });

  final String userId;
  final String title;
  final String description;
  final DateTime conflictStart;
  final String? contextNote;
  final String? suggestionId;
  final QuietHours? quietHours;
  final GlassTone tone;
  final String scheduleAfterLabel;
  final String scheduleLaterLabel;
  final String sendAnywayLabel;
  final String dismissLabel;
  final String overrideSuccessLabel;
  final String Function(String error) overrideFailureBuilder;
  final String Function(String time) scheduleStatusBuilder;

  static String _defaultOverrideFailure(String error) =>
      'Override failed · $error';
  static String _defaultScheduleStatus(String time) => 'Scheduled for $time';
}

final conflictAlertControllerProvider = StateNotifierProvider.autoDispose
    .family<
      ConflictAlertController,
      ConflictAlertViewModel?,
      ConflictAlertScenario
    >((ref, scenario) {
      final notificationService = ref.watch(notificationServiceProvider);
      final apiClient = ref.watch(assistantApiClientProvider);
      final config = ref.watch(appConfigProvider);
      final analytics = ref.watch(analyticsServiceProvider);
      return ConflictAlertController(
        scenario: scenario,
        notificationService: notificationService,
        apiClient: apiClient,
        serviceToken: config.serviceAuthToken,
        analytics: analytics,
      );
    });

class ConflictAlertController extends StateNotifier<ConflictAlertViewModel?> {
  ConflictAlertController({
    required this.scenario,
    required NotificationService notificationService,
    required AssistantApiClient apiClient,
    required this.serviceToken,
    AnalyticsService? analytics,
    DateTime Function()? clock,
  }) : _notificationService = notificationService,
       _apiClient = apiClient,
       _analytics = analytics ?? AnalyticsService(),
       _clock = clock ?? DateTime.now,
       _presentedAt = (clock ?? DateTime.now)(),
       super(null) {
    state = _buildViewModel();
  }

  final ConflictAlertScenario scenario;
  final NotificationService _notificationService;
  final AssistantApiClient _apiClient;
  final DateTime Function() _clock;
  final AnalyticsService _analytics;
  final String serviceToken;
  final DateTime _presentedAt;
  bool _deliveryLogged = false;

  bool get _hasQuietHours => scenario.quietHours != null;

  ConflictAlertViewModel _buildViewModel({String? status}) {
    final primaryLabel = _hasQuietHours
        ? scenario.scheduleAfterLabel
        : scenario.scheduleLaterLabel;
    return ConflictAlertViewModel(
      title: scenario.title,
      description: scenario.description,
      contextNote: scenario.contextNote,
      statusLabel: status,
      tone: scenario.tone.name,
      alternatives: [
        ConflictAlternative(
          label: primaryLabel,
          icon: Icons.schedule,
          onSelected: scheduleAfterQuietHours,
        ),
        ConflictAlternative(
          label: scenario.sendAnywayLabel,
          icon: Icons.send,
          onSelected: overrideQuietHours,
        ),
      ],
      onDismissed: dismiss,
      dismissLabel: scenario.dismissLabel,
    );
  }

  Future<void> scheduleAfterQuietHours() async {
    final scheduledFor = await _notificationService.scheduleReminder(
      userId: scenario.userId,
      when: scenario.conflictStart,
      title: scenario.title,
      body: scenario.description,
      quietHours: scenario.quietHours,
    );
    final status = scenario.scheduleStatusBuilder(
      DateFormat.Hm().format(scheduledFor),
    );
    state = state?.copyWith(
      statusLabel: status,
      alternatives: const [],
      onDismissed: dismiss,
    );
    _logDeliveryIfNeeded(quietHoursConflict: true);
    _recordFeedback(SuggestionFeedbackAction.snoozed);
  }

  Future<void> overrideQuietHours() async {
    try {
      await _apiClient.enqueueAlert(
        userId: scenario.userId,
        priority: 'high',
        title: scenario.title,
        body: scenario.description,
        suggestionId: scenario.suggestionId,
        quietHoursOverride: true,
        serviceToken: serviceToken,
        expiresAt: _clock().add(const Duration(hours: 1)),
      );
      state = state?.copyWith(
        statusLabel: scenario.overrideSuccessLabel,
        alternatives: const [],
        onDismissed: dismiss,
      );
      _logDeliveryIfNeeded(quietHoursConflict: false);
      _recordFeedback(SuggestionFeedbackAction.boundaryOverride);
    } catch (error) {
      final message = scenario.overrideFailureBuilder(error.toString());
      state = state?.copyWith(
        statusLabel: message,
        alternatives: const [],
        onDismissed: dismiss,
      );
    }
  }

  void dismiss() {
    _logDeliveryIfNeeded(quietHoursConflict: false);
    _recordFeedback(SuggestionFeedbackAction.declined);
    state = null;
  }

  void _logDeliveryIfNeeded({required bool quietHoursConflict}) {
    if (_deliveryLogged) {
      return;
    }
    final suggestionId = scenario.suggestionId;
    if (suggestionId == null) {
      return;
    }
    _analytics.recordSuggestionDelivery(
      suggestionId: suggestionId,
      suggestionType: 'conflict_alert',
      quietHoursConflict: quietHoursConflict,
    );
    _deliveryLogged = true;
  }

  void _recordFeedback(SuggestionFeedbackAction action) {
    final suggestionId = scenario.suggestionId;
    if (suggestionId == null) {
      return;
    }
    final latency = _clock().difference(_presentedAt);
    final boundaryOverride =
        action == SuggestionFeedbackAction.boundaryOverride;
    _analytics.recordSuggestionFeedback(
      suggestionId: suggestionId,
      action: action,
      responseLatency: latency,
      boundaryOverride: boundaryOverride,
      suggestionType: 'conflict_alert',
    );
  }
}
