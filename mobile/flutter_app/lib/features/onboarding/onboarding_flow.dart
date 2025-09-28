import 'package:flutter/material.dart';
import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/l10n/locale_controller.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_app/theme/liquid_glass_tokens.dart';
import 'package:flutter_app/theme/widgets/glass_panel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingControllerProvider =
    StateNotifierProvider<OnboardingController, OnboardingState>(
      (ref) => OnboardingController(),
    );

class OnboardingFlow extends ConsumerWidget {
  const OnboardingFlow({required this.onCompleted, super.key});

  final void Function(OnboardingResult result) onCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingControllerProvider);
    final controller = ref.read(onboardingControllerProvider.notifier);
    final l10n = AppLocalizations.of(context)!;
    final localeOptions = _localeOptions(l10n);
    final channelOptions = _channelOptions(l10n);
    final selectedLocale = localeOptions.firstWhere(
      (option) => option.code == state.localeCode,
      orElse: () => localeOptions.first,
    );

    return DecoratedBox(
      decoration: GlassSurfaces.background(tone: GlassTone.dawn),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: state.stepIndex > 0
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: controller.previousStep,
                )
              : null,
          title: Text(state.titleForStep(l10n)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _StepBody(
                    state: state,
                    controller: controller,
                    l10n: l10n,
                    localeOptions: localeOptions,
                    channelOptions: channelOptions,
                    selectedLocale: selectedLocale,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: state.isNextEnabled
                            ? () {
                                if (state.isLastStep) {
                                  final result = controller.complete();
                                  onCompleted(result);
                                } else {
                                  controller.nextStep();
                                }
                              }
                            : null,
                        child: Text(
                          state.isLastStep
                              ? l10n.commonFinish
                              : l10n.commonNext,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StepBody extends ConsumerWidget {
  const _StepBody({
    required this.state,
    required this.controller,
    required this.l10n,
    required this.localeOptions,
    required this.channelOptions,
    required this.selectedLocale,
  });

  final OnboardingState state;
  final OnboardingController controller;
  final AppLocalizations l10n;
  final List<LocaleOption> localeOptions;
  final List<ChannelOption> channelOptions;
  final LocaleOption selectedLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    switch (state.currentStep) {
      case OnboardingStep.welcome:
        return GlassPanel(
          tone: GlassTone.dawn,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.onboardingWelcomeTitle,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(l10n.onboardingWelcomeSubtitle, style: textTheme.bodyMedium),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: controller.nextStep,
                  child: Text(l10n.onboardingGetStarted),
                ),
              ),
            ],
          ),
        );
      case OnboardingStep.locale:
        return GlassPanel(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.onboardingLocaleTitle,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(l10n.onboardingLocaleSubtitle, style: textTheme.bodyMedium),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: () async {
                  final selection = await showModalBottomSheet<LocaleOption>(
                    context: context,
                    builder: (context) => SafeArea(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final option in localeOptions)
                            ListTile(
                              title: Text(option.label),
                              onTap: () => Navigator.of(context).pop(option),
                            ),
                        ],
                      ),
                    ),
                  );
                  if (selection != null) {
                    ref
                        .read(localeControllerProvider.notifier)
                        .updateLocale(selection.code);
                    controller.selectLocale(selection);
                  }
                },
                child: Text(l10n.onboardingChooseLanguage),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.onboardingLanguageSet(selectedLocale.display),
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        );
      case OnboardingStep.channels:
        return GlassPanel(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.onboardingChannelsTitle,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              ...channelOptions.map((option) {
                final isSelected = state.selectedChannels.contains(option.id);
                return CheckboxListTile(
                  title: Text(option.label),
                  value: isSelected,
                  onChanged: (_) => controller.toggleChannel(option.id),
                );
              }),
              const SizedBox(height: 8),
              SwitchListTile(
                title: Text(l10n.onboardingCriticalAlertsTitle),
                subtitle: Text(l10n.onboardingCriticalAlertsSubtitle),
                value: state.allowCriticalAlerts,
                onChanged: (value) =>
                    controller.setCriticalAlerts(isEnabled: value),
              ),
            ],
          ),
        );
      case OnboardingStep.quietHours:
        return GlassPanel(
          tone: GlassTone.dawn,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.onboardingQuietHoursTitle,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.onboardingQuietHoursSubtitle,
                style: textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              _QuietHourField(
                label: l10n.onboardingQuietStartLabel,
                value: state.quietHoursStart,
                onChanged: controller.updateQuietHoursStart,
              ),
              const SizedBox(height: 12),
              _QuietHourField(
                label: l10n.onboardingQuietEndLabel,
                value: state.quietHoursEnd,
                onChanged: controller.updateQuietHoursEnd,
              ),
              const SizedBox(height: 16),
              FilledButton.tonal(
                onPressed: () async {
                  final topicController = TextEditingController();
                  final topic = await showDialog<String>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(l10n.onboardingAddBoundary),
                      content: TextField(
                        controller: topicController,
                        decoration: InputDecoration(
                          hintText: l10n.onboardingBoundaryHint,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(l10n.commonCancel),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(context, topicController.text),
                          child: Text(l10n.onboardingSaveBoundary),
                        ),
                      ],
                    ),
                  );
                  if (topic != null) {
                    controller.addBoundaryTopic(topic);
                  }
                },
                child: Text(l10n.onboardingAddBoundary),
              ),
              if (state.boundaryTopics.isNotEmpty) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: state.boundaryTopics
                      .map(
                        (topic) => Chip(
                          label: Text(topic),
                          onDeleted: () =>
                              controller.removeBoundaryTopic(topic),
                        ),
                      )
                      .toList(),
                ),
              ],
            ],
          ),
        );
      case OnboardingStep.consents:
        return GlassPanel(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.onboardingConsentsTitle,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              CheckboxListTile(
                title: Text(l10n.onboardingAcceptTos),
                value: state.termsAccepted,
                onChanged: (value) =>
                    controller.setTermsAccepted(accepted: value ?? false),
              ),
              CheckboxListTile(
                title: Text(l10n.onboardingTelemetryTitle),
                subtitle: Text(l10n.onboardingTelemetrySubtitle),
                value: state.telemetryAccepted,
                onChanged: (value) =>
                    controller.setTelemetryAccepted(enabled: value ?? false),
              ),
              TextButton(
                onPressed: controller.showExportInfo,
                child: Text(l10n.onboardingViewExport),
              ),
              if (state.exportInfoVisible)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    l10n.onboardingExportDetails,
                    style: textTheme.bodyMedium,
                  ),
                ),
            ],
          ),
        );
      case OnboardingStep.summary:
        final summary = _buildSummary(
          state: state,
          l10n: l10n,
          selectedLocale: selectedLocale,
          channelOptions: channelOptions,
        );
        return GlassPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.onboardingSummaryTitle,
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              ...summary.map(
                (line) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(line, style: textTheme.bodyMedium),
                ),
              ),
              const SizedBox(height: 8),
              Text(l10n.onboardingOfflineBanner, style: textTheme.bodyMedium),
            ],
          ),
        );
    }
  }
}

