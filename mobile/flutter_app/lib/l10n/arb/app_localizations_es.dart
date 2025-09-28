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
    return 'Programado para las $time';
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
}
