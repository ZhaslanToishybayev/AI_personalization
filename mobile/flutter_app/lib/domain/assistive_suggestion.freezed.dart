// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assistive_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SuggestionAction _$SuggestionActionFromJson(Map<String, dynamic> json) {
  return _SuggestionAction.fromJson(json);
}

/// @nodoc
mixin _$SuggestionAction {
  String get type => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this SuggestionAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuggestionAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestionActionCopyWith<SuggestionAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionActionCopyWith<$Res> {
  factory $SuggestionActionCopyWith(
    SuggestionAction value,
    $Res Function(SuggestionAction) then,
  ) = _$SuggestionActionCopyWithImpl<$Res, SuggestionAction>;
  @useResult
  $Res call({String type, String label, Map<String, dynamic>? metadata});
}

/// @nodoc
class _$SuggestionActionCopyWithImpl<$Res, $Val extends SuggestionAction>
    implements $SuggestionActionCopyWith<$Res> {
  _$SuggestionActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestionAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SuggestionActionImplCopyWith<$Res>
    implements $SuggestionActionCopyWith<$Res> {
  factory _$$SuggestionActionImplCopyWith(
    _$SuggestionActionImpl value,
    $Res Function(_$SuggestionActionImpl) then,
  ) = __$$SuggestionActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String label, Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$SuggestionActionImplCopyWithImpl<$Res>
    extends _$SuggestionActionCopyWithImpl<$Res, _$SuggestionActionImpl>
    implements _$$SuggestionActionImplCopyWith<$Res> {
  __$$SuggestionActionImplCopyWithImpl(
    _$SuggestionActionImpl _value,
    $Res Function(_$SuggestionActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SuggestionAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? metadata = freezed,
  }) {
    return _then(
      _$SuggestionActionImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionActionImpl implements _SuggestionAction {
  const _$SuggestionActionImpl({
    required this.type,
    required this.label,
    final Map<String, dynamic>? metadata,
  }) : _metadata = metadata;

  factory _$SuggestionActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionActionImplFromJson(json);

  @override
  final String type;
  @override
  final String label;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SuggestionAction(type: $type, label: $label, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionActionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    label,
    const DeepCollectionEquality().hash(_metadata),
  );

  /// Create a copy of SuggestionAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionActionImplCopyWith<_$SuggestionActionImpl> get copyWith =>
      __$$SuggestionActionImplCopyWithImpl<_$SuggestionActionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionActionImplToJson(this);
  }
}

abstract class _SuggestionAction implements SuggestionAction {
  const factory _SuggestionAction({
    required final String type,
    required final String label,
    final Map<String, dynamic>? metadata,
  }) = _$SuggestionActionImpl;

  factory _SuggestionAction.fromJson(Map<String, dynamic> json) =
      _$SuggestionActionImpl.fromJson;

  @override
  String get type;
  @override
  String get label;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of SuggestionAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionActionImplCopyWith<_$SuggestionActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExplanationSource _$ExplanationSourceFromJson(Map<String, dynamic> json) {
  return _ExplanationSource.fromJson(json);
}

/// @nodoc
mixin _$ExplanationSource {
  @JsonKey(name: 'signal_id')
  String get signalId => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;

  /// Serializes this ExplanationSource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExplanationSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExplanationSourceCopyWith<ExplanationSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExplanationSourceCopyWith<$Res> {
  factory $ExplanationSourceCopyWith(
    ExplanationSource value,
    $Res Function(ExplanationSource) then,
  ) = _$ExplanationSourceCopyWithImpl<$Res, ExplanationSource>;
  @useResult
  $Res call({@JsonKey(name: 'signal_id') String signalId, String summary});
}

/// @nodoc
class _$ExplanationSourceCopyWithImpl<$Res, $Val extends ExplanationSource>
    implements $ExplanationSourceCopyWith<$Res> {
  _$ExplanationSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExplanationSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? signalId = null, Object? summary = null}) {
    return _then(
      _value.copyWith(
            signalId: null == signalId
                ? _value.signalId
                : signalId // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExplanationSourceImplCopyWith<$Res>
    implements $ExplanationSourceCopyWith<$Res> {
  factory _$$ExplanationSourceImplCopyWith(
    _$ExplanationSourceImpl value,
    $Res Function(_$ExplanationSourceImpl) then,
  ) = __$$ExplanationSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'signal_id') String signalId, String summary});
}

/// @nodoc
class __$$ExplanationSourceImplCopyWithImpl<$Res>
    extends _$ExplanationSourceCopyWithImpl<$Res, _$ExplanationSourceImpl>
    implements _$$ExplanationSourceImplCopyWith<$Res> {
  __$$ExplanationSourceImplCopyWithImpl(
    _$ExplanationSourceImpl _value,
    $Res Function(_$ExplanationSourceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExplanationSource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? signalId = null, Object? summary = null}) {
    return _then(
      _$ExplanationSourceImpl(
        signalId: null == signalId
            ? _value.signalId
            : signalId // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExplanationSourceImpl implements _ExplanationSource {
  const _$ExplanationSourceImpl({
    @JsonKey(name: 'signal_id') required this.signalId,
    required this.summary,
  });

  factory _$ExplanationSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExplanationSourceImplFromJson(json);

  @override
  @JsonKey(name: 'signal_id')
  final String signalId;
  @override
  final String summary;

  @override
  String toString() {
    return 'ExplanationSource(signalId: $signalId, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExplanationSourceImpl &&
            (identical(other.signalId, signalId) ||
                other.signalId == signalId) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, signalId, summary);

  /// Create a copy of ExplanationSource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExplanationSourceImplCopyWith<_$ExplanationSourceImpl> get copyWith =>
      __$$ExplanationSourceImplCopyWithImpl<_$ExplanationSourceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExplanationSourceImplToJson(this);
  }
}

abstract class _ExplanationSource implements ExplanationSource {
  const factory _ExplanationSource({
    @JsonKey(name: 'signal_id') required final String signalId,
    required final String summary,
  }) = _$ExplanationSourceImpl;

  factory _ExplanationSource.fromJson(Map<String, dynamic> json) =
      _$ExplanationSourceImpl.fromJson;

  @override
  @JsonKey(name: 'signal_id')
  String get signalId;
  @override
  String get summary;

  /// Create a copy of ExplanationSource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExplanationSourceImplCopyWith<_$ExplanationSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SuggestionExplanation _$SuggestionExplanationFromJson(
  Map<String, dynamic> json,
) {
  return _SuggestionExplanation.fromJson(json);
}

/// @nodoc
mixin _$SuggestionExplanation {
  List<ExplanationSource> get sources => throw _privateConstructorUsedError;
  String get rationale => throw _privateConstructorUsedError;
  @JsonKey(name: 'confidence_band')
  @ConfidenceBandConverter()
  ConfidenceBand get confidenceBand => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_steps')
  List<String> get nextSteps => throw _privateConstructorUsedError;

  /// Serializes this SuggestionExplanation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuggestionExplanation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestionExplanationCopyWith<SuggestionExplanation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionExplanationCopyWith<$Res> {
  factory $SuggestionExplanationCopyWith(
    SuggestionExplanation value,
    $Res Function(SuggestionExplanation) then,
  ) = _$SuggestionExplanationCopyWithImpl<$Res, SuggestionExplanation>;
  @useResult
  $Res call({
    List<ExplanationSource> sources,
    String rationale,
    @JsonKey(name: 'confidence_band')
    @ConfidenceBandConverter()
    ConfidenceBand confidenceBand,
    @JsonKey(name: 'next_steps') List<String> nextSteps,
  });
}

/// @nodoc
class _$SuggestionExplanationCopyWithImpl<
  $Res,
  $Val extends SuggestionExplanation
>
    implements $SuggestionExplanationCopyWith<$Res> {
  _$SuggestionExplanationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestionExplanation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? rationale = null,
    Object? confidenceBand = null,
    Object? nextSteps = null,
  }) {
    return _then(
      _value.copyWith(
            sources: null == sources
                ? _value.sources
                : sources // ignore: cast_nullable_to_non_nullable
                      as List<ExplanationSource>,
            rationale: null == rationale
                ? _value.rationale
                : rationale // ignore: cast_nullable_to_non_nullable
                      as String,
            confidenceBand: null == confidenceBand
                ? _value.confidenceBand
                : confidenceBand // ignore: cast_nullable_to_non_nullable
                      as ConfidenceBand,
            nextSteps: null == nextSteps
                ? _value.nextSteps
                : nextSteps // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SuggestionExplanationImplCopyWith<$Res>
    implements $SuggestionExplanationCopyWith<$Res> {
  factory _$$SuggestionExplanationImplCopyWith(
    _$SuggestionExplanationImpl value,
    $Res Function(_$SuggestionExplanationImpl) then,
  ) = __$$SuggestionExplanationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ExplanationSource> sources,
    String rationale,
    @JsonKey(name: 'confidence_band')
    @ConfidenceBandConverter()
    ConfidenceBand confidenceBand,
    @JsonKey(name: 'next_steps') List<String> nextSteps,
  });
}

/// @nodoc
class __$$SuggestionExplanationImplCopyWithImpl<$Res>
    extends
        _$SuggestionExplanationCopyWithImpl<$Res, _$SuggestionExplanationImpl>
    implements _$$SuggestionExplanationImplCopyWith<$Res> {
  __$$SuggestionExplanationImplCopyWithImpl(
    _$SuggestionExplanationImpl _value,
    $Res Function(_$SuggestionExplanationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SuggestionExplanation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? rationale = null,
    Object? confidenceBand = null,
    Object? nextSteps = null,
  }) {
    return _then(
      _$SuggestionExplanationImpl(
        sources: null == sources
            ? _value._sources
            : sources // ignore: cast_nullable_to_non_nullable
                  as List<ExplanationSource>,
        rationale: null == rationale
            ? _value.rationale
            : rationale // ignore: cast_nullable_to_non_nullable
                  as String,
        confidenceBand: null == confidenceBand
            ? _value.confidenceBand
            : confidenceBand // ignore: cast_nullable_to_non_nullable
                  as ConfidenceBand,
        nextSteps: null == nextSteps
            ? _value._nextSteps
            : nextSteps // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionExplanationImpl extends _SuggestionExplanation {
  const _$SuggestionExplanationImpl({
    required final List<ExplanationSource> sources,
    required this.rationale,
    @JsonKey(name: 'confidence_band')
    @ConfidenceBandConverter()
    required this.confidenceBand,
    @JsonKey(name: 'next_steps') final List<String> nextSteps = const [],
  }) : _sources = sources,
       _nextSteps = nextSteps,
       super._();

  factory _$SuggestionExplanationImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionExplanationImplFromJson(json);

  final List<ExplanationSource> _sources;
  @override
  List<ExplanationSource> get sources {
    if (_sources is EqualUnmodifiableListView) return _sources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sources);
  }

  @override
  final String rationale;
  @override
  @JsonKey(name: 'confidence_band')
  @ConfidenceBandConverter()
  final ConfidenceBand confidenceBand;
  final List<String> _nextSteps;
  @override
  @JsonKey(name: 'next_steps')
  List<String> get nextSteps {
    if (_nextSteps is EqualUnmodifiableListView) return _nextSteps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextSteps);
  }

  @override
  String toString() {
    return 'SuggestionExplanation(sources: $sources, rationale: $rationale, confidenceBand: $confidenceBand, nextSteps: $nextSteps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionExplanationImpl &&
            const DeepCollectionEquality().equals(other._sources, _sources) &&
            (identical(other.rationale, rationale) ||
                other.rationale == rationale) &&
            (identical(other.confidenceBand, confidenceBand) ||
                other.confidenceBand == confidenceBand) &&
            const DeepCollectionEquality().equals(
              other._nextSteps,
              _nextSteps,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_sources),
    rationale,
    confidenceBand,
    const DeepCollectionEquality().hash(_nextSteps),
  );

  /// Create a copy of SuggestionExplanation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionExplanationImplCopyWith<_$SuggestionExplanationImpl>
  get copyWith =>
      __$$SuggestionExplanationImplCopyWithImpl<_$SuggestionExplanationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionExplanationImplToJson(this);
  }
}

abstract class _SuggestionExplanation extends SuggestionExplanation {
  const factory _SuggestionExplanation({
    required final List<ExplanationSource> sources,
    required final String rationale,
    @JsonKey(name: 'confidence_band')
    @ConfidenceBandConverter()
    required final ConfidenceBand confidenceBand,
    @JsonKey(name: 'next_steps') final List<String> nextSteps,
  }) = _$SuggestionExplanationImpl;
  const _SuggestionExplanation._() : super._();

  factory _SuggestionExplanation.fromJson(Map<String, dynamic> json) =
      _$SuggestionExplanationImpl.fromJson;

  @override
  List<ExplanationSource> get sources;
  @override
  String get rationale;
  @override
  @JsonKey(name: 'confidence_band')
  @ConfidenceBandConverter()
  ConfidenceBand get confidenceBand;
  @override
  @JsonKey(name: 'next_steps')
  List<String> get nextSteps;

  /// Create a copy of SuggestionExplanation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionExplanationImplCopyWith<_$SuggestionExplanationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BoundaryCheck _$BoundaryCheckFromJson(Map<String, dynamic> json) {
  return _BoundaryCheck.fromJson(json);
}

/// @nodoc
mixin _$BoundaryCheck {
  @JsonKey(name: 'rule_id')
  String get ruleId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this BoundaryCheck to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoundaryCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoundaryCheckCopyWith<BoundaryCheck> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundaryCheckCopyWith<$Res> {
  factory $BoundaryCheckCopyWith(
    BoundaryCheck value,
    $Res Function(BoundaryCheck) then,
  ) = _$BoundaryCheckCopyWithImpl<$Res, BoundaryCheck>;
  @useResult
  $Res call({
    @JsonKey(name: 'rule_id') String ruleId,
    String status,
    String? note,
  });
}

/// @nodoc
class _$BoundaryCheckCopyWithImpl<$Res, $Val extends BoundaryCheck>
    implements $BoundaryCheckCopyWith<$Res> {
  _$BoundaryCheckCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoundaryCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleId = null,
    Object? status = null,
    Object? note = freezed,
  }) {
    return _then(
      _value.copyWith(
            ruleId: null == ruleId
                ? _value.ruleId
                : ruleId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BoundaryCheckImplCopyWith<$Res>
    implements $BoundaryCheckCopyWith<$Res> {
  factory _$$BoundaryCheckImplCopyWith(
    _$BoundaryCheckImpl value,
    $Res Function(_$BoundaryCheckImpl) then,
  ) = __$$BoundaryCheckImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'rule_id') String ruleId,
    String status,
    String? note,
  });
}

/// @nodoc
class __$$BoundaryCheckImplCopyWithImpl<$Res>
    extends _$BoundaryCheckCopyWithImpl<$Res, _$BoundaryCheckImpl>
    implements _$$BoundaryCheckImplCopyWith<$Res> {
  __$$BoundaryCheckImplCopyWithImpl(
    _$BoundaryCheckImpl _value,
    $Res Function(_$BoundaryCheckImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BoundaryCheck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ruleId = null,
    Object? status = null,
    Object? note = freezed,
  }) {
    return _then(
      _$BoundaryCheckImpl(
        ruleId: null == ruleId
            ? _value.ruleId
            : ruleId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BoundaryCheckImpl extends _BoundaryCheck {
  const _$BoundaryCheckImpl({
    @JsonKey(name: 'rule_id') required this.ruleId,
    required this.status,
    this.note,
  }) : super._();

  factory _$BoundaryCheckImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoundaryCheckImplFromJson(json);

  @override
  @JsonKey(name: 'rule_id')
  final String ruleId;
  @override
  final String status;
  @override
  final String? note;

  @override
  String toString() {
    return 'BoundaryCheck(ruleId: $ruleId, status: $status, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundaryCheckImpl &&
            (identical(other.ruleId, ruleId) || other.ruleId == ruleId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ruleId, status, note);

  /// Create a copy of BoundaryCheck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundaryCheckImplCopyWith<_$BoundaryCheckImpl> get copyWith =>
      __$$BoundaryCheckImplCopyWithImpl<_$BoundaryCheckImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoundaryCheckImplToJson(this);
  }
}

abstract class _BoundaryCheck extends BoundaryCheck {
  const factory _BoundaryCheck({
    @JsonKey(name: 'rule_id') required final String ruleId,
    required final String status,
    final String? note,
  }) = _$BoundaryCheckImpl;
  const _BoundaryCheck._() : super._();

  factory _BoundaryCheck.fromJson(Map<String, dynamic> json) =
      _$BoundaryCheckImpl.fromJson;

  @override
  @JsonKey(name: 'rule_id')
  String get ruleId;
  @override
  String get status;
  @override
  String? get note;

  /// Create a copy of BoundaryCheck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoundaryCheckImplCopyWith<_$BoundaryCheckImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AssistiveSuggestion _$AssistiveSuggestionFromJson(Map<String, dynamic> json) {
  return _AssistiveSuggestion.fromJson(json);
}

/// @nodoc
mixin _$AssistiveSuggestion {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'trigger_context_ids')
  List<String> get triggerContextIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'generated_at')
  DateTime get generatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'suggestion_type')
  @SuggestionTypeConverter()
  SuggestionType get type => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  SuggestionExplanation get explanation => throw _privateConstructorUsedError;
  @JsonKey(name: 'confidence_score')
  @DoublePrecisionConverter()
  double get confidenceScore => throw _privateConstructorUsedError;
  @SuggestionStatusConverter()
  SuggestionStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'feedback_note')
  String? get feedbackNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'responded_at')
  DateTime? get respondedAt => throw _privateConstructorUsedError;
  List<SuggestionAction> get actions => throw _privateConstructorUsedError;
  @JsonKey(name: 'boundary_checks')
  List<BoundaryCheck> get boundaryChecks => throw _privateConstructorUsedError;
  @JsonKey(name: 'boundary_violation_flag')
  bool get boundaryViolationFlag => throw _privateConstructorUsedError;

  /// Serializes this AssistiveSuggestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssistiveSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssistiveSuggestionCopyWith<AssistiveSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssistiveSuggestionCopyWith<$Res> {
  factory $AssistiveSuggestionCopyWith(
    AssistiveSuggestion value,
    $Res Function(AssistiveSuggestion) then,
  ) = _$AssistiveSuggestionCopyWithImpl<$Res, AssistiveSuggestion>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'trigger_context_ids') List<String> triggerContextIds,
    @JsonKey(name: 'generated_at') DateTime generatedAt,
    @JsonKey(name: 'suggestion_type')
    @SuggestionTypeConverter()
    SuggestionType type,
    String message,
    SuggestionExplanation explanation,
    @JsonKey(name: 'confidence_score')
    @DoublePrecisionConverter()
    double confidenceScore,
    @SuggestionStatusConverter() SuggestionStatus status,
    @JsonKey(name: 'feedback_note') String? feedbackNote,
    @JsonKey(name: 'responded_at') DateTime? respondedAt,
    List<SuggestionAction> actions,
    @JsonKey(name: 'boundary_checks') List<BoundaryCheck> boundaryChecks,
    @JsonKey(name: 'boundary_violation_flag') bool boundaryViolationFlag,
  });

  $SuggestionExplanationCopyWith<$Res> get explanation;
}

/// @nodoc
class _$AssistiveSuggestionCopyWithImpl<$Res, $Val extends AssistiveSuggestion>
    implements $AssistiveSuggestionCopyWith<$Res> {
  _$AssistiveSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssistiveSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? triggerContextIds = null,
    Object? generatedAt = null,
    Object? type = null,
    Object? message = null,
    Object? explanation = null,
    Object? confidenceScore = null,
    Object? status = null,
    Object? feedbackNote = freezed,
    Object? respondedAt = freezed,
    Object? actions = null,
    Object? boundaryChecks = null,
    Object? boundaryViolationFlag = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            triggerContextIds: null == triggerContextIds
                ? _value.triggerContextIds
                : triggerContextIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as SuggestionType,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            explanation: null == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as SuggestionExplanation,
            confidenceScore: null == confidenceScore
                ? _value.confidenceScore
                : confidenceScore // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as SuggestionStatus,
            feedbackNote: freezed == feedbackNote
                ? _value.feedbackNote
                : feedbackNote // ignore: cast_nullable_to_non_nullable
                      as String?,
            respondedAt: freezed == respondedAt
                ? _value.respondedAt
                : respondedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            actions: null == actions
                ? _value.actions
                : actions // ignore: cast_nullable_to_non_nullable
                      as List<SuggestionAction>,
            boundaryChecks: null == boundaryChecks
                ? _value.boundaryChecks
                : boundaryChecks // ignore: cast_nullable_to_non_nullable
                      as List<BoundaryCheck>,
            boundaryViolationFlag: null == boundaryViolationFlag
                ? _value.boundaryViolationFlag
                : boundaryViolationFlag // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of AssistiveSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SuggestionExplanationCopyWith<$Res> get explanation {
    return $SuggestionExplanationCopyWith<$Res>(_value.explanation, (value) {
      return _then(_value.copyWith(explanation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssistiveSuggestionImplCopyWith<$Res>
    implements $AssistiveSuggestionCopyWith<$Res> {
  factory _$$AssistiveSuggestionImplCopyWith(
    _$AssistiveSuggestionImpl value,
    $Res Function(_$AssistiveSuggestionImpl) then,
  ) = __$$AssistiveSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'user_id') String userId,
    @JsonKey(name: 'trigger_context_ids') List<String> triggerContextIds,
    @JsonKey(name: 'generated_at') DateTime generatedAt,
    @JsonKey(name: 'suggestion_type')
    @SuggestionTypeConverter()
    SuggestionType type,
    String message,
    SuggestionExplanation explanation,
    @JsonKey(name: 'confidence_score')
    @DoublePrecisionConverter()
    double confidenceScore,
    @SuggestionStatusConverter() SuggestionStatus status,
    @JsonKey(name: 'feedback_note') String? feedbackNote,
    @JsonKey(name: 'responded_at') DateTime? respondedAt,
    List<SuggestionAction> actions,
    @JsonKey(name: 'boundary_checks') List<BoundaryCheck> boundaryChecks,
    @JsonKey(name: 'boundary_violation_flag') bool boundaryViolationFlag,
  });

  @override
  $SuggestionExplanationCopyWith<$Res> get explanation;
}

/// @nodoc
class __$$AssistiveSuggestionImplCopyWithImpl<$Res>
    extends _$AssistiveSuggestionCopyWithImpl<$Res, _$AssistiveSuggestionImpl>
    implements _$$AssistiveSuggestionImplCopyWith<$Res> {
  __$$AssistiveSuggestionImplCopyWithImpl(
    _$AssistiveSuggestionImpl _value,
    $Res Function(_$AssistiveSuggestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AssistiveSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? triggerContextIds = null,
    Object? generatedAt = null,
    Object? type = null,
    Object? message = null,
    Object? explanation = null,
    Object? confidenceScore = null,
    Object? status = null,
    Object? feedbackNote = freezed,
    Object? respondedAt = freezed,
    Object? actions = null,
    Object? boundaryChecks = null,
    Object? boundaryViolationFlag = null,
  }) {
    return _then(
      _$AssistiveSuggestionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        triggerContextIds: null == triggerContextIds
            ? _value._triggerContextIds
            : triggerContextIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as SuggestionType,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        explanation: null == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as SuggestionExplanation,
        confidenceScore: null == confidenceScore
            ? _value.confidenceScore
            : confidenceScore // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SuggestionStatus,
        feedbackNote: freezed == feedbackNote
            ? _value.feedbackNote
            : feedbackNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        respondedAt: freezed == respondedAt
            ? _value.respondedAt
            : respondedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        actions: null == actions
            ? _value._actions
            : actions // ignore: cast_nullable_to_non_nullable
                  as List<SuggestionAction>,
        boundaryChecks: null == boundaryChecks
            ? _value._boundaryChecks
            : boundaryChecks // ignore: cast_nullable_to_non_nullable
                  as List<BoundaryCheck>,
        boundaryViolationFlag: null == boundaryViolationFlag
            ? _value.boundaryViolationFlag
            : boundaryViolationFlag // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssistiveSuggestionImpl extends _AssistiveSuggestion {
  const _$AssistiveSuggestionImpl({
    required this.id,
    @JsonKey(name: 'user_id') required this.userId,
    @JsonKey(name: 'trigger_context_ids')
    required final List<String> triggerContextIds,
    @JsonKey(name: 'generated_at') required this.generatedAt,
    @JsonKey(name: 'suggestion_type')
    @SuggestionTypeConverter()
    required this.type,
    required this.message,
    required this.explanation,
    @JsonKey(name: 'confidence_score')
    @DoublePrecisionConverter()
    required this.confidenceScore,
    @SuggestionStatusConverter() required this.status,
    @JsonKey(name: 'feedback_note') this.feedbackNote,
    @JsonKey(name: 'responded_at') this.respondedAt,
    final List<SuggestionAction> actions = const [],
    @JsonKey(name: 'boundary_checks')
    final List<BoundaryCheck> boundaryChecks = const [],
    @JsonKey(name: 'boundary_violation_flag')
    this.boundaryViolationFlag = false,
  }) : _triggerContextIds = triggerContextIds,
       _actions = actions,
       _boundaryChecks = boundaryChecks,
       super._();

  factory _$AssistiveSuggestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssistiveSuggestionImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  final List<String> _triggerContextIds;
  @override
  @JsonKey(name: 'trigger_context_ids')
  List<String> get triggerContextIds {
    if (_triggerContextIds is EqualUnmodifiableListView)
      return _triggerContextIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_triggerContextIds);
  }

  @override
  @JsonKey(name: 'generated_at')
  final DateTime generatedAt;
  @override
  @JsonKey(name: 'suggestion_type')
  @SuggestionTypeConverter()
  final SuggestionType type;
  @override
  final String message;
  @override
  final SuggestionExplanation explanation;
  @override
  @JsonKey(name: 'confidence_score')
  @DoublePrecisionConverter()
  final double confidenceScore;
  @override
  @SuggestionStatusConverter()
  final SuggestionStatus status;
  @override
  @JsonKey(name: 'feedback_note')
  final String? feedbackNote;
  @override
  @JsonKey(name: 'responded_at')
  final DateTime? respondedAt;
  final List<SuggestionAction> _actions;
  @override
  @JsonKey()
  List<SuggestionAction> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  final List<BoundaryCheck> _boundaryChecks;
  @override
  @JsonKey(name: 'boundary_checks')
  List<BoundaryCheck> get boundaryChecks {
    if (_boundaryChecks is EqualUnmodifiableListView) return _boundaryChecks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boundaryChecks);
  }

  @override
  @JsonKey(name: 'boundary_violation_flag')
  final bool boundaryViolationFlag;

  @override
  String toString() {
    return 'AssistiveSuggestion(id: $id, userId: $userId, triggerContextIds: $triggerContextIds, generatedAt: $generatedAt, type: $type, message: $message, explanation: $explanation, confidenceScore: $confidenceScore, status: $status, feedbackNote: $feedbackNote, respondedAt: $respondedAt, actions: $actions, boundaryChecks: $boundaryChecks, boundaryViolationFlag: $boundaryViolationFlag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssistiveSuggestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
              other._triggerContextIds,
              _triggerContextIds,
            ) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.feedbackNote, feedbackNote) ||
                other.feedbackNote == feedbackNote) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt) &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            const DeepCollectionEquality().equals(
              other._boundaryChecks,
              _boundaryChecks,
            ) &&
            (identical(other.boundaryViolationFlag, boundaryViolationFlag) ||
                other.boundaryViolationFlag == boundaryViolationFlag));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    const DeepCollectionEquality().hash(_triggerContextIds),
    generatedAt,
    type,
    message,
    explanation,
    confidenceScore,
    status,
    feedbackNote,
    respondedAt,
    const DeepCollectionEquality().hash(_actions),
    const DeepCollectionEquality().hash(_boundaryChecks),
    boundaryViolationFlag,
  );

  /// Create a copy of AssistiveSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssistiveSuggestionImplCopyWith<_$AssistiveSuggestionImpl> get copyWith =>
      __$$AssistiveSuggestionImplCopyWithImpl<_$AssistiveSuggestionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AssistiveSuggestionImplToJson(this);
  }
}

