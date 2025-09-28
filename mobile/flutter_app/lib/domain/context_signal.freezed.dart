// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'context_signal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ContextSignal _$ContextSignalFromJson(Map<String, dynamic> json) {
  return _ContextSignal.fromJson(json);
}

/// @nodoc
mixin _$ContextSignal {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  ContextSource get source => throw _privateConstructorUsedError;
  String get sourceIdentifier => throw _privateConstructorUsedError;
  DateTime get ingestedAt => throw _privateConstructorUsedError;
  SignalPriority get priority => throw _privateConstructorUsedError;
  String get permissionsScope => throw _privateConstructorUsedError;
  String get payloadDigest => throw _privateConstructorUsedError;
  double? get confidenceHint => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this ContextSignal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContextSignal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContextSignalCopyWith<ContextSignal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextSignalCopyWith<$Res> {
  factory $ContextSignalCopyWith(
    ContextSignal value,
    $Res Function(ContextSignal) then,
  ) = _$ContextSignalCopyWithImpl<$Res, ContextSignal>;
  @useResult
  $Res call({
    String id,
    String userId,
    ContextSource source,
    String sourceIdentifier,
    DateTime ingestedAt,
    SignalPriority priority,
    String permissionsScope,
    String payloadDigest,
    double? confidenceHint,
    DateTime? expiresAt,
  });
}

/// @nodoc
class _$ContextSignalCopyWithImpl<$Res, $Val extends ContextSignal>
    implements $ContextSignalCopyWith<$Res> {
  _$ContextSignalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContextSignal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? source = null,
    Object? sourceIdentifier = null,
    Object? ingestedAt = null,
    Object? priority = null,
    Object? permissionsScope = null,
    Object? payloadDigest = null,
    Object? confidenceHint = freezed,
    Object? expiresAt = freezed,
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
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as ContextSource,
            sourceIdentifier: null == sourceIdentifier
                ? _value.sourceIdentifier
                : sourceIdentifier // ignore: cast_nullable_to_non_nullable
                      as String,
            ingestedAt: null == ingestedAt
                ? _value.ingestedAt
                : ingestedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as SignalPriority,
            permissionsScope: null == permissionsScope
                ? _value.permissionsScope
                : permissionsScope // ignore: cast_nullable_to_non_nullable
                      as String,
            payloadDigest: null == payloadDigest
                ? _value.payloadDigest
                : payloadDigest // ignore: cast_nullable_to_non_nullable
                      as String,
            confidenceHint: freezed == confidenceHint
                ? _value.confidenceHint
                : confidenceHint // ignore: cast_nullable_to_non_nullable
                      as double?,
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ContextSignalImplCopyWith<$Res>
    implements $ContextSignalCopyWith<$Res> {
  factory _$$ContextSignalImplCopyWith(
    _$ContextSignalImpl value,
    $Res Function(_$ContextSignalImpl) then,
  ) = __$$ContextSignalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    ContextSource source,
    String sourceIdentifier,
    DateTime ingestedAt,
    SignalPriority priority,
    String permissionsScope,
    String payloadDigest,
    double? confidenceHint,
    DateTime? expiresAt,
  });
}

/// @nodoc
class __$$ContextSignalImplCopyWithImpl<$Res>
    extends _$ContextSignalCopyWithImpl<$Res, _$ContextSignalImpl>
    implements _$$ContextSignalImplCopyWith<$Res> {
  __$$ContextSignalImplCopyWithImpl(
    _$ContextSignalImpl _value,
    $Res Function(_$ContextSignalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ContextSignal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? source = null,
    Object? sourceIdentifier = null,
    Object? ingestedAt = null,
    Object? priority = null,
    Object? permissionsScope = null,
    Object? payloadDigest = null,
    Object? confidenceHint = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _$ContextSignalImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as ContextSource,
        sourceIdentifier: null == sourceIdentifier
            ? _value.sourceIdentifier
            : sourceIdentifier // ignore: cast_nullable_to_non_nullable
                  as String,
        ingestedAt: null == ingestedAt
            ? _value.ingestedAt
            : ingestedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as SignalPriority,
        permissionsScope: null == permissionsScope
            ? _value.permissionsScope
            : permissionsScope // ignore: cast_nullable_to_non_nullable
                  as String,
        payloadDigest: null == payloadDigest
            ? _value.payloadDigest
            : payloadDigest // ignore: cast_nullable_to_non_nullable
                  as String,
        confidenceHint: freezed == confidenceHint
            ? _value.confidenceHint
            : confidenceHint // ignore: cast_nullable_to_non_nullable
                  as double?,
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ContextSignalImpl extends _ContextSignal {
  const _$ContextSignalImpl({
    required this.id,
    required this.userId,
    required this.source,
    required this.sourceIdentifier,
    required this.ingestedAt,
    required this.priority,
    required this.permissionsScope,
    required this.payloadDigest,
    this.confidenceHint,
    this.expiresAt,
  }) : super._();

  factory _$ContextSignalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContextSignalImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final ContextSource source;
  @override
  final String sourceIdentifier;
  @override
  final DateTime ingestedAt;
  @override
  final SignalPriority priority;
  @override
  final String permissionsScope;
  @override
  final String payloadDigest;
  @override
  final double? confidenceHint;
  @override
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'ContextSignal(id: $id, userId: $userId, source: $source, sourceIdentifier: $sourceIdentifier, ingestedAt: $ingestedAt, priority: $priority, permissionsScope: $permissionsScope, payloadDigest: $payloadDigest, confidenceHint: $confidenceHint, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContextSignalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourceIdentifier, sourceIdentifier) ||
                other.sourceIdentifier == sourceIdentifier) &&
            (identical(other.ingestedAt, ingestedAt) ||
                other.ingestedAt == ingestedAt) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.permissionsScope, permissionsScope) ||
                other.permissionsScope == permissionsScope) &&
            (identical(other.payloadDigest, payloadDigest) ||
                other.payloadDigest == payloadDigest) &&
            (identical(other.confidenceHint, confidenceHint) ||
                other.confidenceHint == confidenceHint) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    source,
    sourceIdentifier,
    ingestedAt,
    priority,
    permissionsScope,
    payloadDigest,
    confidenceHint,
    expiresAt,
  );

  /// Create a copy of ContextSignal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContextSignalImplCopyWith<_$ContextSignalImpl> get copyWith =>
      __$$ContextSignalImplCopyWithImpl<_$ContextSignalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContextSignalImplToJson(this);
  }
}

abstract class _ContextSignal extends ContextSignal {
  const factory _ContextSignal({
    required final String id,
    required final String userId,
    required final ContextSource source,
    required final String sourceIdentifier,
    required final DateTime ingestedAt,
    required final SignalPriority priority,
    required final String permissionsScope,
    required final String payloadDigest,
    final double? confidenceHint,
    final DateTime? expiresAt,
  }) = _$ContextSignalImpl;
  const _ContextSignal._() : super._();

  factory _ContextSignal.fromJson(Map<String, dynamic> json) =
      _$ContextSignalImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  ContextSource get source;
  @override
  String get sourceIdentifier;
  @override
  DateTime get ingestedAt;
  @override
  SignalPriority get priority;
  @override
  String get permissionsScope;
  @override
  String get payloadDigest;
  @override
  double? get confidenceHint;
  @override
  DateTime? get expiresAt;

  /// Create a copy of ContextSignal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContextSignalImplCopyWith<_$ContextSignalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