class _QuietHourField extends StatelessWidget {
  const _QuietHourField({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: value,
      keyboardType: TextInputType.datetime,
      onChanged: onChanged,
    );
  }
}

enum OnboardingStep { welcome, locale, channels, quietHours, consents, summary }

class OnboardingState {
  OnboardingState({
    this.stepIndex = 0,
    Set<String>? selectedChannels,
    this.allowCriticalAlerts = true,
    this.quietHoursStart = '22:00',
    this.quietHoursEnd = '06:00',
    this.termsAccepted = false,
    this.telemetryAccepted = false,
    this.localeCode = 'en-US',
    List<String>? boundaryTopics,
    this.exportInfoVisible = false,
  }) : selectedChannels = selectedChannels ?? <String>{},
       boundaryTopics = boundaryTopics ?? <String>[];

  final int stepIndex;
  final Set<String> selectedChannels;
  final bool allowCriticalAlerts;
  final String quietHoursStart;
  final String quietHoursEnd;
  final bool termsAccepted;
  final bool telemetryAccepted;
  final String localeCode;
  final List<String> boundaryTopics;
  final bool exportInfoVisible;

  OnboardingStep get currentStep => OnboardingStep.values[stepIndex];

  bool get isLastStep => stepIndex == OnboardingStep.values.length - 1;

