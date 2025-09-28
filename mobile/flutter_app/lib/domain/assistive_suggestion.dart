// ignore_for_file: invalid_annotation_target

import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assistive_suggestion.freezed.dart';
part 'assistive_suggestion.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum SuggestionType { dailyPlan, reminder, summary, automation, alert }

@JsonEnum(fieldRename: FieldRename.snake)
enum SuggestionStatus {
  pending,
  delivered,
  accepted,
  declined,
  snoozed,
  expired,
}

enum ConfidenceBand { veryLow, low, medium, high, veryHigh }

@freezed
class SuggestionAction with _$SuggestionAction {
  const factory SuggestionAction({
    required String type,
    required String label,
    Map<String, dynamic>? metadata,
  }) = _SuggestionAction;

  factory SuggestionAction.fromJson(Map<String, dynamic> json) =>
      _$SuggestionActionFromJson(json);
}

@freezed
class ExplanationSource with _$ExplanationSource {
  const factory ExplanationSource({
    @JsonKey(name: 'signal_id') required String signalId,
    required String summary,
  }) = _ExplanationSource;

  factory ExplanationSource.fromJson(Map<String, dynamic> json) =>
      _$ExplanationSourceFromJson(json);
}

@freezed
class SuggestionExplanation with _$SuggestionExplanation {
  const factory SuggestionExplanation({
    required List<ExplanationSource> sources,
    required String rationale,
    @JsonKey(name: 'confidence_band')
    @ConfidenceBandConverter()
    required ConfidenceBand confidenceBand,
    @JsonKey(name: 'next_steps') @Default([]) List<String> nextSteps,
  }) = _SuggestionExplanation;

  const SuggestionExplanation._();

  factory SuggestionExplanation.fromJson(Map<String, dynamic> json) =>
      _$SuggestionExplanationFromJson(json);

  String get confidenceLabel => switch (confidenceBand) {
        ConfidenceBand.veryHigh => 'very_high',
        ConfidenceBand.high => 'high',
        ConfidenceBand.medium => 'medium',
        ConfidenceBand.low => 'low',
        ConfidenceBand.veryLow => 'very_low',
      };
}

@freezed
class BoundaryCheck with _$BoundaryCheck {
  const factory BoundaryCheck({
    @JsonKey(name: 'rule_id') required String ruleId,
    required String status,
    String? note,
  }) = _BoundaryCheck;

  const BoundaryCheck._();

  factory BoundaryCheck.fromJson(Map<String, dynamic> json) =>
      _$BoundaryCheckFromJson(json);

  bool get isOverride => status.toLowerCase() == 'overridden';
}

@freezed
class AssistiveSuggestion with _$AssistiveSuggestion {
  const factory AssistiveSuggestion({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'trigger_context_ids')
    required List<String> triggerContextIds,
    @JsonKey(name: 'generated_at') required DateTime generatedAt,
    @JsonKey(name: 'suggestion_type')
    @SuggestionTypeConverter()
    required SuggestionType type,
    required String message,
    required SuggestionExplanation explanation,
    @JsonKey(name: 'confidence_score')
    @DoublePrecisionConverter()
    required double confidenceScore,
    @SuggestionStatusConverter() required SuggestionStatus status,
    @JsonKey(name: 'feedback_note') String? feedbackNote,
    @JsonKey(name: 'responded_at') DateTime? respondedAt,
    @Default([]) List<SuggestionAction> actions,
    @JsonKey(name: 'boundary_checks')
    @Default([])
    List<BoundaryCheck> boundaryChecks,
    @JsonKey(name: 'boundary_violation_flag')
    @Default(false)
    bool boundaryViolationFlag,
  }) = _AssistiveSuggestion;

  const AssistiveSuggestion._();

  factory AssistiveSuggestion.fromJson(Map<String, dynamic> json) =>
      _$AssistiveSuggestionFromJson(json);

  AssistiveSuggestion accept({String? note, DateTime? at}) {
    return copyWith(
      status: SuggestionStatus.accepted,
      feedbackNote: note,
      respondedAt: at ?? DateTime.now(),
    );
  }

  AssistiveSuggestion decline({String? note, DateTime? at}) {
    return copyWith(
      status: SuggestionStatus.declined,
      feedbackNote: note,
      respondedAt: at ?? DateTime.now(),
    );
  }

  AssistiveSuggestion snooze({Duration duration = const Duration(hours: 1)}) {
    return copyWith(
      status: SuggestionStatus.snoozed,
      respondedAt: DateTime.now().add(duration),
    );
  }

  bool isConfidenceAbove(double threshold) => confidenceScore >= threshold;

  SuggestionAction? actionByType(String type) =>
      actions.firstWhereOrNull((action) => action.type == type);

  ConfidenceBand confidenceBand() => explanation.confidenceBand;
}

class DoublePrecisionConverter implements JsonConverter<double, num> {
  const DoublePrecisionConverter();

  @override
  double fromJson(num json) => json.toDouble();

  @override
  num toJson(double object) => double.parse(object.toStringAsFixed(4));
}

class ConfidenceBandConverter implements JsonConverter<ConfidenceBand, String> {
  const ConfidenceBandConverter();

  static const _mapping = {
    'very_low': ConfidenceBand.veryLow,
    'low': ConfidenceBand.low,
    'medium': ConfidenceBand.medium,
    'high': ConfidenceBand.high,
    'very_high': ConfidenceBand.veryHigh,
  };

  @override
  ConfidenceBand fromJson(String json) =>
      _mapping[json.toLowerCase()] ?? ConfidenceBand.medium;

  @override
  String toJson(ConfidenceBand object) => switch (object) {
        ConfidenceBand.veryLow => 'very_low',
        ConfidenceBand.low => 'low',
        ConfidenceBand.medium => 'medium',
        ConfidenceBand.high => 'high',
        ConfidenceBand.veryHigh => 'very_high',
      };
}

class SuggestionTypeConverter
    implements JsonConverter<SuggestionType, String> {
  const SuggestionTypeConverter();

  static const Map<String, SuggestionType> _mapping = {
    'daily_plan': SuggestionType.dailyPlan,
    'reminder': SuggestionType.reminder,
    'summary': SuggestionType.summary,
    'automation': SuggestionType.automation,
    'alert': SuggestionType.alert,
  };

  @override
  SuggestionType fromJson(String json) =>
      _mapping[json.toLowerCase()] ?? SuggestionType.reminder;

  @override
  String toJson(SuggestionType object) => _mapping.entries
      .firstWhere((entry) => entry.value == object,
          orElse: () => const MapEntry('reminder', SuggestionType.reminder))
      .key;
}

class SuggestionStatusConverter
    implements JsonConverter<SuggestionStatus, String> {
  const SuggestionStatusConverter();

  @override
  SuggestionStatus fromJson(String json) {
    final normalized = json.toLowerCase();
    return SuggestionStatus.values.firstWhere(
      (value) => value.name.toLowerCase() == normalized,
      orElse: () => SuggestionStatus.pending,
    );
  }

  @override
  String toJson(SuggestionStatus object) => object.name.toLowerCase();
}