abstract class _AssistiveSuggestion extends AssistiveSuggestion {
  const factory _AssistiveSuggestion({
    required final String id,
    @JsonKey(name: 'user_id') required final String userId,
    @JsonKey(name: 'trigger_context_ids')
    required final List<String> triggerContextIds,
    @JsonKey(name: 'generated_at') required final DateTime generatedAt,
    @JsonKey(name: 'suggestion_type')
    @SuggestionTypeConverter()
    required final SuggestionType type,
    required final String message,
    required final SuggestionExplanation explanation,
    @JsonKey(name: 'confidence_score')
    @DoublePrecisionConverter()
    required final double confidenceScore,
    @SuggestionStatusConverter() required final SuggestionStatus status,
    @JsonKey(name: 'feedback_note') final String? feedbackNote,
    @JsonKey(name: 'responded_at') final DateTime? respondedAt,
    final List<SuggestionAction> actions,
    @JsonKey(name: 'boundary_checks') final List<BoundaryCheck> boundaryChecks,
    @JsonKey(name: 'boundary_violation_flag') final bool boundaryViolationFlag,
  }) = _$AssistiveSuggestionImpl;
  const _AssistiveSuggestion._() : super._();

  factory _AssistiveSuggestion.fromJson(Map<String, dynamic> json) =
      _$AssistiveSuggestionImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'trigger_context_ids')
  List<String> get triggerContextIds;
  @override
  @JsonKey(name: 'generated_at')
  DateTime get generatedAt;
  @override
  @JsonKey(name: 'suggestion_type')
  @SuggestionTypeConverter()
  SuggestionType get type;
  @override
  String get message;
  @override
  SuggestionExplanation get explanation;
  @override
  @JsonKey(name: 'confidence_score')
  @DoublePrecisionConverter()
  double get confidenceScore;
  @override
  @SuggestionStatusConverter()
  SuggestionStatus get status;
  @override
  @JsonKey(name: 'feedback_note')
  String? get feedbackNote;
  @override
  @JsonKey(name: 'responded_at')
  DateTime? get respondedAt;
  @override
  List<SuggestionAction> get actions;
  @override
  @JsonKey(name: 'boundary_checks')
  List<BoundaryCheck> get boundaryChecks;
  @override
  @JsonKey(name: 'boundary_violation_flag')
  bool get boundaryViolationFlag;

  /// Create a copy of AssistiveSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssistiveSuggestionImplCopyWith<_$AssistiveSuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
