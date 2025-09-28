import 'package:flutter/material.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';
import 'package:flutter_app/theme/widgets/glass_panel.dart';

class ConflictAlertBanner extends StatelessWidget {
  const ConflictAlertBanner({required this.viewModel, super.key});

  final ConflictAlertViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GlassPanel(
      tone: viewModel.tone,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.warning_amber_rounded, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(viewModel.description, style: textTheme.bodyMedium),
                    if (viewModel.statusLabel != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        viewModel.statusLabel!,
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    if (viewModel.contextNote != null) ...[
                      const SizedBox(height: 8),
                      Text(viewModel.contextNote!, style: textTheme.bodySmall),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (viewModel.alternatives.isNotEmpty) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: viewModel.alternatives
                  .map(
                    (alt) => OutlinedButton.icon(
                      onPressed: alt.onSelected,
                      icon: Icon(alt.icon, size: 16),
                      label: Text(alt.label),
                    ),
                  )
                  .toList(),
            ),
          ],
          if (viewModel.onDismissed != null) ...[
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: viewModel.onDismissed,
                child: Text(viewModel.dismissLabel),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class ConflictAlertViewModel {
  const ConflictAlertViewModel({
    required this.title,
    required this.description,
    this.contextNote,
    this.statusLabel,
    this.alternatives = const [],
    this.onDismissed,
    this.tone = GlassTone.dusk,
    this.dismissLabel = 'Dismiss',
  });

  final String title;
  final String description;
  final String? contextNote;
  final String? statusLabel;
  final List<ConflictAlternative> alternatives;
  final VoidCallback? onDismissed;
  final GlassTone tone;
  final String dismissLabel;

  ConflictAlertViewModel copyWith({
    String? title,
    String? description,
    String? contextNote,
    String? statusLabel,
    List<ConflictAlternative>? alternatives,
    VoidCallback? onDismissed,
    GlassTone? tone,
    String? dismissLabel,
  }) {
    return ConflictAlertViewModel(
      title: title ?? this.title,
      description: description ?? this.description,
      contextNote: contextNote ?? this.contextNote,
      statusLabel: statusLabel ?? this.statusLabel,
      alternatives: alternatives ?? this.alternatives,
      onDismissed: onDismissed ?? this.onDismissed,
      tone: tone ?? this.tone,
      dismissLabel: dismissLabel ?? this.dismissLabel,
    );
  }
}

class ConflictAlternative {
  const ConflictAlternative({
    required this.label,
    required this.icon,
    required this.onSelected,
  });

  final String label;
  final IconData icon;
  final VoidCallback onSelected;
}
