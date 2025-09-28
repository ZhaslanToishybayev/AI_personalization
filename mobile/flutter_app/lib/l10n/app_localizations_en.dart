// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Personal AI Assistant';

  @override
  String get homeToday => 'Today';

  @override
  String get homeLoadingPlan => 'Fetching your plan...';

  @override
  String get homeSampleGreeting => 'Good morning, Casey';

  @override
  String get homeSampleSummary =>
      'Morning focus block at 09:30. Two high-priority follow-ups ready.';

  @override
  String get homeSampleAgendaTitle => 'Agenda';

  @override
  String get homeSamplePlanTitle => 'Daily plan';

  @override
  String get homeSampleSuggestionsTitle => 'Assistant suggestions';

  @override
  String get homeSampleFocusTitle => 'Focus tasks';

  @override
  String get homeSampleSuggestionHoldSeat => 'Hold seat for Seattle flight';

  @override
  String get homeSampleSuggestionHoldSeatDetail =>
      'Flight UA 455 still unconfirmed. Reserve 18:15 departure?';

  @override
  String get homeSampleSuggestionHoldSeatAction => 'Hold seat';

  @override
  String get homeSampleSuggestionPrep => 'Prepare talking points';

  @override
  String get homeSampleSuggestionPrepDetail =>
      'Review churn metrics before leadership sync.';

  @override
  String get homeSampleSuggestionPrepAction => 'Open summary';

  @override
  String get homeSampleFocusApproval => 'Approve security review summary';

  @override
  String get homeSampleFocusApprovalStatus => 'Due today · Assigned to you';

  @override
  String get homeSampleFocusDraft => 'Draft Q3 OKR recap';

  @override
  String get homeSampleFocusDraftStatus => 'In progress';

  @override
  String get conflictQuietHoursTitle => 'Quiet hours active';

  @override
  String get conflictQuietHoursDescription =>
      'Sending now would break Casey\'s quiet hours.';

  @override
  String conflictScheduleStatus(String time) {
    return 'Scheduled for $time';
  }

  @override
  String get conflictOverrideStatus => 'Override sent · user notified';

  @override
  String conflictOverrideFailedStatus(String error) {
    return 'Override failed · $error';
  }

  @override
  String get conflictScheduleAfterQuietHours => 'Schedule after quiet hours';

  @override
  String get conflictScheduleLater => 'Schedule later';

  @override
  String get conflictSendAnyway => 'Send anyway';

  @override
  String get conflictDismiss => 'Dismiss';

  @override
  String conflictContextNote(String time, String timeZone) {
    return 'Quiet hours end at $time in $timeZone.';
  }

  @override
  String get commonNext => 'Next';

  @override
  String get commonFinish => 'Finish';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonNone => 'None';

  @override
  String get onboardingWelcomeTitle => 'Welcome to Personal AI Assistant';

  @override
  String get onboardingWelcomeSubtitle =>
      'We will personalize your daily support, collect only what you approve, and allow you to adjust anytime.';

  @override
  String get onboardingGetStarted => 'Get started';

  @override
  String get onboardingLocaleTitle => 'Set your preferred language';

  @override
  String get onboardingLocaleSubtitle =>
      'Localization helps the assistant tailor phrasing and summaries. You can change it anytime in settings.';

  @override
  String get onboardingChooseLanguage => 'Choose language';

  @override
  String onboardingLanguageSet(String language) {
    return 'Language set to $language';
  }

  @override
  String get onboardingChannelsTitle =>
      'Choose how you would like to receive updates';

  @override
  String get onboardingCriticalAlertsTitle => 'Allow critical alerts';

  @override
  String get onboardingCriticalAlertsSubtitle =>
      'For urgent conflicts and time-sensitive nudges';

  @override
  String get onboardingQuietHoursTitle => 'Set quiet hours';

  @override
  String get onboardingQuietHoursSubtitle =>
      'During quiet hours the assistant will pause non-critical notifications.';

  @override
  String get onboardingQuietStartLabel => 'Start (HH:MM)';

  @override
  String get onboardingQuietEndLabel => 'End (HH:MM)';

  @override
  String get onboardingAddBoundary => 'Add boundary topic';

  @override
  String get onboardingBoundaryHint => 'e.g., finances, personal health';

  @override
  String get onboardingSaveBoundary => 'Save boundary';

  @override
  String get onboardingConsentsTitle => 'Review privacy preferences';

  @override
  String get onboardingAcceptTos => 'I agree to the Terms of Service';

  @override
  String get onboardingTelemetryTitle => 'I allow anonymized telemetry';

  @override
  String get onboardingTelemetrySubtitle =>
      'Used to improve assistant performance and reliability';

  @override
  String get onboardingViewExport => 'View data export options';

  @override
  String get onboardingExportDetails =>
      'Export data as JSON or ICS.\nDelete requests honored within 72 hours.';

  @override
  String get onboardingSummaryTitle => 'You are all set!';

  @override
  String get onboardingOfflineBanner => 'Offline mode ready — last plan cached';

  @override
  String get onboardingCriticalAllowed => 'Allowed';

  @override
  String get onboardingCriticalMuted => 'Muted';

  @override
  String get onboardingTelemetryEnabled => 'Enabled';

  @override
  String get onboardingTelemetryDisabled => 'Disabled';

  @override
  String onboardingSummaryLocale(String locale) {
    return 'Locale: $locale';
  }

  @override
  String onboardingSummaryChannels(String channels) {
    return 'Channels: $channels';
  }

  @override
  String onboardingSummaryCritical(String status) {
    return 'Critical alerts: $status';
  }

  @override
  String onboardingSummaryQuietHours(String start, String end) {
    return 'Quiet hours: $start — $end';
  }

  @override
  String onboardingSummaryTelemetry(String status) {
    return 'Telemetry: $status';
  }

  @override
  String onboardingSummaryBoundaries(String boundaries) {
    return 'Boundaries: $boundaries';
  }

  @override
  String get onboardingLocaleEnglishLabel => 'English (US)';

  @override
  String get onboardingLocaleEnglishName => 'English';

  @override
  String get onboardingLocaleSpanishLabel => 'Español (LatAm)';

  @override
  String get onboardingLocaleSpanishName => 'Spanish';

  @override
  String get onboardingLocaleGermanLabel => 'Deutsch (DE)';

  @override
  String get onboardingLocaleGermanName => 'German';

  @override
  String get onboardingChannelCalendar => 'Enable Calendar Sync';

  @override
  String get onboardingChannelGmail => 'Enable Gmail Summaries';

  @override
  String get onboardingChannelPush => 'Push Notifications';

  @override
  String get onboardingStepWelcome => 'Welcome';

  @override
  String get onboardingStepLanguage => 'Language';

  @override
  String get onboardingStepChannels => 'Notification channels';

  @override
  String get onboardingStepQuietHours => 'Quiet hours';

  @override
  String get onboardingStepConsents => 'Privacy consents';

  @override
  String get onboardingStepSummary => 'Summary';

  @override
  String get summaryFollowUpsTitle => 'Today\'s follow-ups';

  @override
  String get summarySignalsTitle => 'Signals monitored';

  @override
  String get summaryOfflineBanner => 'Offline summary cached';

  @override
  String summaryConfidenceLabel(String value) {
    return 'Confidence: $value';
  }

  @override
  String summarySourcesCount(int count) {
    return 'Sources ($count)';
  }

  @override
  String get summaryViewSources => 'View sources';
}
