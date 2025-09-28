import 'package:flutter_app/domain/assistive_suggestion.dart';
import 'package:flutter_app/domain/context_signal.dart';
import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/services/personalization_engine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ranker = SuggestionRanker();

  group('SuggestionRanker', () {
    test('prioritizes suggestions by confidence and signal score', () {
      final profile = _profile();
      final signals = [
        ContextSignal(
          id: 'event-1',
          userId: 'user-123',
          source: ContextSource.calendar,
          sourceIdentifier: 'cal-1',
          ingestedAt: DateTime.now().subtract(const Duration(minutes: 10)),
          priority: SignalPriority.high,
          expiresAt: DateTime.now().add(const Duration(hours: 2)),
          permissionsScope: 'calendar.read',
          payloadDigest: 'digest-1',
          confidenceHint: 0.9,
        ),
        ContextSignal(
          id: 'event-2',
          userId: 'user-123',
          source: ContextSource.email,
          sourceIdentifier: 'email-1',
          ingestedAt: DateTime.now().subtract(const Duration(hours: 3)),
          priority: SignalPriority.low,
          expiresAt: DateTime.now().add(const Duration(hours: 12)),
          permissionsScope: 'email.read',
          payloadDigest: 'digest-2',
          confidenceHint: 0.2,
        ),
      ];

      final suggestions = [
        AssistiveSuggestion(
          id: 's1',
          userId: 'user-123',
          triggerContextIds: const ['event-1'],
          generatedAt: DateTime.now(),
          type: SuggestionType.dailyPlan,
          message: 'Block focus time before demo',
          explanation: _explanation(ConfidenceBand.high),
          confidenceScore: 0.6,
          status: SuggestionStatus.pending,
        ),
        AssistiveSuggestion(
          id: 's2',
          userId: 'user-123',
          triggerContextIds: const ['event-2'],
          generatedAt: DateTime.now(),
          type: SuggestionType.reminder,
          message: 'Reply to weekly summary email',
          explanation: _explanation(ConfidenceBand.low),
          confidenceScore: 0.8,
          status: SuggestionStatus.pending,
        ),
      ];

      final ranked = ranker.rank(
        suggestions: suggestions,
        signals: signals,
        profile: profile,
      );

      expect(ranked.first.id, equals('s1'));
      expect(ranked.last.id, equals('s2'));
    });

    test('penalizes declined suggestions', () {
      final profile = _profile();
      final signals = <ContextSignal>[];

      final pending = AssistiveSuggestion(
        id: 'pending',
        userId: 'user-123',
        triggerContextIds: const [],
        generatedAt: DateTime.now(),
        type: SuggestionType.reminder,
        message: 'Confirm travel booking',
        explanation: _explanation(ConfidenceBand.medium),
        confidenceScore: 0.5,
        status: SuggestionStatus.pending,
      );

      final declined = pending.copyWith(
        id: 'declined',
        status: SuggestionStatus.declined,
      );

      final ranked = ranker.rank(
        suggestions: [pending, declined],
        signals: signals,
        profile: profile,
      );

      expect(ranked.first.id, equals('pending'));
      expect(ranked.last.id, equals('declined'));
    });
  });
}

SuggestionExplanation _explanation(ConfidenceBand band) {
  return SuggestionExplanation(
    sources: const [
      ExplanationSource(signalId: 'signal-123', summary: 'Test source'),
    ],
    rationale: 'Contract test rationale',
    confidenceBand: band,
  );
}

UserProfile _profile() {
  return const UserProfile(
    id: 'user-123',
    displayName: 'Casey Example',
    email: 'casey@example.com',
    locale: 'en_US',
    timeZone: 'America/Los_Angeles',
    workingHours: WorkingHours(
      startMinutes: 9 * 60,
      endMinutes: 17 * 60,
      weekdays: [1, 2, 3, 4, 5],
    ),
    notificationSettings: NotificationSettings(
      channels: ['push', 'email'],
      quietHours: null,
      allowCriticalAlerts: true,
    ),
    privacyConsents: {},
    personalBoundaries: PersonalBoundaries(
      topicsToAvoid: [],
      enforcedQuietHours: null,
    ),
  );
}
