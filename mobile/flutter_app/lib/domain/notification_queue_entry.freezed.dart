// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_queue_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QueuedNotification _$QueuedNotificationFromJson(Map<String, dynamic> json) {
  return _QueuedNotification.fromJson(json);
}

/// @nodoc
mixin _$QueuedNotification {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get suggestionId => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;
  NotificationPriority get priority => throw _privateConstructorUsedError;
  bool get quietHoursOverride => throw _privateConstructorUsedError;
  DateTime get scheduledFor => throw _privateConstructorUsedError;
  DateTime? get deliveredAt => throw _privateConstructorUsedError;
  int get deliveryAttempts => throw _privateConstructorUsedError;

  /// Serializes this QueuedNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QueuedNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QueuedNotificationCopyWith<QueuedNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueuedNotificationCopyWith<$Res> {
  factory $QueuedNotificationCopyWith(
    QueuedNotification value,
    $Res Function(QueuedNotification) then,
  ) = _$QueuedNotificationCopyWithImpl<$Res, QueuedNotification>;
  @useResult
  $Res call({
    String id,
    String userId,
    String? suggestionId,
    String channel,
    NotificationPriority priority,
    bool quietHoursOverride,
    DateTime scheduledFor,
    DateTime? deliveredAt,
    int deliveryAttempts,
  });
}

/// @nodoc
class _$QueuedNotificationCopyWithImpl<$Res, $Val extends QueuedNotification>
    implements $QueuedNotificationCopyWith<$Res> {
  _$QueuedNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QueuedNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? suggestionId = freezed,
    Object? channel = null,
    Object? priority = null,
    Object? quietHoursOverride = null,
    Object? scheduledFor = null,
    Object? deliveredAt = freezed,
    Object? deliveryAttempts = null,
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
            suggestionId: freezed == suggestionId
                ? _value.suggestionId
                : suggestionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            channel: null == channel
                ? _value.channel
                : channel // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as NotificationPriority,
            quietHoursOverride: null == quietHoursOverride
                ? _value.quietHoursOverride
                : quietHoursOverride // ignore: cast_nullable_to_non_nullable
                      as bool,
            scheduledFor: null == scheduledFor
                ? _value.scheduledFor
                : scheduledFor // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            deliveredAt: freezed == deliveredAt
                ? _value.deliveredAt
                : deliveredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            deliveryAttempts: null == deliveryAttempts
                ? _value.deliveryAttempts
                : deliveryAttempts // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QueuedNotificationImplCopyWith<$Res>
    implements $QueuedNotificationCopyWith<$Res> {
  factory _$$QueuedNotificationImplCopyWith(
    _$QueuedNotificationImpl value,
    $Res Function(_$QueuedNotificationImpl) then,
  ) = __$$QueuedNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String? suggestionId,
    String channel,
    NotificationPriority priority,
    bool quietHoursOverride,
    DateTime scheduledFor,
    DateTime? deliveredAt,
    int deliveryAttempts,
  });
}

/// @nodoc
class __$$QueuedNotificationImplCopyWithImpl<$Res>
    extends _$QueuedNotificationCopyWithImpl<$Res, _$QueuedNotificationImpl>
    implements _$$QueuedNotificationImplCopyWith<$Res> {
  __$$QueuedNotificationImplCopyWithImpl(
    _$QueuedNotificationImpl _value,
    $Res Function(_$QueuedNotificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QueuedNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? suggestionId = freezed,
    Object? channel = null,
    Object? priority = null,
    Object? quietHoursOverride = null,
    Object? scheduledFor = null,
    Object? deliveredAt = freezed,
    Object? deliveryAttempts = null,
  }) {
    return _then(
      _$QueuedNotificationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        suggestionId: freezed == suggestionId
            ? _value.suggestionId
            : suggestionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: null == channel
            ? _value.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as NotificationPriority,
        quietHoursOverride: null == quietHoursOverride
            ? _value.quietHoursOverride
            : quietHoursOverride // ignore: cast_nullable_to_non_nullable
                  as bool,
        scheduledFor: null == scheduledFor
            ? _value.scheduledFor
            : scheduledFor // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        deliveredAt: freezed == deliveredAt
            ? _value.deliveredAt
            : deliveredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deliveryAttempts: null == deliveryAttempts
            ? _value.deliveryAttempts
            : deliveryAttempts // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QueuedNotificationImpl implements _QueuedNotification {
  const _$QueuedNotificationImpl({
    required this.id,
    required this.userId,
    this.suggestionId,
    required this.channel,
    this.priority = NotificationPriority.normal,
    this.quietHoursOverride = false,
    required this.scheduledFor,
    this.deliveredAt,
    this.deliveryAttempts = 0,
  });

  factory _$QueuedNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$QueuedNotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? suggestionId;
  @override
  final String channel;
  @override
  @JsonKey()
  final NotificationPriority priority;
  @override
  @JsonKey()
  final bool quietHoursOverride;
  @override
  final DateTime scheduledFor;
  @override
  final DateTime? deliveredAt;
  @override
  @JsonKey()
  final int deliveryAttempts;

  @override
  String toString() {
    return 'QueuedNotification(id: $id, userId: $userId, suggestionId: $suggestionId, channel: $channel, priority: $priority, quietHoursOverride: $quietHoursOverride, scheduledFor: $scheduledFor, deliveredAt: $deliveredAt, deliveryAttempts: $deliveryAttempts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueuedNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.suggestionId, suggestionId) ||
                other.suggestionId == suggestionId) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.quietHoursOverride, quietHoursOverride) ||
                other.quietHoursOverride == quietHoursOverride) &&
            (identical(other.scheduledFor, scheduledFor) ||
                other.scheduledFor == scheduledFor) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt) &&
            (identical(other.deliveryAttempts, deliveryAttempts) ||
                other.deliveryAttempts == deliveryAttempts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    suggestionId,
    channel,
    priority,
    quietHoursOverride,
    scheduledFor,
    deliveredAt,
    deliveryAttempts,
  );

  /// Create a copy of QueuedNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueuedNotificationImplCopyWith<_$QueuedNotificationImpl> get copyWith =>
      __$$QueuedNotificationImplCopyWithImpl<_$QueuedNotificationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QueuedNotificationImplToJson(this);
  }
}

abstract class _QueuedNotification implements QueuedNotification {
  const factory _QueuedNotification({
    required final String id,
    required final String userId,
    final String? suggestionId,
    required final String channel,
    final NotificationPriority priority,
    final bool quietHoursOverride,
    required final DateTime scheduledFor,
    final DateTime? deliveredAt,
    final int deliveryAttempts,
  }) = _$QueuedNotificationImpl;

  factory _QueuedNotification.fromJson(Map<String, dynamic> json) =
      _$QueuedNotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get suggestionId;
  @override
  String get channel;
  @override
  NotificationPriority get priority;
  @override
  bool get quietHoursOverride;
  @override
  DateTime get scheduledFor;
  @override
  DateTime? get deliveredAt;
  @override
  int get deliveryAttempts;

  /// Create a copy of QueuedNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueuedNotificationImplCopyWith<_$QueuedNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
