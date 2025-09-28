// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Persönlicher KI-Assistent';

  @override
  String get homeToday => 'Heute';

  @override
  String get homeLoadingPlan => 'Tagesplan wird geladen...';

  @override
  String get homeSampleGreeting => 'Guten Morgen, Casey';

  @override
  String get homeSampleSummary =>
      'Fokusblock um 09:30. Zwei dringende Nachverfolgungen bereit.';

  @override
  String get homeSampleAgendaTitle => 'Tagesordnung';

  @override
  String get homeSamplePlanTitle => 'Tagesplan';

  @override
  String get homeSampleSuggestionsTitle => 'Assistentenempfehlungen';

  @override
  String get homeSampleFocusTitle => 'Fokustasks';

  @override
  String get homeSampleSuggestionHoldSeat =>
      'Sitzplatz für Seattle-Flug reservieren';

  @override
  String get homeSampleSuggestionHoldSeatDetail =>
      'Flug UA 455 ist noch nicht bestätigt. Abflug um 18:15 reservieren?';

  @override
  String get homeSampleSuggestionHoldSeatAction => 'Sitzplatz reservieren';

  @override
  String get homeSampleSuggestionPrep => 'Gesprächspunkte vorbereiten';

  @override
  String get homeSampleSuggestionPrepDetail =>
      'Prüfe die Churn-Metriken vor dem Leadership-Meeting.';

  @override
  String get homeSampleSuggestionPrepAction => 'Zusammenfassung öffnen';

  @override
  String get homeSampleFocusApproval =>
      'Zusammenfassung der Sicherheitsprüfung freigeben';

  @override
  String get homeSampleFocusApprovalStatus => 'Fällig heute · Dir zugewiesen';

  @override
  String get homeSampleFocusDraft => 'OKR-Rückblick Q3 verfassen';

  @override
  String get homeSampleFocusDraftStatus => 'In Arbeit';

  @override
  String get conflictQuietHoursTitle => 'Ruhezeiten aktiv';

  @override
  String get conflictQuietHoursDescription =>
      'Senden würde Caseys Ruhezeiten verletzen.';

  @override
  String conflictScheduleStatus(String time) {
    return 'Geplant für $time';
  }

  @override
  String get conflictOverrideStatus =>
      'Override gesendet · Nutzer benachrichtigt';

  @override
  String conflictOverrideFailedStatus(String error) {
    return 'Override fehlgeschlagen · $error';
  }

  @override
  String get conflictScheduleAfterQuietHours => 'Nach Ruhezeiten planen';

  @override
  String get conflictScheduleLater => 'Später planen';

  @override
  String get conflictSendAnyway => 'Trotzdem senden';

  @override
  String get conflictDismiss => 'Schließen';

  @override
  String conflictContextNote(String time, String timeZone) {
    return 'Ruhezeiten enden um $time in $timeZone.';
  }

  @override
  String get commonNext => 'Weiter';

  @override
  String get commonFinish => 'Fertigstellen';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonNone => 'Keine';

  @override
  String get onboardingWelcomeTitle => 'Willkommen beim Personal AI Assistant';

  @override
  String get onboardingWelcomeSubtitle =>
      'Wir personalisieren deine tägliche Unterstützung, sammeln nur, was du freigibst, und du kannst alles jederzeit anpassen.';

  @override
  String get onboardingGetStarted => 'Loslegen';

  @override
  String get onboardingLocaleTitle => 'Lege deine bevorzugte Sprache fest';

  @override
  String get onboardingLocaleSubtitle =>
      'Die Lokalisierung hilft dem Assistenten, Formulierungen und Zusammenfassungen anzupassen. Du kannst sie jederzeit in den Einstellungen ändern.';

  @override
  String get onboardingChooseLanguage => 'Sprache wählen';

  @override
  String onboardingLanguageSet(String language) {
    return 'Sprache festgelegt auf $language';
  }

  @override
  String get onboardingChannelsTitle =>
      'Wähle, wie du Updates erhalten möchtest';

  @override
  String get onboardingCriticalAlertsTitle => 'Kritische Hinweise zulassen';

  @override
  String get onboardingCriticalAlertsSubtitle =>
      'Für dringende Konflikte und zeitkritische Erinnerungen';

  @override
  String get onboardingQuietHoursTitle => 'Ruhezeiten festlegen';

  @override
  String get onboardingQuietHoursSubtitle =>
      'Während der Ruhezeiten pausiert der Assistent nicht-kritische Benachrichtigungen.';

  @override
  String get onboardingQuietStartLabel => 'Beginn (HH:MM)';

  @override
  String get onboardingQuietEndLabel => 'Ende (HH:MM)';

  @override
  String get onboardingAddBoundary => 'Grenzthema hinzufügen';

  @override
  String get onboardingBoundaryHint => 'z. B. Finanzen, persönliche Gesundheit';

  @override
  String get onboardingSaveBoundary => 'Grenze speichern';

  @override
  String get onboardingConsentsTitle => 'Datenschutz-Einstellungen prüfen';

  @override
  String get onboardingAcceptTos => 'Ich stimme den Nutzungsbedingungen zu';

  @override
  String get onboardingTelemetryTitle => 'Ich erlaube anonymisierte Telemetrie';

  @override
  String get onboardingTelemetrySubtitle =>
      'Dient zur Verbesserung der Leistung und Zuverlässigkeit des Assistenten';

  @override
  String get onboardingViewExport => 'Datenexport-Optionen anzeigen';

  @override
  String get onboardingExportDetails =>
      'Daten als JSON oder ICS exportieren.\nLöschanfragen werden innerhalb von 72 Stunden bearbeitet.';

  @override
  String get onboardingSummaryTitle => 'Alles erledigt!';

  @override
  String get onboardingOfflineBanner =>
      'Offline-Modus bereit – letzter Plan zwischengespeichert';

  @override
  String get onboardingCriticalAllowed => 'Zugelassen';

  @override
  String get onboardingCriticalMuted => 'Stummgeschaltet';

  @override
  String get onboardingTelemetryEnabled => 'Aktiviert';

  @override
  String get onboardingTelemetryDisabled => 'Deaktiviert';

  @override
  String onboardingSummaryLocale(String locale) {
    return 'Sprache: $locale';
  }

  @override
  String onboardingSummaryChannels(String channels) {
    return 'Kanäle: $channels';
  }

  @override
  String onboardingSummaryCritical(String status) {
    return 'Kritische Hinweise: $status';
  }

  @override
  String onboardingSummaryQuietHours(String start, String end) {
    return 'Ruhezeiten: $start — $end';
  }

  @override
  String onboardingSummaryTelemetry(String status) {
    return 'Telemetrie: $status';
  }

  @override
  String onboardingSummaryBoundaries(String boundaries) {
    return 'Grenzen: $boundaries';
  }

  @override
  String get onboardingLocaleEnglishLabel => 'Englisch (USA)';

  @override
  String get onboardingLocaleEnglishName => 'Englisch';

  @override
  String get onboardingLocaleSpanishLabel => 'Spanisch (LatAm)';

  @override
  String get onboardingLocaleSpanishName => 'Spanisch';

  @override
  String get onboardingLocaleGermanLabel => 'Deutsch (DE)';

  @override
  String get onboardingLocaleGermanName => 'Deutsch';

  @override
  String get onboardingChannelCalendar => 'Kalendersynchronisierung aktivieren';

  @override
  String get onboardingChannelGmail => 'Gmail-Zusammenfassungen aktivieren';

  @override
  String get onboardingChannelPush => 'Push-Benachrichtigungen';

  @override
  String get onboardingStepWelcome => 'Willkommen';

  @override
  String get onboardingStepLanguage => 'Sprache';

  @override
  String get onboardingStepChannels => 'Benachrichtigungskanäle';

  @override
  String get onboardingStepQuietHours => 'Ruhezeiten';

  @override
  String get onboardingStepConsents => 'Zustimmungen';

  @override
  String get onboardingStepSummary => 'Zusammenfassung';

  @override
  String get summaryFollowUpsTitle => 'Heutige Nachverfolgungen';

  @override
  String get summarySignalsTitle => 'Überwachte Signale';

  @override
  String get summaryOfflineBanner =>
      'Offline-Zusammenfassung zwischengespeichert';

  @override
  String summaryConfidenceLabel(String value) {
    return 'Vertrauen: $value';
  }

  @override
  String summarySourcesCount(int count) {
    return 'Quellen ($count)';
  }

  @override
  String get summaryViewSources => 'Quellen anzeigen';
}
