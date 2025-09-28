// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Asistente personal de IA';

  @override
  String get homeToday => 'Hoy';

  @override
  String get homeLoadingPlan => 'Obteniendo tu plan...';

  @override
  String get homeSampleGreeting => 'Buenos días, Casey';

  @override
  String get homeSampleSummary =>
      'Bloque de enfoque a las 09:30. Dos seguimientos de alta prioridad listos.';

  @override
  String get homeSampleAgendaTitle => 'Agenda';

  @override
  String get homeSamplePlanTitle => 'Plan diario';

  @override
  String get homeSampleSuggestionsTitle => 'Sugerencias del asistente';

  @override
  String get homeSampleFocusTitle => 'Tareas de enfoque';

  @override
  String get homeSampleSuggestionHoldSeat =>
      'Reservar asiento para el vuelo a Seattle';

  @override
  String get homeSampleSuggestionHoldSeatDetail =>
      'El vuelo UA 455 sigue sin confirmarse. ¿Reservar la salida de las 18:15?';

  @override
  String get homeSampleSuggestionHoldSeatAction => 'Reservar asiento';

  @override
  String get homeSampleSuggestionPrep => 'Preparar puntos de conversación';

  @override
  String get homeSampleSuggestionPrepDetail =>
      'Revisa las métricas de churn antes de la reunión de liderazgo.';

  @override
  String get homeSampleSuggestionPrepAction => 'Abrir resumen';

  @override
  String get homeSampleFocusApproval =>
      'Aprobar resumen de revisión de seguridad';

  @override
  String get homeSampleFocusApprovalStatus => 'Vence hoy · Asignado a ti';

  @override
  String get homeSampleFocusDraft => 'Redactar recuento de OKR del T3';

  @override
  String get homeSampleFocusDraftStatus => 'En progreso';

  @override
  String get conflictQuietHoursTitle => 'Horas de silencio activas';

  @override
  String get conflictQuietHoursDescription =>
      'Enviar ahora rompería las horas de silencio de Casey.';

  @override
  String conflictScheduleStatus(String time) {
    return 'Programado para $time';
  }

  @override
  String get conflictOverrideStatus => 'Anulación enviada · usuario notificado';

  @override
  String conflictOverrideFailedStatus(String error) {
    return 'Error al anular · $error';
  }

  @override
  String get conflictScheduleAfterQuietHours =>
      'Programar después de las horas de silencio';

  @override
  String get conflictScheduleLater => 'Programar más tarde';

  @override
  String get conflictSendAnyway => 'Enviar de todas formas';

  @override
  String get conflictDismiss => 'Descartar';

  @override
  String conflictContextNote(String time, String timeZone) {
    return 'Las horas de silencio terminan a las $time en $timeZone.';
  }

  @override
  String get commonNext => 'Siguiente';

  @override
  String get commonFinish => 'Finalizar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonNone => 'Ninguno';

  @override
  String get onboardingWelcomeTitle => 'Bienvenido a Asistente Personal de IA';

  @override
  String get onboardingWelcomeSubtitle =>
      'Personalizaremos tu asistencia diaria, recopilaremos solo lo que apruebes y podrás ajustarlo en cualquier momento.';

  @override
  String get onboardingGetStarted => 'Comenzar';

  @override
  String get onboardingLocaleTitle => 'Configura tu idioma preferido';

  @override
  String get onboardingLocaleSubtitle =>
      'La localización ayuda al asistente a adaptar el tono y los resúmenes. Puedes cambiarlo en cualquier momento desde ajustes.';

  @override
  String get onboardingChooseLanguage => 'Elegir idioma';

  @override
  String onboardingLanguageSet(String language) {
    return 'Idioma establecido en $language';
  }

  @override
  String get onboardingChannelsTitle =>
      'Elige cómo quieres recibir las actualizaciones';

  @override
  String get onboardingCriticalAlertsTitle => 'Permitir alertas críticas';

  @override
  String get onboardingCriticalAlertsSubtitle =>
      'Para conflictos urgentes y recordatorios sensibles al tiempo';

  @override
  String get onboardingQuietHoursTitle => 'Configura las horas de silencio';

  @override
  String get onboardingQuietHoursSubtitle =>
      'Durante las horas de silencio el asistente pausará las notificaciones no críticas.';

  @override
  String get onboardingQuietStartLabel => 'Inicio (HH:MM)';

  @override
  String get onboardingQuietEndLabel => 'Fin (HH:MM)';

  @override
  String get onboardingAddBoundary => 'Agregar tema límite';

  @override
  String get onboardingBoundaryHint => 'p. ej., finanzas, salud personal';

  @override
  String get onboardingSaveBoundary => 'Guardar límite';

  @override
  String get onboardingConsentsTitle => 'Revisa las preferencias de privacidad';

  @override
  String get onboardingAcceptTos => 'Acepto los Términos de Servicio';

  @override
  String get onboardingTelemetryTitle => 'Permito telemetría anonimizada';

  @override
  String get onboardingTelemetrySubtitle =>
      'Se utiliza para mejorar el rendimiento y la confiabilidad del asistente';

  @override
  String get onboardingViewExport => 'Ver opciones de exportación de datos';

  @override
  String get onboardingExportDetails =>
      'Exporta datos como JSON o ICS.\nLas solicitudes de eliminación se procesan en 72 horas.';

  @override
  String get onboardingSummaryTitle => '¡Todo listo!';

  @override
  String get onboardingOfflineBanner =>
      'Modo sin conexión listo: último plan en caché';

  @override
  String get onboardingCriticalAllowed => 'Permitidas';

  @override
  String get onboardingCriticalMuted => 'Silenciadas';

  @override
  String get onboardingTelemetryEnabled => 'Activada';

  @override
  String get onboardingTelemetryDisabled => 'Desactivada';

  @override
  String onboardingSummaryLocale(String locale) {
    return 'Idioma: $locale';
  }

  @override
  String onboardingSummaryChannels(String channels) {
    return 'Canales: $channels';
  }

  @override
  String onboardingSummaryCritical(String status) {
    return 'Alertas críticas: $status';
  }

  @override
  String onboardingSummaryQuietHours(String start, String end) {
    return 'Horas de silencio: $start — $end';
  }

  @override
  String onboardingSummaryTelemetry(String status) {
    return 'Telemetría: $status';
  }

  @override
  String onboardingSummaryBoundaries(String boundaries) {
    return 'Límites: $boundaries';
  }

  @override
  String get onboardingLocaleEnglishLabel => 'Inglés (EE. UU.)';

  @override
  String get onboardingLocaleEnglishName => 'Inglés';

  @override
  String get onboardingLocaleSpanishLabel => 'Español (LatAm)';

  @override
  String get onboardingLocaleSpanishName => 'Español';

  @override
  String get onboardingLocaleGermanLabel => 'Alemán (DE)';

  @override
  String get onboardingLocaleGermanName => 'Alemán';

  @override
  String get onboardingChannelCalendar =>
      'Activar sincronización con Calendario';

  @override
  String get onboardingChannelGmail => 'Activar resúmenes de Gmail';

  @override
  String get onboardingChannelPush => 'Notificaciones push';

  @override
  String get onboardingStepWelcome => 'Bienvenida';

  @override
  String get onboardingStepLanguage => 'Idioma';

  @override
  String get onboardingStepChannels => 'Canales de notificación';

  @override
  String get onboardingStepQuietHours => 'Horas de silencio';

  @override
  String get onboardingStepConsents => 'Consentimientos';

  @override
  String get onboardingStepSummary => 'Resumen';

  @override
  String get summaryFollowUpsTitle => 'Seguimientos de hoy';

  @override
  String get summarySignalsTitle => 'Señales monitoreadas';

  @override
  String get summaryOfflineBanner => 'Resumen sin conexión en caché';

  @override
  String summaryConfidenceLabel(String value) {
    return 'Confianza: $value';
  }

  @override
  String summarySourcesCount(int count) {
    return 'Fuentes ($count)';
  }

  @override
  String get summaryViewSources => 'Ver fuentes';
}