  bool get isNextEnabled {
    switch (currentStep) {
      case OnboardingStep.welcome:
        return true;
      case OnboardingStep.locale:
        return localeCode.isNotEmpty;
      case OnboardingStep.channels:
        return selectedChannels.isNotEmpty;
      case OnboardingStep.quietHours:
        return quietHoursStart.isNotEmpty && quietHoursEnd.isNotEmpty;
      case OnboardingStep.consents:
        return termsAccepted;
      case OnboardingStep.summary:
        return true;
    }
  }

  String titleForStep(AppLocalizations l10n) {
    switch (currentStep) {
      case OnboardingStep.welcome:
        return l10n.onboardingStepWelcome;
      case OnboardingStep.locale:
        return l10n.onboardingStepLanguage;
      case OnboardingStep.channels:
        return l10n.onboardingStepChannels;
      case OnboardingStep.quietHours:
        return l10n.onboardingStepQuietHours;
      case OnboardingStep.consents:
        return l10n.onboardingStepConsents;
      case OnboardingStep.summary:
        return l10n.onboardingStepSummary;
    }
  }

  OnboardingState copyWith({
    int? stepIndex,
    Set<String>? selectedChannels,
    bool? allowCriticalAlerts,
    String? quietHoursStart,
    String? quietHoursEnd,
    bool? termsAccepted,
    bool? telemetryAccepted,
    String? localeCode,
    List<String>? boundaryTopics,
    bool? exportInfoVisible,
  }) {
    return OnboardingState(
      stepIndex: stepIndex ?? this.stepIndex,
      selectedChannels: selectedChannels ?? this.selectedChannels,
      allowCriticalAlerts: allowCriticalAlerts ?? this.allowCriticalAlerts,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      telemetryAccepted: telemetryAccepted ?? this.telemetryAccepted,
      localeCode: localeCode ?? this.localeCode,
      boundaryTopics: boundaryTopics ?? this.boundaryTopics,
      exportInfoVisible: exportInfoVisible ?? this.exportInfoVisible,
    );
  }
}

class OnboardingController extends StateNotifier<OnboardingState> {
  OnboardingController() : super(OnboardingState());

  void nextStep() {
    if (!state.isLastStep) {
      state = state.copyWith(stepIndex: state.stepIndex + 1);
    }
  }

  void previousStep() {
    if (state.stepIndex > 0) {
      state = state.copyWith(stepIndex: state.stepIndex - 1);
    }
  }

  void toggleChannel(String channel) {
    final updated = Set<String>.from(state.selectedChannels);
    if (updated.contains(channel)) {
      updated.remove(channel);
    } else {
      updated.add(channel);
    }
    state = state.copyWith(selectedChannels: updated);
  }

  void setCriticalAlerts({required bool isEnabled}) {
    state = state.copyWith(allowCriticalAlerts: isEnabled);
  }

  void updateQuietHoursStart(String value) {
    state = state.copyWith(quietHoursStart: value);
  }

  void updateQuietHoursEnd(String value) {
    state = state.copyWith(quietHoursEnd: value);
  }

  void setTermsAccepted({required bool accepted}) {
    state = state.copyWith(termsAccepted: accepted);
  }

  void setTelemetryAccepted({required bool enabled}) {
    state = state.copyWith(telemetryAccepted: enabled);
  }

  void selectLocale(LocaleOption option) {
    state = state.copyWith(localeCode: option.code);
  }

  void addBoundaryTopic(String topic) {
    if (topic.trim().isEmpty) {
      return;
    }
    final updated = [...state.boundaryTopics, topic.trim()];
    state = state.copyWith(boundaryTopics: updated);
  }

  void removeBoundaryTopic(String topic) {
    final updated = [...state.boundaryTopics]..remove(topic);
    state = state.copyWith(boundaryTopics: updated);
  }

