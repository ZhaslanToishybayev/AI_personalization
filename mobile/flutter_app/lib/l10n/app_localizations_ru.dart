// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Персональный AI Ассистент';

  @override
  String get homeToday => 'Сегодня';

  @override
  String get homeLoadingPlan => 'Загружаю ваш план...';

  @override
  String get homeSampleGreeting => 'Доброе утро, Кейси';

  @override
  String get homeSampleSummary =>
      'Утренний фокус-блок в 09:30. Два приоритетных дела готовы.';

  @override
  String get homeSampleAgendaTitle => 'Повестка';

  @override
  String get homeSamplePlanTitle => 'План на день';

  @override
  String get homeSampleSuggestionsTitle => 'Предложения ассистента';

  @override
  String get homeSampleFocusTitle => 'Фокус-задачи';

  @override
  String get homeSampleSuggestionHoldSeat =>
      'Забронировать место на рейс в Сиэтл';

  @override
  String get homeSampleSuggestionHoldSeatDetail =>
      'Рейс UA 455 всё ещё не подтверждён. Забронировать вылет в 18:15?';

  @override
  String get homeSampleSuggestionHoldSeatAction => 'Забронировать место';

  @override
  String get homeSampleSuggestionPrep => 'Подготовить тезисы';

  @override
  String get homeSampleSuggestionPrepDetail =>
      'Просмотрите метрики оттока перед созвоном с руководством.';

  @override
  String get homeSampleSuggestionPrepAction => 'Открыть сводку';

  @override
  String get homeSampleFocusApproval =>
      'Утвердить сводку по проверке безопасности';

  @override
  String get homeSampleFocusApprovalStatus => 'Срок сегодня · Назначено вам';

  @override
  String get homeSampleFocusDraft => 'Составить итоги OKR за Q3';

  @override
  String get homeSampleFocusDraftStatus => 'В процессе';

  @override
  String get conflictQuietHoursTitle => 'Активны тихие часы';

  @override
  String get conflictQuietHoursDescription =>
      'Отправка сейчас нарушит тихие часы Кейси.';

  @override
  String conflictScheduleStatus(String time) {
    return 'Запланировано на $time';
  }

  @override
  String get conflictOverrideStatus =>
      'Переопределение отправлено · пользователь уведомлён';

  @override
  String conflictOverrideFailedStatus(String error) {
    return 'Переопределение не удалось · $error';
  }

  @override
  String get conflictScheduleAfterQuietHours =>
      'Запланировать после тихих часов';

  @override
  String get conflictScheduleLater => 'Запланировать позже';

  @override
  String get conflictSendAnyway => 'Всё равно отправить';

  @override
  String get conflictDismiss => 'Отклонить';

  @override
  String conflictContextNote(String time, String timeZone) {
    return 'Тихие часы заканчиваются в $time по часовому поясу $timeZone.';
  }

  @override
  String get commonNext => 'Далее';

  @override
  String get commonFinish => 'Завершить';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonNone => 'Нет';

  @override
  String get onboardingWelcomeTitle =>
      'Добро пожаловать в Персональный AI Ассистент';

  @override
  String get onboardingWelcomeSubtitle =>
      'Мы персонализируем вашу ежедневную поддержку, соберём только те данные, которые вы одобрите, и позволим вам изменить настройки в любое время.';

  @override
  String get onboardingGetStarted => 'Начать';

  @override
  String get onboardingLocaleTitle => 'Выберите предпочитаемый язык';

  @override
  String get onboardingLocaleSubtitle =>
      'Локализация помогает ассистенту адаптировать формулировки и сводки. Вы можете изменить язык в любое время в настройках.';

  @override
  String get onboardingChooseLanguage => 'Выбрать язык';

  @override
  String onboardingLanguageSet(String language) {
    return 'Язык установлен: $language';
  }

  @override
  String get onboardingChannelsTitle =>
      'Выберите, как вы хотите получать обновления';

  @override
  String get onboardingCriticalAlertsTitle => 'Разрешить критичные уведомления';

  @override
  String get onboardingCriticalAlertsSubtitle =>
      'Для срочных конфликтов и напоминаний с ограничением по времени';

  @override
  String get onboardingQuietHoursTitle => 'Установить тихие часы';

  @override
  String get onboardingQuietHoursSubtitle =>
      'В тихие часы ассистент приостановит некритичные уведомления.';

  @override
  String get onboardingQuietStartLabel => 'Начало (ЧЧ:ММ)';

  @override
  String get onboardingQuietEndLabel => 'Конец (ЧЧ:ММ)';

  @override
  String get onboardingAddBoundary => 'Добавить запретную тему';

  @override
  String get onboardingBoundaryHint => 'например, финансы, личное здоровье';

  @override
  String get onboardingSaveBoundary => 'Сохранить границу';

  @override
  String get onboardingConsentsTitle =>
      'Просмотрите настройки конфиденциальности';

  @override
  String get onboardingAcceptTos => 'Я согласен с Условиями использования';

  @override
  String get onboardingTelemetryTitle => 'Я разрешаю анонимную телеметрию';

  @override
  String get onboardingTelemetrySubtitle =>
      'Используется для улучшения производительности и надёжности ассистента';

  @override
  String get onboardingViewExport => 'Посмотреть варианты экспорта данных';

  @override
  String get onboardingExportDetails =>
      'Экспортировать данные в формате JSON или ICS.\nЗапросы на удаление обрабатываются в течение 72 часов.';

  @override
  String get onboardingSummaryTitle => 'Всё готово!';

  @override
  String get onboardingOfflineBanner =>
      'Офлайн-режим готов — последний план кэширован';

  @override
  String get onboardingCriticalAllowed => 'Разрешено';

  @override
  String get onboardingCriticalMuted => 'Отключено';

  @override
  String get onboardingTelemetryEnabled => 'Включено';

  @override
  String get onboardingTelemetryDisabled => 'Отключено';

  @override
  String onboardingSummaryLocale(String locale) {
    return 'Язык: $locale';
  }

  @override
  String onboardingSummaryChannels(String channels) {
    return 'Каналы: $channels';
  }

  @override
  String onboardingSummaryCritical(String status) {
    return 'Критичные уведомления: $status';
  }

  @override
  String onboardingSummaryQuietHours(String start, String end) {
    return 'Тихие часы: $start — $end';
  }

  @override
  String onboardingSummaryTelemetry(String status) {
    return 'Телеметрия: $status';
  }

  @override
  String onboardingSummaryBoundaries(String boundaries) {
    return 'Границы: $boundaries';
  }

  @override
  String get onboardingLocaleEnglishLabel => 'English (US)';

  @override
  String get onboardingLocaleEnglishName => 'Английский';

  @override
  String get onboardingLocaleSpanishLabel => 'Español (LatAm)';

  @override
  String get onboardingLocaleSpanishName => 'Испанский';

  @override
  String get onboardingLocaleGermanLabel => 'Deutsch (DE)';

  @override
  String get onboardingLocaleGermanName => 'Немецкий';

  @override
  String get onboardingChannelCalendar => 'Включить синхронизацию календаря';

  @override
  String get onboardingChannelGmail => 'Включить сводки Gmail';

  @override
  String get onboardingChannelPush => 'Push-уведомления';

  @override
  String get onboardingStepWelcome => 'Приветствие';

  @override
  String get onboardingStepLanguage => 'Язык';

  @override
  String get onboardingStepChannels => 'Каналы уведомлений';

  @override
  String get onboardingStepQuietHours => 'Тихие часы';

  @override
  String get onboardingStepConsents => 'Согласия на конфиденциальность';

  @override
  String get onboardingStepSummary => 'Сводка';

  @override
  String get summaryFollowUpsTitle => 'Дела на сегодня';

  @override
  String get summarySignalsTitle => 'Отслеживаемые сигналы';

  @override
  String get summaryOfflineBanner => 'Офлайн-сводка кэширована';

  @override
  String summaryConfidenceLabel(String value) {
    return 'Уверенность: $value';
  }

  @override
  String summarySourcesCount(int count) {
    return 'Источники ($count)';
  }

  @override
  String get summaryViewSources => 'Просмотреть источники';
}
