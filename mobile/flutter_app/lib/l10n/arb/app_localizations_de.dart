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
}
