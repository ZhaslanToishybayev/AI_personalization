import 'package:flutter/material.dart';
import 'package:flutter_app/theme/app_design_tokens.dart';
import 'package:flutter_app/theme/widgets/glass_panel.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';

/// Action card with icon, title, description and optional action button
class ActionCard extends StatelessWidget {
  const ActionCard({
    required this.title,
    this.description,
    this.icon,
    this.onTap,
    this.trailing,
    this.badge,
    this.tone = GlassTone.day,
    this.isHighlighted = false,
    super.key,
  });

  final String title;
  final String? description;
  final IconData? icon;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? badge;
  final GlassTone tone;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget card = GlassPanel(
      tone: tone,
      padding: EdgeInsets.all(AppSpacing.md),
      borderRadius: AppRadius.xl,
      enhancedContrast: true,
      child: Row(
        children: [
          if (icon != null) ...[
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isHighlighted
                    ? AppColors.primary.withOpacity(0.1)
                    : AppColors.neutral100,
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Icon(
                icon,
                color: isHighlighted ? AppColors.primary : AppColors.textSecondary,
                size: AppIconSizes.md,
              ),
            ),
            SizedBox(width: AppSpacing.md),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: AppFontWeights.semiBold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    if (badge != null) ...[
                      SizedBox(width: AppSpacing.sm),
                      badge!,
                    ],
                  ],
                ),
                if (description != null) ...[
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    description!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[
            SizedBox(width: AppSpacing.md),
            trailing!,
          ] else if (onTap != null) ...[
            SizedBox(width: AppSpacing.md),
            Icon(
              Icons.chevron_right,
              color: AppColors.textTertiary,
              size: AppIconSizes.md,
            ),
          ],
        ],
      ),
    );

    if (onTap != null) {
      card = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        child: card,
      );
    }

    if (isHighlighted) {
      card = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.xl),
          border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: card,
      );
    }

    return card;
  }
}

/// Badge widget for action cards
class ActionBadge extends StatelessWidget {
  const ActionBadge({
    required this.label,
    this.color,
    super.key,
  });

  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.primary;
    
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: effectiveColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(
          color: effectiveColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: AppFontWeights.semiBold,
          color: effectiveColor,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
