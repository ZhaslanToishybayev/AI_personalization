// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interaction_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LatencyMetrics _$LatencyMetricsFromJson(Map<String, dynamic> json) {
  return _LatencyMetrics.fromJson(json);
}

/// @nodoc
mixin _$LatencyMetrics {
  int get networkMs => throw _privateConstructorUsedError;
  int get processingMs => throw _privateConstructorUsedError;
  int? get totalMs => throw _privateConstructorUsedError;

  /// Serializes this LatencyMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LatencyMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LatencyMetricsCopyWith<LatencyMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatencyMetricsCopyWith<$Res> {
  factory $LatencyMetricsCopyWith(
    LatencyMetrics value,
    $Res Function(LatencyMetrics) then,
  ) = _$LatencyMetricsCopyWithImpl<$Res, LatencyMetrics>;
  @useResult
  $Res call({int networkMs, int processingMs, int? totalMs});
}

/// @nodoc
class _$LatencyMetricsCopyWithImpl<$Res, $Val extends LatencyMetrics>
    implements $LatencyMetricsCopyWith<$Res> {
  _$LatencyMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LatencyMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkMs = null,
    Object? processingMs = null,
    Object? totalMs = freezed,
  }) {
    return _then(
      _value.copyWith(
            networkMs: null == networkMs
                ? _value.networkMs
                : networkMs // ignore: cast_nullable_to_non_nullable
                      as int,
            processingMs: null == processingMs
                ? _value.processingMs
                : processingMs // ignore: cast_nullable_to_non_nullable
                      as int,
            totalMs: freezed == totalMs
                ? _value.totalMs
                : totalMs // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LatencyMetricsImplCopyWith<$Res>
    implements $LatencyMetricsCopyWith<$Res> {
  factory _$$LatencyMetricsImplCopyWith(
    _$LatencyMetricsImpl value,
    $Res Function(_$LatencyMetricsImpl) then,
  ) = __$$LatencyMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int networkMs, int processingMs, int? totalMs});
}

/// @nodoc
class __$$LatencyMetricsImplCopyWithImpl<$Res>
    extends _$LatencyMetricsCopyWithImpl<$Res, _$LatencyMetricsImpl>
    implements _$$LatencyMetricsImplCopyWith<$Res> {
  __$$LatencyMetricsImplCopyWithImpl(
    _$LatencyMetricsImpl _value,
    $Res Function(_$LatencyMetricsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LatencyMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? networkMs = null,
    Object? processingMs = null,
    Object? totalMs = freezed,
  }) {
    return _then(
      _$LatencyMetricsImpl(
        networkMs: null == networkMs
            ? _value.networkMs
            : networkMs // ignore: cast_nullable_to_non_nullable
                  as int,
        processingMs: null == processingMs
            ? _value.processingMs
            : processingMs // ignore: cast_nullable_to_non_nullable
                  as int,
        totalMs: freezed == totalMs
            ? _value.totalMs
            : totalMs // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LatencyMetricsImpl implements _LatencyMetrics {
  const _$LatencyMetricsImpl({
    required this.networkMs,
    required this.processingMs,
    this.totalMs,
  });

  factory _$LatencyMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LatencyMetricsImplFromJson(json);

  @override
  final int networkMs;
  @override
  final int processingMs;
  @override
  final int? totalMs;

  @override
  String toString() {
    return 'LatencyMetrics(networkMs: $networkMs, processingMs: $processingMs, totalMs: $totalMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatencyMetricsImpl &&
            (identical(other.networkMs, networkMs) ||
                other.networkMs == networkMs) &&
            (identical(other.processingMs, processingMs) ||
                other.processingMs == processingMs) &&
            (identical(other.totalMs, totalMs) || other.totalMs == totalMs));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, networkMs, processingMs, totalMs);

  /// Create a copy of LatencyMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LatencyMetricsImplCopyWith<_$LatencyMetricsImpl> get copyWith =>
      __$$LatencyMetricsImplCopyWithImpl<_$LatencyMetricsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LatencyMetricsImplToJson(this);
  }
}

abstract class _LatencyMetrics implements LatencyMetrics {
  const factory _LatencyMetrics({
    required final int networkMs,
    required final int processingMs,
    final int? totalMs,
  }) = _$LatencyMetricsImpl;

  factory _LatencyMetrics.fromJson(Map<String, dynamic> json) =
      _$LatencyMetricsImpl.fromJson;

  @override
  int get networkMs;
  @override
  int get processingMs;
  @override
  int? get totalMs;

  /// Create a copy of LatencyMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LatencyMetricsImplCopyWith<_$LatencyMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InteractionAction _$InteractionActionFromJson(Map<String, dynamic> json) {
  return _InteractionAction.fromJson(json);
}

/// @nodoc
mixin _$InteractionAction {
  String get type => throw _privateConstructorUsedError;
  Map<String, dynamic>? get payload => throw _privateConstructorUsedError;
  DateTime? get occurredAt => throw _privateConstructorUsedError;

  /// Serializes this InteractionAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InteractionAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InteractionActionCopyWith<InteractionAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteractionActionCopyWith<$Res> {
  factory $InteractionActionCopyWith(
    InteractionAction value,
    $Res Function(InteractionAction) then,
  ) = _$InteractionActionCopyWithImpl<$Res, InteractionAction>;
  @useResult
  $Res call({String type, Map<String, dynamic>? payload, DateTime? occurredAt});
}

/// @nodoc
class _$InteractionActionCopyWithImpl<$Res, $Val extends InteractionAction>
    implements $InteractionActionCopyWith<$Res> {
  _$InteractionActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InteractionAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? payload = freezed,
    Object? occurredAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            payload: freezed == payload
                ? _value.payload
                : payload // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            occurredAt: freezed == occurredAt
                ? _value.occurredAt
                : occurredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InteractionActionImplCopyWith<$Res>
    implements $InteractionActionCopyWith<$Res> {
  factory _$$InteractionActionImplCopyWith(
    _$InteractionActionImpl value,
    $Res Function(_$InteractionActionImpl) then,
  ) = __$$InteractionActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, Map<String, dynamic>? payload, DateTime? occurredAt});
}

/// @nodoc
class __$$InteractionActionImplCopyWithImpl<$Res>
    extends _$InteractionActionCopyWithImpl<$Res, _$InteractionActionImpl>
    implements _$$InteractionActionImplCopyWith<$Res> {
  __$$InteractionActionImplCopyWithImpl(
    _$InteractionActionImpl _value,
    $Res Function(_$InteractionActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InteractionAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? payload = freezed,
    Object? occurredAt = freezed,
  }) {
    return _then(
      _$InteractionActionImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        payload: freezed == payload
            ? _value._payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        occurredAt: freezed == occurredAt
            ? _value.occurredAt
            : occurredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InteractionActionImpl implements _InteractionAction {
  const _$InteractionActionImpl({
    required this.type,
    final Map<String, dynamic>? payload,
    this.occurredAt,
  }) : _payload = payload;

  factory _$InteractionActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InteractionActionImplFromJson(json);

  @override
  final String type;
  final Map<String, dynamic>? _payload;
  @override
  Map<String, dynamic>? get payload {
    final value = _payload;
    if (value == null) return null;
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? occurredAt;

  @override
  String toString() {
    return 'InteractionAction(type: $type, payload: $payload, occurredAt: $occurredAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractionActionImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    const DeepCollectionEquality().hash(_payload),
    occurredAt,
  );

  /// Create a copy of InteractionAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractionActionImplCopyWith<_$InteractionActionImpl> get copyWith =>
      __$$InteractionActionImplCopyWithImpl<_$InteractionActionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InteractionActionImplToJson(this);
  }
}

abstract class _InteractionAction implements InteractionAction {
  const factory _InteractionAction({
    required final String type,
    final Map<String, dynamic>? payload,
    final DateTime? occurredAt,
  }) = _$InteractionActionImpl;

  factory _InteractionAction.fromJson(Map<String, dynamic> json) =
      _$InteractionActionImpl.fromJson;

  @override
  String get type;
  @override
  Map<String, dynamic>? get payload;
  @override
  DateTime? get occurredAt;

  /// Create a copy of InteractionAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteractionActionImplCopyWith<_$InteractionActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InteractionSession _$InteractionSessionFromJson(Map<String, dynamic> json) {
  return _InteractionSession.fromJson(json);
}

/// @nodoc
mixin _$InteractionSession {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  InteractionChannel get channel => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get endedAt => throw _privateConstructorUsedError;
  List<String> get intentLabels => throw _privateConstructorUsedError;
  String? get transcriptReference => throw _privateConstructorUsedError;
  List<InteractionAction> get actionsTaken =>
      throw _privateConstructorUsedError;
  LatencyMetrics? get latencyMetrics => throw _privateConstructorUsedError;

  /// Serializes this InteractionSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InteractionSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InteractionSessionCopyWith<InteractionSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteractionSessionCopyWith<$Res> {
  factory $InteractionSessionCopyWith(
    InteractionSession value,
    $Res Function(InteractionSession) then,
  ) = _$InteractionSessionCopyWithImpl<$Res, InteractionSession>;
  @useResult
  $Res call({
    String id,
    String userId,
    InteractionChannel channel,
    DateTime startedAt,
    DateTime? endedAt,
    List<String> intentLabels,
    String? transcriptReference,
    List<InteractionAction> actionsTaken,
    LatencyMetrics? latencyMetrics,
  });

  $LatencyMetricsCopyWith<$Res>? get latencyMetrics;
}

/// @nodoc
class _$InteractionSessionCopyWithImpl<$Res, $Val extends InteractionSession>
    implements $InteractionSessionCopyWith<$Res> {
  _$InteractionSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InteractionSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? channel = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? intentLabels = null,
    Object? transcriptReference = freezed,
    Object? actionsTaken = null,
    Object? latencyMetrics = freezed,
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
            channel: null == channel
                ? _value.channel
                : channel // ignore: cast_nullable_to_non_nullable
                      as InteractionChannel,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endedAt: freezed == endedAt
                ? _value.endedAt
                : endedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            intentLabels: null == intentLabels
                ? _value.intentLabels
                : intentLabels // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            transcriptReference: freezed == transcriptReference
                ? _value.transcriptReference
                : transcriptReference // ignore: cast_nullable_to_non_nullable
                      as String?,
            actionsTaken: null == actionsTaken
                ? _value.actionsTaken
                : actionsTaken // ignore: cast_nullable_to_non_nullable
                      as List<InteractionAction>,
            latencyMetrics: freezed == latencyMetrics
                ? _value.latencyMetrics
                : latencyMetrics // ignore: cast_nullable_to_non_nullable
                      as LatencyMetrics?,
          )
          as $Val,
    );
  }

  /// Create a copy of InteractionSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LatencyMetricsCopyWith<$Res>? get latencyMetrics {
    if (_value.latencyMetrics == null) {
      return null;
    }

    return $LatencyMetricsCopyWith<$Res>(_value.latencyMetrics!, (value) {
      return _then(_value.copyWith(latencyMetrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InteractionSessionImplCopyWith<$Res>
    implements $InteractionSessionCopyWith<$Res> {
  factory _$$InteractionSessionImplCopyWith(
    _$InteractionSessionImpl value,
    $Res Function(_$InteractionSessionImpl) then,
  ) = __$$InteractionSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    InteractionChannel channel,
    DateTime startedAt,
    DateTime? endedAt,
    List<String> intentLabels,
    String? transcriptReference,
    List<InteractionAction> actionsTaken,
    LatencyMetrics? latencyMetrics,
  });

  @override
  $LatencyMetricsCopyWith<$Res>? get latencyMetrics;
}

/// @nodoc
class __$$InteractionSessionImplCopyWithImpl<$Res>
    extends _$InteractionSessionCopyWithImpl<$Res, _$InteractionSessionImpl>
    implements _$$InteractionSessionImplCopyWith<$Res> {
  __$$InteractionSessionImplCopyWithImpl(
    _$InteractionSessionImpl _value,
    $Res Function(_$InteractionSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InteractionSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? channel = null,
    Object? startedAt = null,
    Object? endedAt = freezed,
    Object? intentLabels = null,
    Object? transcriptReference = freezed,
    Object? actionsTaken = null,
    Object? latencyMetrics = freezed,
  }) {
    return _then(
      _$InteractionSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        channel: null == channel
            ? _value.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as InteractionChannel,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endedAt: freezed == endedAt
            ? _value.endedAt
            : endedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        intentLabels: null == intentLabels
            ? _value._intentLabels
            : intentLabels // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        transcriptReference: freezed == transcriptReference
            ? _value.transcriptReference
            : transcriptReference // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionsTaken: null == actionsTaken
            ? _value._actionsTaken
            : actionsTaken // ignore: cast_nullable_to_non_nullable
                  as List<InteractionAction>,
        latencyMetrics: freezed == latencyMetrics
            ? _value.latencyMetrics
            : latencyMetrics // ignore: cast_nullable_to_non_nullable
                  as LatencyMetrics?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InteractionSessionImpl extends _InteractionSession {
  const _$InteractionSessionImpl({
    required this.id,
    required this.userId,
    required this.channel,
    required this.startedAt,
    this.endedAt,
    final List<String> intentLabels = const [],
    this.transcriptReference,
    final List<InteractionAction> actionsTaken = const [],
    this.latencyMetrics,
  }) : _intentLabels = intentLabels,
       _actionsTaken = actionsTaken,
       super._();

  factory _$InteractionSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InteractionSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final InteractionChannel channel;
  @override
  final DateTime startedAt;
  @override
  final DateTime? endedAt;
  final List<String> _intentLabels;
  @override
  @JsonKey()
  List<String> get intentLabels {
    if (_intentLabels is EqualUnmodifiableListView) return _intentLabels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intentLabels);
  }

  @override
  final String? transcriptReference;
  final List<InteractionAction> _actionsTaken;
  @override
  @JsonKey()
  List<InteractionAction> get actionsTaken {
    if (_actionsTaken is EqualUnmodifiableListView) return _actionsTaken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionsTaken);
  }

  @override
  final LatencyMetrics? latencyMetrics;

  @override
  String toString() {
    return 'InteractionSession(id: $id, userId: $userId, channel: $channel, startedAt: $startedAt, endedAt: $endedAt, intentLabels: $intentLabels, transcriptReference: $transcriptReference, actionsTaken: $actionsTaken, latencyMetrics: $latencyMetrics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteractionSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.endedAt, endedAt) || other.endedAt == endedAt) &&
            const DeepCollectionEquality().equals(
              other._intentLabels,
              _intentLabels,
            ) &&
            (identical(other.transcriptReference, transcriptReference) ||
                other.transcriptReference == transcriptReference) &&
            const DeepCollectionEquality().equals(
              other._actionsTaken,
              _actionsTaken,
            ) &&
            (identical(other.latencyMetrics, latencyMetrics) ||
                other.latencyMetrics == latencyMetrics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    channel,
    startedAt,
    endedAt,
    const DeepCollectionEquality().hash(_intentLabels),
    transcriptReference,
    const DeepCollectionEquality().hash(_actionsTaken),
    latencyMetrics,
  );

  /// Create a copy of InteractionSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InteractionSessionImplCopyWith<_$InteractionSessionImpl> get copyWith =>
      __$$InteractionSessionImplCopyWithImpl<_$InteractionSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InteractionSessionImplToJson(this);
  }
}

abstract class _InteractionSession extends InteractionSession {
  const factory _InteractionSession({
    required final String id,
    required final String userId,
    required final InteractionChannel channel,
    required final DateTime startedAt,
    final DateTime? endedAt,
    final List<String> intentLabels,
    final String? transcriptReference,
    final List<InteractionAction> actionsTaken,
    final LatencyMetrics? latencyMetrics,
  }) = _$InteractionSessionImpl;
  const _InteractionSession._() : super._();

  factory _InteractionSession.fromJson(Map<String, dynamic> json) =
      _$InteractionSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  InteractionChannel get channel;
  @override
  DateTime get startedAt;
  @override
  DateTime? get endedAt;
  @override
  List<String> get intentLabels;
  @override
  String? get transcriptReference;
  @override
  List<InteractionAction> get actionsTaken;
  @override
  LatencyMetrics? get latencyMetrics;

  /// Create a copy of InteractionSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InteractionSessionImplCopyWith<_$InteractionSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
