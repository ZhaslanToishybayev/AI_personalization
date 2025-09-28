// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assistive_suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuggestionActionImpl _$$SuggestionActionImplFromJson(
  Map<String, dynamic> json,
) => _$SuggestionActionImpl(
  type: json['type'] as String,
  label: json['label'] as String,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$$SuggestionActionImplToJson(
  _$SuggestionActionImpl instance,
) => <String, dynamic>{
  'type': instance.type,
  'label': instance.label,
  'metadata': instance.metadata,
};

_$ExplanationSourceImpl _$$ExplanationSourceImplFromJson(
  Map<String, dynamic> json,
) => _$ExplanationSourceImpl(
  signalId: json['signal_id'] as String,
  summary: json['summary'] as String,
);

Map<String, dynamic> _$$ExplanationSourceImplToJson(
  _$ExplanationSourceImpl instance,
) => <String, dynamic>{
  'signal_id': instance.signalId,
  'summary': instance.summary,
};

_$SuggestionExplanationImpl _$$SuggestionExplanationImplFromJson(
  Map<String, dynamic> json,
) => _$SuggestionExplanationImpl(
  sources: (json['sources'] as List<dynamic>)
      .map((e) => ExplanationSource.fromJson(e as Map<String, dynamic>))
      .toList(),
  rationale: json['rationale'] as String,
  confidenceBand: const ConfidenceBandConverter().fromJson(
    json['confidence_band'] as String,
  ),
  nextSteps:
      (json['next_steps'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$SuggestionExplanationImplToJson(
  _$SuggestionExplanationImpl instance,
) => <String, dynamic>{
  'sources': instance.sources,
  'rationale': instance.rationale,
  'confidence_band': const ConfidenceBandConverter().toJson(
    instance.confidenceBand,
  ),
  'next_steps': instance.nextSteps,
};

_$BoundaryCheckImpl _$$BoundaryCheckImplFromJson(Map<String, dynamic> json) =>
    _$BoundaryCheckImpl(
      ruleId: json['rule_id'] as String,
      status: json['status'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$BoundaryCheckImplToJson(_$BoundaryCheckImpl instance) =>
    <String, dynamic>{
      'rule_id': instance.ruleId,
      'status': instance.status,
      'note': instance.note,
    };

_$AssistiveSuggestionImpl _$$AssistiveSuggestionImplFromJson(
  Map<String, dynamic> json,
) => _$AssistiveSuggestionImpl(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  triggerContextIds: (json['trigger_context_ids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  generatedAt: DateTime.parse(json['generated_at'] as String),
  type: const SuggestionTypeConverter().fromJson(
    json['suggestion_type'] as String,
  ),
  message: json['message'] as String,
  explanation: SuggestionExplanation.fromJson(
    json['explanation'] as Map<String, dynamic>,
  ),
  confidenceScore: const DoublePrecisionConverter().fromJson(
    json['confidence_score'] as num,
  ),
  status: const SuggestionStatusConverter().fromJson(json['status'] as String),
  feedbackNote: json['feedback_note'] as String?,
  respondedAt: json['responded_at'] == null
      ? null
      : DateTime.parse(json['responded_at'] as String),
  actions:
      (json['actions'] as List<dynamic>?)
          ?.map((e) => SuggestionAction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  boundaryChecks:
      (json['boundary_checks'] as List<dynamic>?)
          ?.map((e) => BoundaryCheck.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  boundaryViolationFlag: json['boundary_violation_flag'] as bool? ?? false,
);

Map<String, dynamic> _$$AssistiveSuggestionImplToJson(
  _$AssistiveSuggestionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'trigger_context_ids': instance.triggerContextIds,
  'generated_at': instance.generatedAt.toIso8601String(),
  'suggestion_type': const SuggestionTypeConverter().toJson(instance.type),
  'message': instance.message,
  'explanation': instance.explanation,
  'confidence_score': const DoublePrecisionConverter().toJson(
    instance.confidenceScore,
  ),
  'status': const SuggestionStatusConverter().toJson(instance.status),
  'feedback_note': instance.feedbackNote,
  'responded_at': instance.respondedAt?.toIso8601String(),
  'actions': instance.actions,
  'boundary_checks': instance.boundaryChecks,
  'boundary_violation_flag': instance.boundaryViolationFlag,
};
