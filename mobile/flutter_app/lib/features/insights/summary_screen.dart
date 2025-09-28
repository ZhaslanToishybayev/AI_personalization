import 'package:flutter/material.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';
import 'package:flutter_app/theme/widgets/glass_panel.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({required this.viewModel, super.key});

  final SummaryViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final l10n = AppLocalizations.of(context)!;
    final offlineBanner = viewModel.offlineBanner.isNotEmpty
        ? viewModel.offlineBanner
        : l10n.summaryOfflineBanner;

    return DecoratedBox(
      decoration: GlassSurfaces.background(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(viewModel.headerTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.mic),
              onPressed: viewModel.onVoiceTap,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: ListView(
              children: [
                GlassPanel(
                  tone: GlassTone.dawn,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        viewModel.summaryHeading,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...viewModel.highlights.map(
                        (highlight) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: _HighlightRow(model: highlight),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _SectionCard(
                  title: l10n.summaryFollowUpsTitle,
                  items: viewModel.followUps,
                  textTheme: textTheme,
                ),
                const SizedBox(height: 16),
                _SectionCard(
                  title: l10n.summarySignalsTitle,
                  items: viewModel.signals,
                  textTheme: textTheme,
                ),
                if (offlineBanner.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(offlineBanner, style: textTheme.bodyMedium),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SummaryViewModel {
  const SummaryViewModel({
    required this.headerTitle,
    required this.summaryHeading,
    required this.highlights,
    required this.followUps,
    required this.signals,
    this.onVoiceTap,
    this.offlineBanner = '',
  });

  final String headerTitle;
  final String summaryHeading;
  final List<HighlightModel> highlights;
  final List<String> followUps;
  final List<String> signals;
  final VoidCallback? onVoiceTap;
  final String offlineBanner;
}

class HighlightModel {
  const HighlightModel({
    required this.title,
    required this.description,
    required this.accent,
    this.confidenceLabel,
    this.sources = const [],
  });

  final String title;
  final String description;
  final Color accent;
  final String? confidenceLabel;
  final List<HighlightSourceModel> sources;
}

class HighlightSourceModel {
  const HighlightSourceModel({required this.signalId, required this.summary});

  final String signalId;
  final String summary;
}

class _HighlightRow extends StatelessWidget {
  const _HighlightRow({required this.model});

  final HighlightModel model;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 6, right: 12),
          decoration: BoxDecoration(
            color: model.accent,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(model.description, style: textTheme.bodyMedium),
              if (model.confidenceLabel != null) ...[
                const SizedBox(height: 8),
                Text(
                  l10n.summaryConfidenceLabel(model.confidenceLabel!),
                  style: textTheme.labelMedium,
                ),
              ],
              if (model.sources.isNotEmpty) ...[
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      l10n.summarySourcesCount(model.sources.length),
                      style: textTheme.labelMedium,
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () => _showSources(context, model.sources),
                      child: Text(l10n.summaryViewSources),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _showSources(
    BuildContext context,
    List<HighlightSourceModel> sources,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: sources
              .map(
                (source) => ListTile(
                  title: Text(source.signalId),
                  subtitle: Text(source.summary),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.items,
    required this.textTheme,
  });

  final String title;
  final List<String> items;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle, size: 16),
                  const SizedBox(width: 8),
                  Expanded(child: Text(item, style: textTheme.bodyMedium)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
