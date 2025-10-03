import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Personal AI Assistant'**
  String get appTitle;

  /// No description provided for @homeToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get homeToday;

  /// No description provided for @homeLoadingPlan.
  ///
  /// In en, this message translates to:
  /// **'Fetching your plan...'**
  String get homeLoadingPlan;

  /// No description provided for @homeSampleGreeting.
  ///
  /// In en, this message translates to:
  /// **'Good morning, Casey'**
  String get homeSampleGreeting;

  /// No description provided for @homeSampleSummary.
  ///
  /// In en, this message translates to:
  /// **'Morning focus block at 09:30. Two high-priority follow-ups ready.'**
  String get homeSampleSummary;

  /// No description provided for @homeSampleAgendaTitle.
  ///
  /// In en, this message translates to:
  /// **'Agenda'**
  String get homeSampleAgendaTitle;

  /// No description provided for @homeSamplePlanTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily plan'**
  String get homeSamplePlanTitle;

  /// No description provided for @homeSampleSuggestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Assistant suggestions'**
  String get homeSampleSuggestionsTitle;

  /// No description provided for @homeSampleFocusTitle.
  ///
  /// In en, this message translates to:
  /// **'Focus tasks'**
  String get homeSampleFocusTitle;

  /// No description provided for @homeSampleSuggestionHoldSeat.
  ///
  /// In en, this message translates to:
  /// **'Hold seat for Seattle flight'**
  String get homeSampleSuggestionHoldSeat;

  /// No description provided for @homeSampleSuggestionHoldSeatDetail.
  ///
  /// In en, this message translates to:
  /// **'Flight UA 455 still unconfirmed. Reserve 18:15 departure?'**
  String get homeSampleSuggestionHoldSeatDetail;

  /// No description provided for @homeSampleSuggestionHoldSeatAction.
  ///
  /// In en, this message translates to:
  /// **'Hold seat'**
  String get homeSampleSuggestionHoldSeatAction;

  /// No description provided for @homeSampleSuggestionPrep.
  ///
  /// In en, this message translates to:
  /// **'Prepare talking points'**
  String get homeSampleSuggestionPrep;

  /// No description provided for @homeSampleSuggestionPrepDetail.
  ///
  /// In en, this message translates to:
  /// **'Review churn metrics before leadership sync.'**
  String get homeSampleSuggestionPrepDetail;

  /// No description provided for @homeSampleSuggestionPrepAction.
  ///
  /// In en, this message translates to:
  /// **'Open summary'**
  String get homeSampleSuggestionPrepAction;

  /// No description provided for @homeSampleFocusApproval.
  ///
  /// In en, this message translates to:
  /// **'Approve security review summary'**
  String get homeSampleFocusApproval;

  /// No description provided for @homeSampleFocusApprovalStatus.
  ///
  /// In en, this message translates to:
  /// **'Due today · Assigned to you'**
  String get homeSampleFocusApprovalStatus;

  /// No description provided for @homeSampleFocusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft Q3 OKR recap'**
  String get homeSampleFocusDraft;

  /// No description provided for @homeSampleFocusDraftStatus.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get homeSampleFocusDraftStatus;

  /// No description provided for @conflictQuietHoursTitle.
  ///
  /// In en, this message translates to:
  /// **'Quiet hours active'**
  String get conflictQuietHoursTitle;

  /// No description provided for @conflictQuietHoursDescription.
  ///
  /// In en, this message translates to:
  /// **'Sending now would break Casey\'s quiet hours.'**
  String get conflictQuietHoursDescription;

  /// No description provided for @conflictScheduleStatus.
  ///
  /// In en, this message translates to:
  /// **'Scheduled for {time}'**
  String conflictScheduleStatus(String time);

  /// No description provided for @conflictOverrideStatus.
  ///
  /// In en, this message translates to:
  /// **'Override sent · user notified'**
  String get conflictOverrideStatus;

  /// No description provided for @conflictOverrideFailedStatus.
  ///
  /// In en, this message translates to:
  /// **'Override failed · {error}'**
  String conflictOverrideFailedStatus(String error);

  /// No description provided for @conflictScheduleAfterQuietHours.
  ///
  /// In en, this message translates to:
  /// **'Schedule after quiet hours'**
  String get conflictScheduleAfterQuietHours;

  /// No description provided for @conflictScheduleLater.
  ///
  /// In en, this message translates to:
  /// **'Schedule later'**
  String get conflictScheduleLater;

  /// No description provided for @conflictSendAnyway.
  ///
  /// In en, this message translates to:
  /// **'Send anyway'**
  String get conflictSendAnyway;

  /// No description provided for @conflictDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get conflictDismiss;

  /// No description provided for @conflictContextNote.
  ///
  /// In en, this message translates to:
  /// **'Quiet hours end at {time} in {timeZone}.'**
  String conflictContextNote(String time, String timeZone);

  /// No description provided for @commonNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get commonNext;

  /// No description provided for @commonFinish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get commonFinish;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get commonNone;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Personal AI Assistant'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We will personalize your daily support, collect only what you approve, and allow you to adjust anytime.'**
  String get onboardingWelcomeSubtitle;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingGetStarted;

  /// No description provided for @onboardingLocaleTitle.
  ///
  /// In en, this message translates to:
  /// **'Set your preferred language'**
  String get onboardingLocaleTitle;

  /// No description provided for @onboardingLocaleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Localization helps the assistant tailor phrasing and summaries. You can change it anytime in settings.'**
  String get onboardingLocaleSubtitle;

  /// No description provided for @onboardingChooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get onboardingChooseLanguage;

  /// No description provided for @onboardingLanguageSet.
  ///
  /// In en, this message translates to:
  /// **'Language set to {language}'**
  String onboardingLanguageSet(String language);

  /// No description provided for @onboardingChannelsTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how you would like to receive updates'**
  String get onboardingChannelsTitle;

  /// No description provided for @onboardingCriticalAlertsTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow critical alerts'**
  String get onboardingCriticalAlertsTitle;

  /// No description provided for @onboardingCriticalAlertsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'For urgent conflicts and time-sensitive nudges'**
  String get onboardingCriticalAlertsSubtitle;

  /// No description provided for @onboardingQuietHoursTitle.
  ///
  /// In en, this message translates to:
  /// **'Set quiet hours'**
  String get onboardingQuietHoursTitle;

  /// No description provided for @onboardingQuietHoursSubtitle.
  ///
  /// In en, this message translates to:
  /// **'During quiet hours the assistant will pause non-critical notifications.'**
  String get onboardingQuietHoursSubtitle;

  /// No description provided for @onboardingQuietStartLabel.
  ///
  /// In en, this message translates to:
  /// **'Start (HH:MM)'**
  String get onboardingQuietStartLabel;

  /// No description provided for @onboardingQuietEndLabel.
  ///
  /// In en, this message translates to:
  /// **'End (HH:MM)'**
  String get onboardingQuietEndLabel;

  /// No description provided for @onboardingAddBoundary.
  ///
  /// In en, this message translates to:
  /// **'Add boundary topic'**
  String get onboardingAddBoundary;

  /// No description provided for @onboardingBoundaryHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., finances, personal health'**
  String get onboardingBoundaryHint;

  /// No description provided for @onboardingSaveBoundary.
  ///
  /// In en, this message translates to:
  /// **'Save boundary'**
  String get onboardingSaveBoundary;

  /// No description provided for @onboardingConsentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Review privacy preferences'**
  String get onboardingConsentsTitle;

  /// No description provided for @onboardingAcceptTos.
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms of Service'**
  String get onboardingAcceptTos;

  /// No description provided for @onboardingTelemetryTitle.
  ///
  /// In en, this message translates to:
  /// **'I allow anonymized telemetry'**
  String get onboardingTelemetryTitle;

  /// No description provided for @onboardingTelemetrySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Used to improve assistant performance and reliability'**
  String get onboardingTelemetrySubtitle;

  /// No description provided for @onboardingViewExport.
  ///
  /// In en, this message translates to:
  /// **'View data export options'**
  String get onboardingViewExport;

  /// No description provided for @onboardingExportDetails.
  ///
  /// In en, this message translates to:
  /// **'Export data as JSON or ICS.\nDelete requests honored within 72 hours.'**
  String get onboardingExportDetails;

  /// No description provided for @onboardingSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'You are all set!'**
  String get onboardingSummaryTitle;

  /// No description provided for @onboardingOfflineBanner.
  ///
  /// In en, this message translates to:
  /// **'Offline mode ready — last plan cached'**
  String get onboardingOfflineBanner;

  /// No description provided for @onboardingCriticalAllowed.
  ///
  /// In en, this message translates to:
  /// **'Allowed'**
  String get onboardingCriticalAllowed;

  /// No description provided for @onboardingCriticalMuted.
  ///
  /// In en, this message translates to:
  /// **'Muted'**
  String get onboardingCriticalMuted;

  /// No description provided for @onboardingTelemetryEnabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get onboardingTelemetryEnabled;

  /// No description provided for @onboardingTelemetryDisabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get onboardingTelemetryDisabled;

  /// No description provided for @onboardingSummaryLocale.
  ///
  /// In en, this message translates to:
  /// **'Locale: {locale}'**
  String onboardingSummaryLocale(String locale);

  /// No description provided for @onboardingSummaryChannels.
  ///
  /// In en, this message translates to:
  /// **'Channels: {channels}'**
  String onboardingSummaryChannels(String channels);

  /// No description provided for @onboardingSummaryCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical alerts: {status}'**
  String onboardingSummaryCritical(String status);

  /// No description provided for @onboardingSummaryQuietHours.
  ///
  /// In en, this message translates to:
  /// **'Quiet hours: {start} — {end}'**
  String onboardingSummaryQuietHours(String start, String end);

  /// No description provided for @onboardingSummaryTelemetry.
  ///
  /// In en, this message translates to:
  /// **'Telemetry: {status}'**
  String onboardingSummaryTelemetry(String status);

  /// No description provided for @onboardingSummaryBoundaries.
  ///
  /// In en, this message translates to:
  /// **'Boundaries: {boundaries}'**
  String onboardingSummaryBoundaries(String boundaries);

  /// No description provided for @onboardingLocaleEnglishLabel.
  ///
  /// In en, this message translates to:
  /// **'English (US)'**
  String get onboardingLocaleEnglishLabel;

  /// No description provided for @onboardingLocaleEnglishName.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get onboardingLocaleEnglishName;

  /// No description provided for @onboardingLocaleSpanishLabel.
  ///
  /// In en, this message translates to:
  /// **'Español (LatAm)'**
  String get onboardingLocaleSpanishLabel;

  /// No description provided for @onboardingLocaleSpanishName.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get onboardingLocaleSpanishName;

  /// No description provided for @onboardingLocaleGermanLabel.
  ///
  /// In en, this message translates to:
  /// **'Deutsch (DE)'**
  String get onboardingLocaleGermanLabel;

  /// No description provided for @onboardingLocaleGermanName.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get onboardingLocaleGermanName;

  /// No description provided for @onboardingChannelCalendar.
  ///
  /// In en, this message translates to:
  /// **'Enable Calendar Sync'**
  String get onboardingChannelCalendar;

  /// No description provided for @onboardingChannelGmail.
  ///
  /// In en, this message translates to:
  /// **'Enable Gmail Summaries'**
  String get onboardingChannelGmail;

  /// No description provided for @onboardingChannelPush.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get onboardingChannelPush;

  /// No description provided for @onboardingStepWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get onboardingStepWelcome;

  /// No description provided for @onboardingStepLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get onboardingStepLanguage;

  /// No description provided for @onboardingStepChannels.
  ///
  /// In en, this message translates to:
  /// **'Notification channels'**
  String get onboardingStepChannels;

  /// No description provided for @onboardingStepQuietHours.
  ///
  /// In en, this message translates to:
  /// **'Quiet hours'**
  String get onboardingStepQuietHours;

  /// No description provided for @onboardingStepConsents.
  ///
  /// In en, this message translates to:
  /// **'Privacy consents'**
  String get onboardingStepConsents;

  /// No description provided for @onboardingStepSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get onboardingStepSummary;

  /// No description provided for @summaryFollowUpsTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s follow-ups'**
  String get summaryFollowUpsTitle;

  /// No description provided for @summarySignalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Signals monitored'**
  String get summarySignalsTitle;

  /// No description provided for @summaryOfflineBanner.
  ///
  /// In en, this message translates to:
  /// **'Offline summary cached'**
  String get summaryOfflineBanner;

  /// No description provided for @summaryConfidenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Confidence: {value}'**
  String summaryConfidenceLabel(String value);

  /// No description provided for @summarySourcesCount.
  ///
  /// In en, this message translates to:
  /// **'Sources ({count})'**
  String summarySourcesCount(int count);

  /// No description provided for @summaryViewSources.
  ///
  /// In en, this message translates to:
  /// **'View sources'**
  String get summaryViewSources;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en', 'es', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
