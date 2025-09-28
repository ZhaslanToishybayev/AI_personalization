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
}
