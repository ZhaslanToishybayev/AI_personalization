import 'package:flutter/material.dart';
import 'package:flutter_app/features/home/daily_plan_screen.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Daily plan screen renders Liquid Glass explanation chips', (
    tester,
  ) async {
    await loadAppFonts();

    const viewModel = DailyPlanViewModel(
      headerTitle: 'Daily plan',
      greeting: 'Guten Morgen, Casey',
      summary:
          'Morning focus block held at 09:30; traffic clear. Two high-priority '
          'messages need review.',
      agendaSection: AgendaSectionModel(
        title: 'Agenda',
        entries: [
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
        title: 'Assistant suggestions',
        items: [
          SuggestionCardModel(
            heading: 'Hold seat for Seattle flight',
            detail: 'Flight UA 455 still unconfirmed. Reserve 18:15 departure?',
            confidenceLabel: 'Confidence: high · Sources (calendar, gmail)',
            actionLabel: 'Hold seat',
            isHighlighted: true,
          ),
          SuggestionCardModel(
            heading: 'Prepare talking points',
            detail: 'Review churn metrics before leadership sync.',
            confidenceLabel: 'Confidence: medium · Explainability ready',
            actionLabel: 'Open summary',
          ),
        ],
      ),
      focusSection: FocusSectionModel(
        title: 'Focus tasks',
        tasks: [
          FocusTaskModel(
            label: 'Approve security review summary',
            statusLabel: 'Due today · Assigned to you',
            isFlagged: true,
          ),
          FocusTaskModel(
            label: 'Draft Q3 OKR recap',
            statusLabel: 'In progress',
          ),
        ],
      ),
    );

    await tester.pumpWidgetBuilder(
      MaterialApp(
        theme: GlassTheme.light(),
        home: const DailyPlanScreen(viewModel: viewModel),
      ),
      surfaceSize: const Size(414, 896),
    );

    await screenMatchesGolden(tester, 'daily_plan_screen_liquid_glass');
  });
}