  void showExportInfo() {
    state = state.copyWith(exportInfoVisible: true);
  }

  OnboardingResult complete() {
    return OnboardingResult(
      channels: state.selectedChannels.toList(),
      allowCriticalAlerts: state.allowCriticalAlerts,
      quietHoursStart: state.quietHoursStart,
      quietHoursEnd: state.quietHoursEnd,
      consents: {
        'terms_of_service': ConsentRecord(
          status: ConsentStatus.granted,
          updatedAt: DateTime.now(),
        ),
        'telemetry': ConsentRecord(
          status: state.telemetryAccepted
              ? ConsentStatus.granted
              : ConsentStatus.revoked,
          updatedAt: DateTime.now(),
        ),
      },
      locale: state.localeCode,
      personalBoundaries: state.boundaryTopics,
    );
  }
}

class OnboardingResult {
  OnboardingResult({
    required this.channels,
    required this.allowCriticalAlerts,
    required this.quietHoursStart,
    required this.quietHoursEnd,
    required this.consents,
    this.locale = 'en-US',
    this.personalBoundaries = const [],
  });

  final List<String> channels;
  final bool allowCriticalAlerts;
  final String quietHoursStart;
  final String quietHoursEnd;
  final Map<String, ConsentRecord> consents;
  final String locale;
  final List<String> personalBoundaries;
}

class LocaleOption {
  const LocaleOption({
    required this.code,
    required this.label,
    required this.display,
  });

  final String code;
  final String label;
  final String display;
}

class ChannelOption {
  const ChannelOption({required this.id, required this.label});

  final String id;
  final String label;
}

List<String> _buildSummary({
  required OnboardingState state,
  required AppLocalizations l10n,
  required LocaleOption selectedLocale,
  required List<ChannelOption> channelOptions,
}) {
  final channelLookup = {
    for (final option in channelOptions) option.id: option.label,
  };
  final selectedChannelLabels = state.selectedChannels
      .map((id) => channelLookup[id])
      .whereType<String>()
      .toList();
  final channelsDescription = selectedChannelLabels.isEmpty
      ? l10n.commonNone
      : selectedChannelLabels.join(', ');
  final boundaries = state.boundaryTopics.isEmpty
      ? l10n.commonNone
      : state.boundaryTopics.join(', ');
  final alerts = state.allowCriticalAlerts
      ? l10n.onboardingCriticalAllowed
      : l10n.onboardingCriticalMuted;
  final telemetry = state.telemetryAccepted
      ? l10n.onboardingTelemetryEnabled
      : l10n.onboardingTelemetryDisabled;

  return [
    l10n.onboardingSummaryLocale(selectedLocale.display),
    l10n.onboardingSummaryChannels(channelsDescription),
    l10n.onboardingSummaryCritical(alerts),
    l10n.onboardingSummaryQuietHours(
      state.quietHoursStart,
      state.quietHoursEnd,
    ),
    l10n.onboardingSummaryTelemetry(telemetry),
    l10n.onboardingSummaryBoundaries(boundaries),
  ];
}

List<LocaleOption> _localeOptions(AppLocalizations l10n) {
  return [
    LocaleOption(
      code: 'en-US',
      label: l10n.onboardingLocaleEnglishLabel,
      display: l10n.onboardingLocaleEnglishName,
    ),
    LocaleOption(
      code: 'es-419',
      label: l10n.onboardingLocaleSpanishLabel,
      display: l10n.onboardingLocaleSpanishName,
    ),
    LocaleOption(
      code: 'de-DE',
      label: l10n.onboardingLocaleGermanLabel,
      display: l10n.onboardingLocaleGermanName,
    ),
  ];
}

List<ChannelOption> _channelOptions(AppLocalizations l10n) {
  return [
    ChannelOption(id: 'calendar', label: l10n.onboardingChannelCalendar),
    ChannelOption(id: 'gmail', label: l10n.onboardingChannelGmail),
    ChannelOption(id: 'push', label: l10n.onboardingChannelPush),
  ];
}
