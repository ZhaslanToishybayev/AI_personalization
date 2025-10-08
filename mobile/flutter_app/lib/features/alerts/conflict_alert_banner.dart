import 'package:flutter/material.dart';
import 'package:flutter_app/theme/app_design_tokens.dart';
import 'package:flutter_app/theme/simple_material_theme.dart';
import 'package:flutter_app/theme/widgets/app_button.dart';

class ConflictAlertBanner extends StatelessWidget {
  const ConflictAlertBanner({required this.viewModel, super.key});

  final ConflictAlertViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: AppElevations.lg,
      child: Padding(
        padding: AppSpacing.cardPadding,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  size: AppIconSizes.md,
                  color: AppColors.warning,
                ),
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.title,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: AppSpacing.xs),
                    Text(
                      viewModel.description,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    if (viewModel.statusLabel != null) ...[
                      SizedBox(height: AppSpacing.sm),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.sm,
                          vertical: AppSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.info.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(AppRadius.sm),
                        ),
                        child: Text(
                          viewModel.statusLabel!,
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: AppFontWeights.semiBold,
                            color: AppColors.info,
                          ),
                        ),
                      ),
                    ],
                    if (viewModel.contextNote != null) ...[
                      SizedBox(height: AppSpacing.sm),
                      Text(
                        viewModel.contextNote!,
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (viewModel.alternatives.isNotEmpty) ...[
            SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: viewModel.alternatives
                  .map(
                    (alt) => AppButton(
                      onPressed: alt.onSelected,
                      variant: AppButtonVariant.outline,
                      size: AppButtonSize.small,
                      icon: alt.icon,
                      child: Text(alt.label),
                    ),
                  )
                  .toList(),
            ),
          ],
          if (viewModel.onDismissed != null) ...[
            SizedBox(height: AppSpacing.md),
            Align(
              alignment: Alignment.centerRight,
              child: AppButton(
                onPressed: viewModel.onDismissed,
                variant: AppButtonVariant.text,
                size: AppButtonSize.small,
                child: Text(viewModel.dismissLabel),
              ),
            ),
          ],
        ],
        ),
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
    this.tone = 'dusk',
    this.dismissLabel = 'Dismiss',
  });

  final String title;
  final String description;
  final String? contextNote;
  final String? statusLabel;
  final List<ConflictAlternative> alternatives;
  final VoidCallback? onDismissed;
  final String tone;
  final String dismissLabel;

  ConflictAlertViewModel copyWith({
    String? title,
    String? description,
    String? contextNote,
    String? statusLabel,
    List<ConflictAlternative>? alternatives,
    VoidCallback? onDismissed,
    String? tone,
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
