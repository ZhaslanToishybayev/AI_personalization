import 'package:flutter/material.dart';
import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/features/alerts/conflict_alert_banner.dart';
import 'package:flutter_app/features/alerts/conflict_alert_controller.dart';
import 'package:flutter_app/features/home/daily_plan_screen.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScenarioProvider = Provider<ConflictAlertScenario?>((_) => null);
final dailyPlanProvider = Provider<DailyPlanViewModel?>((_) => null);

class HomeShellScreen extends ConsumerWidget {
  const HomeShellScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final providedPlan = ref.watch(dailyPlanProvider);
    final providedScenario = ref.watch(homeScenarioProvider);

    final plan = providedPlan ?? _buildSamplePlan(l10n);
    final scenario = providedScenario ?? _buildSampleScenario(l10n, context);

    final conflictProvider = scenario == null
        ? null
        : conflictAlertControllerProvider(scenario);
    final conflictViewModel = conflictProvider == null
        ? null
        : ref.watch(conflictProvider);

    if (plan == null) {
      return DecoratedBox(
        decoration: GlassSurfaces.background(tone: GlassTone.day),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.homeToday),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Text(
              AppLocalizations.of(context)!.homeLoadingPlan,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ),
      );
    }

    final headerWidgets = <Widget>[];
    if (conflictViewModel != null) {
      headerWidgets
        ..add(ConflictAlertBanner(viewModel: conflictViewModel))
        ..add(const SizedBox(height: 16));
    }

    return DailyPlanScreen(viewModel: plan, headerWidgets: headerWidgets);
  }
}

DailyPlanViewModel _buildSamplePlan(AppLocalizations l10n) {
  return DailyPlanViewModel(
    headerTitle: l10n.homeSamplePlanTitle,
    greeting: l10n.homeSampleGreeting,
    summary: l10n.homeSampleSummary,
    agendaSection: AgendaSectionModel(
      title: l10n.homeSampleAgendaTitle,
      entries: const [
        AgendaEntryModel(
          timeLabel: '08:30',
          title: 'Inbox triage',
          subtitle: 'Skim priority emails',
        ),
        AgendaEntryModel(
          timeLabel: '09:30',
          title: 'Product demo prep',
          subtitle: 'Conference room Horizon',
          isCurrent: true,
        ),
        AgendaEntryModel(
          timeLabel: '11:00',
          title: 'Design sync',
          subtitle: 'Meet with Priya and Omar',
        ),
      ],
    ),
    suggestionsSection: SuggestionsSectionModel(
      title: l10n.homeSampleSuggestionsTitle,
      items: [
        SuggestionCardModel(
          heading: l10n.homeSampleSuggestionHoldSeat,
          detail: l10n.homeSampleSuggestionHoldSeatDetail,
          confidenceLabel: 'Confidence: high · Sources: calendar, gmail',
          actionLabel: l10n.homeSampleSuggestionHoldSeatAction,
          isHighlighted: true,
        ),
        SuggestionCardModel(
          heading: l10n.homeSampleSuggestionPrep,
          detail: l10n.homeSampleSuggestionPrepDetail,
          confidenceLabel: 'Confidence: medium · Explainability ready',
          actionLabel: l10n.homeSampleSuggestionPrepAction,
        ),
      ],
    ),
    focusSection: FocusSectionModel(
      title: l10n.homeSampleFocusTitle,
      tasks: [
        FocusTaskModel(
          label: l10n.homeSampleFocusApproval,
          statusLabel: l10n.homeSampleFocusApprovalStatus,
          isFlagged: true,
        ),
        FocusTaskModel(
          label: l10n.homeSampleFocusDraft,
          statusLabel: l10n.homeSampleFocusDraftStatus,
        ),
      ],
    ),
  );
}

ConflictAlertScenario? _buildSampleScenario(
  AppLocalizations l10n,
  BuildContext context,
) {
  const quiet = QuietHours(
    startMinutes: 22 * 60,
    endMinutes: 7 * 60,
    timeZone: 'America/Los_Angeles',
  );
  final materialLocalizations = MaterialLocalizations.of(context);
  final endTime = TimeOfDay(
    hour: quiet.endMinutes ~/ 60,
    minute: quiet.endMinutes % 60,
  );
  final formattedEnd = materialLocalizations.formatTimeOfDay(endTime);

  return ConflictAlertScenario(
    userId: 'demo-user',
    title: l10n.conflictQuietHoursTitle,
    description: l10n.conflictQuietHoursDescription,
    conflictStart: DateTime.now(),
    contextNote: l10n.conflictContextNote(formattedEnd, quiet.timeZone),
    suggestionId: 'suggestion-demo',
    quietHours: quiet,
    tone: GlassTone.dusk,
    scheduleAfterLabel: l10n.conflictScheduleAfterQuietHours,
    scheduleLaterLabel: l10n.conflictScheduleLater,
    sendAnywayLabel: l10n.conflictSendAnyway,
    dismissLabel: l10n.conflictDismiss,
    overrideSuccessLabel: l10n.conflictOverrideStatus,
    overrideFailureBuilder: l10n.conflictOverrideFailedStatus,
    scheduleStatusBuilder: l10n.conflictScheduleStatus,
  );
}
