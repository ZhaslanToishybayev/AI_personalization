import 'dart:math';

import 'package:flutter_app/data/local/local_store.dart';
import 'package:flutter_app/domain/assistive_suggestion.dart';
import 'package:flutter_app/domain/context_signal.dart';
import 'package:flutter_app/domain/user_profile.dart';
import 'package:flutter_app/services/boundary_guard.dart' as guard;

class PersonalizationEngine {
  PersonalizationEngine({required LocalStore localStore})
      : _localStore = localStore,
        ranker = SuggestionRanker(),
        boundaryGuard = guard.BoundaryGuard(rules: []);

  final LocalStore _localStore;
  final SuggestionRanker ranker;
  final guard.BoundaryGuard boundaryGuard;

  Future<List<AssistiveSuggestion>> personalize({
    required UserProfile profile,
    required List<AssistiveSuggestion> candidates,
    List<ContextSignal>? signals,
    double confidenceThreshold = 0.3,
  }) async {
    final activeSignals =
        signals ?? await _localStore.activeContextSignals(profile.id);

    final allowed = candidates.where((suggestion) {
      if (!suggestion.isConfidenceAbove(confidenceThreshold)) {
        return false;
      }
      if (profile.personalBoundaries.isSuppressed(DateTime.now())) {
        return false;
      }
      final decision = boundaryGuard.evaluate(
        topic: suggestion.message,
        timestamp: DateTime.now(),
        quietHoursOverride: suggestion.boundaryChecks
            .any((check) => check.isOverride || check.status == 'overridden'),
      );
      return decision.allowed;
    }).toList();

    final ranked = ranker.rank(
      suggestions: allowed,
      signals: activeSignals,
      profile: profile,
    );

    await _localStore.upsertSuggestions(ranked);
    return ranked;
  }

  String confidenceBandFor(double score) {
    final normalized = score.clamp(0.0, 1.0);
    final band = () {
      if (normalized >= 0.9) {
        return ConfidenceBand.veryHigh;
      }
      if (normalized >= 0.65) {
        return ConfidenceBand.high;
      }
      if (normalized >= 0.4) {
        return ConfidenceBand.medium;
      }
      if (normalized >= 0.2) {
        return ConfidenceBand.low;
      }
      return ConfidenceBand.veryLow;
    }();
    return switch (band) {
      ConfidenceBand.veryHigh => 'very_high',
      ConfidenceBand.high => 'high',
      ConfidenceBand.medium => 'medium',
      ConfidenceBand.low => 'low',
      ConfidenceBand.veryLow => 'very_low',
    };
  }
}

class SuggestionRanker {
  List<AssistiveSuggestion> rank({
    required List<AssistiveSuggestion> suggestions,
    required List<ContextSignal> signals,
    required UserProfile profile,
  }) {
    final signalScores = <String, int>{
      for (final signal in signals) signal.id: signal.priorityScore(),
    };

    final sorted = [...suggestions]
      ..sort((a, b) {
        final scoreA = _score(a, signalScores, profile);
        final scoreB = _score(b, signalScores, profile);
        return scoreB.compareTo(scoreA);
      });

    return sorted;
  }

  int _score(
    AssistiveSuggestion suggestion,
    Map<String, int> signalScores,
    UserProfile profile,
  ) {
    final baseConfidence = (suggestion.confidenceScore * 100).round();
    final contextScore = suggestion.triggerContextIds
        .map((id) => signalScores[id] ?? 50)
        .fold(0, max);
    final feedbackBoost = switch (suggestion.status) {
      SuggestionStatus.accepted => 25,
      SuggestionStatus.declined => -25,
      SuggestionStatus.snoozed => -10,
      SuggestionStatus.delivered => 5,
      _ => 0,
    };
    final quietPenalty = profile.notificationSettings.isQuietTime(
          DateTime.now(),
          profile.timeZone,
        )
        ? -30
        : 0;
    final violationPenalty = suggestion.boundaryViolationFlag ? -100 : 0;

    return baseConfidence + contextScore + feedbackBoost + quietPenalty +
        violationPenalty;
  }
}
