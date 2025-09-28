import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';
import 'package:flutter_app/theme/widgets/glass_panel.dart';

class DailyPlanScreen extends StatelessWidget {
  const DailyPlanScreen({
    required this.viewModel,
    this.headerWidgets = const [],
    super.key,
  });

  final DailyPlanViewModel viewModel;
  final List<Widget> headerWidgets;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return DecoratedBox(
      decoration: GlassSurfaces.background(tone: viewModel.backgroundTone),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(viewModel.headerTitle),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...headerWidgets,
                  if (headerWidgets.isNotEmpty) const SizedBox(height: 16),
                  GlassPanel(
                    tone: viewModel.backgroundTone,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.greeting,
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(viewModel.summary, style: textTheme.bodyMedium),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _AgendaSection(model: viewModel.agendaSection),
                  const SizedBox(height: 16),
                  _SuggestionsSection(model: viewModel.suggestionsSection),
                  const SizedBox(height: 16),
                  _FocusTasksSection(model: viewModel.focusSection),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DailyPlanViewModel {
  const DailyPlanViewModel({
    required this.headerTitle,
    required this.greeting,
    required this.summary,
    required this.agendaSection,
    required this.suggestionsSection,
    required this.focusSection,
    this.backgroundTone = GlassTone.day,
  });

  final String headerTitle;
  final String greeting;
  final String summary;
  final AgendaSectionModel agendaSection;
  final SuggestionsSectionModel suggestionsSection;
  final FocusSectionModel focusSection;
  final GlassTone backgroundTone;
}

class AgendaSectionModel {
  const AgendaSectionModel({required this.title, required this.entries});

  final String title;
  final List<AgendaEntryModel> entries;
}

class AgendaEntryModel {
  const AgendaEntryModel({
    required this.timeLabel,
    required this.title,
    required this.subtitle,
    this.isCurrent = false,
  });

  final String timeLabel;
  final String title;
  final String subtitle;
  final bool isCurrent;
}

class SuggestionsSectionModel {
  const SuggestionsSectionModel({required this.title, required this.items});

  final String title;
  final List<SuggestionCardModel> items;

  SuggestionsSectionModel copyWith({
    String? title,
    List<SuggestionCardModel>? items,
  }) {
    return SuggestionsSectionModel(
      title: title ?? this.title,
      items: items ?? this.items,
    );
  }
}

class SuggestionCardModel {
  const SuggestionCardModel({
    required this.heading,
    required this.detail,
    required this.confidenceLabel,
    this.actionLabel,
    this.accentColor,
    this.isHighlighted = false,
  });

  final String heading;
  final String detail;
  final String confidenceLabel;
  final String? actionLabel;
  final Color? accentColor;
  final bool isHighlighted;

  SuggestionCardModel copyWith({
    String? heading,
    String? detail,
    String? confidenceLabel,
    String? actionLabel,
    Color? accentColor,
    bool? isHighlighted,
  }) {
    return SuggestionCardModel(
      heading: heading ?? this.heading,
      detail: detail ?? this.detail,
      confidenceLabel: confidenceLabel ?? this.confidenceLabel,
      actionLabel: actionLabel ?? this.actionLabel,
      accentColor: accentColor ?? this.accentColor,
      isHighlighted: isHighlighted ?? this.isHighlighted,
    );
  }
}

class FocusSectionModel {
  const FocusSectionModel({required this.title, required this.tasks});

  final String title;
  final List<FocusTaskModel> tasks;

  FocusSectionModel copyWith({String? title, List<FocusTaskModel>? tasks}) {
    return FocusSectionModel(
      title: title ?? this.title,
      tasks: tasks ?? this.tasks,
    );
  }
}

class FocusTaskModel {
  const FocusTaskModel({
    required this.label,
    required this.statusLabel,
    this.isFlagged = false,
    this.priorityIndicator,
  });

  final String label;
  final String statusLabel;
  final bool isFlagged;
  final Color? priorityIndicator;

  FocusTaskModel copyWith({
    String? label,
    String? statusLabel,
    bool? isFlagged,
    Color? priorityIndicator,
  }) {
    return FocusTaskModel(
      label: label ?? this.label,
      statusLabel: statusLabel ?? this.statusLabel,
      isFlagged: isFlagged ?? this.isFlagged,
      priorityIndicator: priorityIndicator ?? this.priorityIndicator,
    );
  }
}

class _AgendaSection extends StatelessWidget {
  const _AgendaSection({required this.model});

  final AgendaSectionModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.title,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        ...model.entries.map((entry) {
          final tone = entry.isCurrent ? GlassTone.day : GlassTone.dawn;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GlassPanel(
              tone: tone,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.timeLabel,
                    style: textTheme.bodyMedium?.copyWith(
                      fontFeatures: const [FontFeature.tabularFigures()],
                      fontWeight: entry.isCurrent ? FontWeight.bold : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                entry.title,
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: entry.isCurrent
                                      ? FontWeight.w700
                                      : null,
                                ),
                              ),
                            ),
                            if (entry.isCurrent)
                              const Icon(Icons.wb_twilight, size: 18),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(entry.subtitle, style: textTheme.bodySmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _SuggestionsSection extends StatelessWidget {
  const _SuggestionsSection({required this.model});

  final SuggestionsSectionModel model;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.title,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        ...model.items.map((item) {
          final tone = item.isHighlighted ? GlassTone.day : GlassTone.dawn;
          final accent =
              item.accentColor ?? Theme.of(context).colorScheme.secondary;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GlassPanel(
              tone: tone,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.heading,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      if (item.isHighlighted)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: accent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            'Recommended',
                            style: textTheme.labelSmall?.copyWith(
                              color: accent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(item.detail, style: textTheme.bodyMedium),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      _ConfidenceChip(label: item.confidenceLabel),
                      if (item.actionLabel != null)
                        FilledButton.tonal(
                          onPressed: () {},
                          child: Text(item.actionLabel!),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _FocusTasksSection extends StatelessWidget {
  const _FocusTasksSection({required this.model});

  final FocusSectionModel model;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.title,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        ...model.tasks.map((task) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: GlassPanel(
              tone: GlassTone.dusk,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color:
                          task.priorityIndicator ??
                          Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task.label, style: textTheme.bodyLarge),
                        const SizedBox(height: 4),
                        Text(task.statusLabel, style: textTheme.bodySmall),
                      ],
                    ),
                  ),
                  if (task.isFlagged)
                    Icon(
                      Icons.flag,
                      size: 18,
                      color: Theme.of(context).colorScheme.error,
                    ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _ConfidenceChip extends StatelessWidget {
  const _ConfidenceChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: GlassGradients.byTone(GlassTone.dawn),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
