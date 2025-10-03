// Improved Daily Plan Screen with unified design system
// This file demonstrates the enhanced design - to activate, rename daily_plan_screen.dart to _old
// and rename this file to daily_plan_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_app/theme/app_design_tokens.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';
import 'package:flutter_app/theme/widgets/glass_panel.dart';
import 'package:flutter_app/theme/widgets/app_button.dart';
import 'package:flutter_app/theme/widgets/section_header.dart';
import 'package:flutter_app/theme/widgets/action_card.dart';

// Re-export models from original file
export 'daily_plan_screen.dart' show
    DailyPlanViewModel,
    AgendaSectionModel,
    AgendaEntryModel,
    SuggestionsSectionModel,
    SuggestionCardModel,
    FocusSectionModel,
    FocusTaskModel;

/// Enhanced Daily Plan Screen with improved design system
class DailyPlanScreenV2 extends StatelessWidget {
  const DailyPlanScreenV2({
    required this.viewModel,
    this.headerWidgets = const [],
    super.key,
  });

  final dynamic viewModel; // DailyPlanViewModel
  final List<Widget> headerWidgets;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: GlassSurfaces.background(tone: GlassTone.day),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            // App bar with blur effect
            _buildAppBar(context),
            
            // Content
            SliverPadding(
              padding: AppSpacing.screenPadding,
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Header widgets (alerts, etc)
                  ...headerWidgets,
                  if (headerWidgets.isNotEmpty) SizedBox(height: AppSpacing.md),
                  
                  // Greeting card
                  _buildGreetingCard(context),
                  SizedBox(height: AppSpacing.lg),
                  
                  // Agenda section
                  _buildAgendaSection(context),
                  SizedBox(height: AppSpacing.lg),
                  
                  // Suggestions section
                  _buildSuggestionsSection(context),
                  SizedBox(height: AppSpacing.lg),
                  
                  // Focus tasks section
                  _buildFocusSection(context),
                  SizedBox(height: AppSpacing.xxl),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 60,
      floating: true,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.glassLight,
            border: Border(
              bottom: BorderSide(
                color: AppColors.borderMedium,
                width: 1,
              ),
            ),
            boxShadow: AppShadows.sm,
          ),
          child: SafeArea(
            child: Padding(
              padding: AppSpacing.horizontalLG,
              child: Row(
                children: [
                  Text(
                    _getHeaderTitle(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: AppFontWeights.bold,
                          color: AppColors.textPrimary,
                        ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.notifications_outlined),
                    onPressed: () {},
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingCard(BuildContext context) {
    final theme = Theme.of(context);
    
    return GlassPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  boxShadow: AppShadows.glow(AppColors.primary),
                ),
                child: Icon(
                  Icons.wb_sunny_outlined,
                  color: Colors.white,
                  size: AppIconSizes.md,
                ),
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getGreeting(),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: AppFontWeights.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: AppSpacing.xs),
                    Text(
                      _getSummary(),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAgendaSection(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Today\'s Agenda',
          icon: Icons.calendar_today,
        ),
        SizedBox(height: AppSpacing.md),
        GlassPanel(
          padding: AppSpacing.paddingMD,
          child: Column(
            children: [
              _buildAgendaItem(
                time: '08:30',
                title: 'Inbox triage',
                subtitle: 'Skim priority emails',
                isActive: false,
              ),
              Divider(height: AppSpacing.lg),
              _buildAgendaItem(
                time: '09:30',
                title: 'Product demo prep',
                subtitle: 'Conference room Horizon',
                isActive: true,
              ),
              Divider(height: AppSpacing.lg),
              _buildAgendaItem(
                time: '11:00',
                title: 'Design sync',
                subtitle: 'Meet with Priya and Omar',
                isActive: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAgendaItem({
    required String time,
    required String title,
    required String subtitle,
    required bool isActive,
  }) {
    return Row(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary.withOpacity(0.1)
                : AppColors.neutral100,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: isActive
                ? Border.all(color: AppColors.primary, width: 2)
                : null,
          ),
          child: Center(
            child: Text(
              time,
              style: TextStyle(
                fontSize: 14,
                fontWeight: AppFontWeights.semiBold,
                color: isActive ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ),
        ),
        SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: AppFontWeights.semiBold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: AppSpacing.xs),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        if (isActive)
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }

  Widget _buildSuggestionsSection(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Smart Suggestions',
          icon: Icons.auto_awesome,
          subtitle: 'AI-powered recommendations',
        ),
        SizedBox(height: AppSpacing.md),
        ActionCard(
          title: 'Hold seat for Seattle flight',
          description: 'Flight UA 455 still unconfirmed. Reserve 18:15 departure?',
          icon: Icons.flight,
          isHighlighted: true,
          badge: ActionBadge(
            label: 'HIGH CONFIDENCE',
            color: AppColors.success,
          ),
          trailing: AppButton(
            onPressed: () {},
            variant: AppButtonVariant.primary,
            size: AppButtonSize.small,
            child: Text('Book Now'),
          ),
        ),
        SizedBox(height: AppSpacing.md),
        ActionCard(
          title: 'Prepare talking points',
          description: 'Review churn metrics before leadership sync.',
          icon: Icons.description_outlined,
          badge: ActionBadge(
            label: 'MEDIUM',
            color: AppColors.warning,
          ),
          trailing: AppButton(
            onPressed: () {},
            variant: AppButtonVariant.outline,
            size: AppButtonSize.small,
            child: Text('Review'),
          ),
        ),
      ],
    );
  }

  Widget _buildFocusSection(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          title: 'Focus Tasks',
          icon: Icons.star_outline,
        ),
        SizedBox(height: AppSpacing.md),
        GlassPanel(
          padding: AppSpacing.paddingMD,
          child: Column(
            children: [
              _buildFocusTask(
                title: 'Approve security review summary',
                status: 'Due today · Assigned to you',
                isFlagged: true,
              ),
              Divider(height: AppSpacing.lg),
              _buildFocusTask(
                title: 'Draft Q3 OKR recap',
                status: 'In progress',
                isFlagged: false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFocusTask({
    required String title,
    required String status,
    required bool isFlagged,
  }) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.neutral300,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(AppRadius.sm),
          ),
          child: Center(
            child: Icon(
              Icons.check,
              size: 16,
              color: Colors.transparent,
            ),
          ),
        ),
        SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: AppFontWeights.medium,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: AppSpacing.xs),
              Text(
                status,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        if (isFlagged)
          Icon(
            Icons.flag,
            size: AppIconSizes.sm,
            color: AppColors.error,
          ),
      ],
    );
  }

  String _getHeaderTitle() {
    try {
      final title = (viewModel as dynamic).headerTitle;
      return title is String ? title : 'Today';
    } catch (e) {
      return 'Today';
    }
  }

  String _getGreeting() {
    try {
      final greeting = (viewModel as dynamic).greeting;
      return greeting is String ? greeting : 'Good morning';
    } catch (e) {
      return 'Good morning';
    }
  }

  String _getSummary() {
    try {
      final summary = (viewModel as dynamic).summary;
      return summary is String ? summary : 'Let\'s make today productive';
    } catch (e) {
      return 'Let\'s make today productive';
    }
  }
}
