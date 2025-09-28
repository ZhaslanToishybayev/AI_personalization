// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  String get timeZone => throw _privateConstructorUsedError;
  WorkingHours get workingHours => throw _privateConstructorUsedError;
  NotificationSettings get notificationSettings =>
      throw _privateConstructorUsedError;
  Map<String, ConsentRecord> get privacyConsents =>
      throw _privateConstructorUsedError;
  PersonalBoundaries get personalBoundaries =>
      throw _privateConstructorUsedError;
  bool get quietHoursEnabled => throw _privateConstructorUsedError;
  DateTime? get lastExportRequestAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
    UserProfile value,
    $Res Function(UserProfile) then,
  ) = _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call({
    String id,
    String displayName,
    String email,
    String locale,
    String timeZone,
    WorkingHours workingHours,
    NotificationSettings notificationSettings,
    Map<String, ConsentRecord> privacyConsents,
    PersonalBoundaries personalBoundaries,
    bool quietHoursEnabled,
    DateTime? lastExportRequestAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });

  $WorkingHoursCopyWith<$Res> get workingHours;
  $NotificationSettingsCopyWith<$Res> get notificationSettings;
  $PersonalBoundariesCopyWith<$Res> get personalBoundaries;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? email = null,
    Object? locale = null,
    Object? timeZone = null,
    Object? workingHours = null,
    Object? notificationSettings = null,
    Object? privacyConsents = null,
    Object? personalBoundaries = null,
    Object? quietHoursEnabled = null,
    Object? lastExportRequestAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            locale: null == locale
                ? _value.locale
                : locale // ignore: cast_nullable_to_non_nullable
                      as String,
            timeZone: null == timeZone
                ? _value.timeZone
                : timeZone // ignore: cast_nullable_to_non_nullable
                      as String,
            workingHours: null == workingHours
                ? _value.workingHours
                : workingHours // ignore: cast_nullable_to_non_nullable
                      as WorkingHours,
            notificationSettings: null == notificationSettings
                ? _value.notificationSettings
                : notificationSettings // ignore: cast_nullable_to_non_nullable
                      as NotificationSettings,
            privacyConsents: null == privacyConsents
                ? _value.privacyConsents
                : privacyConsents // ignore: cast_nullable_to_non_nullable
                      as Map<String, ConsentRecord>,
            personalBoundaries: null == personalBoundaries
                ? _value.personalBoundaries
                : personalBoundaries // ignore: cast_nullable_to_non_nullable
                      as PersonalBoundaries,
            quietHoursEnabled: null == quietHoursEnabled
                ? _value.quietHoursEnabled
                : quietHoursEnabled // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastExportRequestAt: freezed == lastExportRequestAt
                ? _value.lastExportRequestAt
                : lastExportRequestAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            deletedAt: freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkingHoursCopyWith<$Res> get workingHours {
    return $WorkingHoursCopyWith<$Res>(_value.workingHours, (value) {
      return _then(_value.copyWith(workingHours: value) as $Val);
    });
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res> get notificationSettings {
    return $NotificationSettingsCopyWith<$Res>(_value.notificationSettings, (
      value,
    ) {
      return _then(_value.copyWith(notificationSettings: value) as $Val);
    });
  }

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonalBoundariesCopyWith<$Res> get personalBoundaries {
    return $PersonalBoundariesCopyWith<$Res>(_value.personalBoundaries, (
      value,
    ) {
      return _then(_value.copyWith(personalBoundaries: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
    _$UserProfileImpl value,
    $Res Function(_$UserProfileImpl) then,
  ) = __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String displayName,
    String email,
    String locale,
    String timeZone,
    WorkingHours workingHours,
    NotificationSettings notificationSettings,
    Map<String, ConsentRecord> privacyConsents,
    PersonalBoundaries personalBoundaries,
    bool quietHoursEnabled,
    DateTime? lastExportRequestAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  });

  @override
  $WorkingHoursCopyWith<$Res> get workingHours;
  @override
  $NotificationSettingsCopyWith<$Res> get notificationSettings;
  @override
  $PersonalBoundariesCopyWith<$Res> get personalBoundaries;
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
    _$UserProfileImpl _value,
    $Res Function(_$UserProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? email = null,
    Object? locale = null,
    Object? timeZone = null,
    Object? workingHours = null,
    Object? notificationSettings = null,
    Object? privacyConsents = null,
    Object? personalBoundaries = null,
    Object? quietHoursEnabled = null,
    Object? lastExportRequestAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(
      _$UserProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        locale: null == locale
            ? _value.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String,
        timeZone: null == timeZone
            ? _value.timeZone
            : timeZone // ignore: cast_nullable_to_non_nullable
                  as String,
        workingHours: null == workingHours
            ? _value.workingHours
            : workingHours // ignore: cast_nullable_to_non_nullable
                  as WorkingHours,
        notificationSettings: null == notificationSettings
            ? _value.notificationSettings
            : notificationSettings // ignore: cast_nullable_to_non_nullable
                  as NotificationSettings,
        privacyConsents: null == privacyConsents
            ? _value._privacyConsents
            : privacyConsents // ignore: cast_nullable_to_non_nullable
                  as Map<String, ConsentRecord>,
        personalBoundaries: null == personalBoundaries
            ? _value.personalBoundaries
            : personalBoundaries // ignore: cast_nullable_to_non_nullable
                  as PersonalBoundaries,
        quietHoursEnabled: null == quietHoursEnabled
            ? _value.quietHoursEnabled
            : quietHoursEnabled // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastExportRequestAt: freezed == lastExportRequestAt
            ? _value.lastExportRequestAt
            : lastExportRequestAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        deletedAt: freezed == deletedAt
            ? _value.deletedAt
            : deletedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl extends _UserProfile {
  const _$UserProfileImpl({
    required this.id,
    required this.displayName,
    required this.email,
    required this.locale,
    required this.timeZone,
    required this.workingHours,
    required this.notificationSettings,
    required final Map<String, ConsentRecord> privacyConsents,
    required this.personalBoundaries,
    this.quietHoursEnabled = false,
    this.lastExportRequestAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  }) : _privacyConsents = privacyConsents,
       super._();

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String displayName;
  @override
  final String email;
  @override
  final String locale;
  @override
  final String timeZone;
  @override
  final WorkingHours workingHours;
  @override
  final NotificationSettings notificationSettings;
  final Map<String, ConsentRecord> _privacyConsents;
  @override
  Map<String, ConsentRecord> get privacyConsents {
    if (_privacyConsents is EqualUnmodifiableMapView) return _privacyConsents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_privacyConsents);
  }

  @override
  final PersonalBoundaries personalBoundaries;
  @override
  @JsonKey()
  final bool quietHoursEnabled;
  @override
  final DateTime? lastExportRequestAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'UserProfile(id: $id, displayName: $displayName, email: $email, locale: $locale, timeZone: $timeZone, workingHours: $workingHours, notificationSettings: $notificationSettings, privacyConsents: $privacyConsents, personalBoundaries: $personalBoundaries, quietHoursEnabled: $quietHoursEnabled, lastExportRequestAt: $lastExportRequestAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone) &&
            (identical(other.workingHours, workingHours) ||
                other.workingHours == workingHours) &&
            (identical(other.notificationSettings, notificationSettings) ||
                other.notificationSettings == notificationSettings) &&
            const DeepCollectionEquality().equals(
              other._privacyConsents,
              _privacyConsents,
            ) &&
            (identical(other.personalBoundaries, personalBoundaries) ||
                other.personalBoundaries == personalBoundaries) &&
            (identical(other.quietHoursEnabled, quietHoursEnabled) ||
                other.quietHoursEnabled == quietHoursEnabled) &&
            (identical(other.lastExportRequestAt, lastExportRequestAt) ||
                other.lastExportRequestAt == lastExportRequestAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    displayName,
    email,
    locale,
    timeZone,
    workingHours,
    notificationSettings,
    const DeepCollectionEquality().hash(_privacyConsents),
    personalBoundaries,
    quietHoursEnabled,
    lastExportRequestAt,
    createdAt,
    updatedAt,
    deletedAt,
  );

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(this);
  }
}

abstract class _UserProfile extends UserProfile {
  const factory _UserProfile({
    required final String id,
    required final String displayName,
    required final String email,
    required final String locale,
    required final String timeZone,
    required final WorkingHours workingHours,
    required final NotificationSettings notificationSettings,
    required final Map<String, ConsentRecord> privacyConsents,
    required final PersonalBoundaries personalBoundaries,
    final bool quietHoursEnabled,
    final DateTime? lastExportRequestAt,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final DateTime? deletedAt,
  }) = _$UserProfileImpl;
  const _UserProfile._() : super._();

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get displayName;
  @override
  String get email;
  @override
  String get locale;
  @override
  String get timeZone;
  @override
  WorkingHours get workingHours;
  @override
  NotificationSettings get notificationSettings;
  @override
  Map<String, ConsentRecord> get privacyConsents;
  @override
  PersonalBoundaries get personalBoundaries;
  @override
  bool get quietHoursEnabled;
  @override
  DateTime? get lastExportRequestAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get deletedAt;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WorkingHours _$WorkingHoursFromJson(Map<String, dynamic> json) {
  return _WorkingHours.fromJson(json);
}

/// @nodoc
mixin _$WorkingHours {
  int get startMinutes => throw _privateConstructorUsedError;
  int get endMinutes => throw _privateConstructorUsedError;
  List<int> get weekdays => throw _privateConstructorUsedError;

  /// Serializes this WorkingHours to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkingHoursCopyWith<WorkingHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkingHoursCopyWith<$Res> {
  factory $WorkingHoursCopyWith(
    WorkingHours value,
    $Res Function(WorkingHours) then,
  ) = _$WorkingHoursCopyWithImpl<$Res, WorkingHours>;
  @useResult
  $Res call({int startMinutes, int endMinutes, List<int> weekdays});
}

/// @nodoc
class _$WorkingHoursCopyWithImpl<$Res, $Val extends WorkingHours>
    implements $WorkingHoursCopyWith<$Res> {
  _$WorkingHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startMinutes = null,
    Object? endMinutes = null,
    Object? weekdays = null,
  }) {
    return _then(
      _value.copyWith(
            startMinutes: null == startMinutes
                ? _value.startMinutes
                : startMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            endMinutes: null == endMinutes
                ? _value.endMinutes
                : endMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            weekdays: null == weekdays
                ? _value.weekdays
                : weekdays // ignore: cast_nullable_to_non_nullable
                      as List<int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WorkingHoursImplCopyWith<$Res>
    implements $WorkingHoursCopyWith<$Res> {
  factory _$$WorkingHoursImplCopyWith(
    _$WorkingHoursImpl value,
    $Res Function(_$WorkingHoursImpl) then,
  ) = __$$WorkingHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int startMinutes, int endMinutes, List<int> weekdays});
}

/// @nodoc
class __$$WorkingHoursImplCopyWithImpl<$Res>
    extends _$WorkingHoursCopyWithImpl<$Res, _$WorkingHoursImpl>
    implements _$$WorkingHoursImplCopyWith<$Res> {
  __$$WorkingHoursImplCopyWithImpl(
    _$WorkingHoursImpl _value,
    $Res Function(_$WorkingHoursImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startMinutes = null,
    Object? endMinutes = null,
    Object? weekdays = null,
  }) {
    return _then(
      _$WorkingHoursImpl(
        startMinutes: null == startMinutes
            ? _value.startMinutes
            : startMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        endMinutes: null == endMinutes
            ? _value.endMinutes
            : endMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        weekdays: null == weekdays
            ? _value._weekdays
            : weekdays // ignore: cast_nullable_to_non_nullable
                  as List<int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkingHoursImpl extends _WorkingHours {
  const _$WorkingHoursImpl({
    required this.startMinutes,
    required this.endMinutes,
    required final List<int> weekdays,
  }) : _weekdays = weekdays,
       super._();

  factory _$WorkingHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkingHoursImplFromJson(json);

  @override
  final int startMinutes;
  @override
  final int endMinutes;
  final List<int> _weekdays;
  @override
  List<int> get weekdays {
    if (_weekdays is EqualUnmodifiableListView) return _weekdays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weekdays);
  }

  @override
  String toString() {
    return 'WorkingHours(startMinutes: $startMinutes, endMinutes: $endMinutes, weekdays: $weekdays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkingHoursImpl &&
            (identical(other.startMinutes, startMinutes) ||
                other.startMinutes == startMinutes) &&
            (identical(other.endMinutes, endMinutes) ||
                other.endMinutes == endMinutes) &&
            const DeepCollectionEquality().equals(other._weekdays, _weekdays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    startMinutes,
    endMinutes,
    const DeepCollectionEquality().hash(_weekdays),
  );

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkingHoursImplCopyWith<_$WorkingHoursImpl> get copyWith =>
      __$$WorkingHoursImplCopyWithImpl<_$WorkingHoursImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkingHoursImplToJson(this);
  }
}

abstract class _WorkingHours extends WorkingHours {
  const factory _WorkingHours({
    required final int startMinutes,
    required final int endMinutes,
    required final List<int> weekdays,
  }) = _$WorkingHoursImpl;
  const _WorkingHours._() : super._();

  factory _WorkingHours.fromJson(Map<String, dynamic> json) =
      _$WorkingHoursImpl.fromJson;

  @override
  int get startMinutes;
  @override
  int get endMinutes;
  @override
  List<int> get weekdays;

  /// Create a copy of WorkingHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkingHoursImplCopyWith<_$WorkingHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  List<String> get channels => throw _privateConstructorUsedError;
  QuietHours? get quietHours => throw _privateConstructorUsedError;
  bool get allowCriticalAlerts => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(
    NotificationSettings value,
    $Res Function(NotificationSettings) then,
  ) = _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call({
    List<String> channels,
    QuietHours? quietHours,
    bool allowCriticalAlerts,
  });

  $QuietHoursCopyWith<$Res>? get quietHours;
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<
  $Res,
  $Val extends NotificationSettings
>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channels = null,
    Object? quietHours = freezed,
    Object? allowCriticalAlerts = null,
  }) {
    return _then(
      _value.copyWith(
            channels: null == channels
                ? _value.channels
                : channels // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            quietHours: freezed == quietHours
                ? _value.quietHours
                : quietHours // ignore: cast_nullable_to_non_nullable
                      as QuietHours?,
            allowCriticalAlerts: null == allowCriticalAlerts
                ? _value.allowCriticalAlerts
                : allowCriticalAlerts // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuietHoursCopyWith<$Res>? get quietHours {
    if (_value.quietHours == null) {
      return null;
    }

    return $QuietHoursCopyWith<$Res>(_value.quietHours!, (value) {
      return _then(_value.copyWith(quietHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(
    _$NotificationSettingsImpl value,
    $Res Function(_$NotificationSettingsImpl) then,
  ) = __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> channels,
    QuietHours? quietHours,
    bool allowCriticalAlerts,
  });

  @override
  $QuietHoursCopyWith<$Res>? get quietHours;
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(
    _$NotificationSettingsImpl _value,
    $Res Function(_$NotificationSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channels = null,
    Object? quietHours = freezed,
    Object? allowCriticalAlerts = null,
  }) {
    return _then(
      _$NotificationSettingsImpl(
        channels: null == channels
            ? _value._channels
            : channels // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        quietHours: freezed == quietHours
            ? _value.quietHours
            : quietHours // ignore: cast_nullable_to_non_nullable
                  as QuietHours?,
        allowCriticalAlerts: null == allowCriticalAlerts
            ? _value.allowCriticalAlerts
            : allowCriticalAlerts // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl extends _NotificationSettings {
  const _$NotificationSettingsImpl({
    required final List<String> channels,
    required this.quietHours,
    required this.allowCriticalAlerts,
  }) : _channels = channels,
       super._();

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  final List<String> _channels;
  @override
  List<String> get channels {
    if (_channels is EqualUnmodifiableListView) return _channels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channels);
  }

  @override
  final QuietHours? quietHours;
  @override
  final bool allowCriticalAlerts;

  @override
  String toString() {
    return 'NotificationSettings(channels: $channels, quietHours: $quietHours, allowCriticalAlerts: $allowCriticalAlerts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            const DeepCollectionEquality().equals(other._channels, _channels) &&
            (identical(other.quietHours, quietHours) ||
                other.quietHours == quietHours) &&
            (identical(other.allowCriticalAlerts, allowCriticalAlerts) ||
                other.allowCriticalAlerts == allowCriticalAlerts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_channels),
    quietHours,
    allowCriticalAlerts,
  );

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
  get copyWith =>
      __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(this);
  }
}

abstract class _NotificationSettings extends NotificationSettings {
  const factory _NotificationSettings({
    required final List<String> channels,
    required final QuietHours? quietHours,
    required final bool allowCriticalAlerts,
  }) = _$NotificationSettingsImpl;
  const _NotificationSettings._() : super._();

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  List<String> get channels;
  @override
  QuietHours? get quietHours;
  @override
  bool get allowCriticalAlerts;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

QuietHours _$QuietHoursFromJson(Map<String, dynamic> json) {
  return _QuietHours.fromJson(json);
}

/// @nodoc
mixin _$QuietHours {
  int get startMinutes => throw _privateConstructorUsedError;
  int get endMinutes => throw _privateConstructorUsedError;
  String get timeZone => throw _privateConstructorUsedError;

  /// Serializes this QuietHours to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuietHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuietHoursCopyWith<QuietHours> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuietHoursCopyWith<$Res> {
  factory $QuietHoursCopyWith(
    QuietHours value,
    $Res Function(QuietHours) then,
  ) = _$QuietHoursCopyWithImpl<$Res, QuietHours>;
  @useResult
  $Res call({int startMinutes, int endMinutes, String timeZone});
}

/// @nodoc
class _$QuietHoursCopyWithImpl<$Res, $Val extends QuietHours>
    implements $QuietHoursCopyWith<$Res> {
  _$QuietHoursCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuietHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startMinutes = null,
    Object? endMinutes = null,
    Object? timeZone = null,
  }) {
    return _then(
      _value.copyWith(
            startMinutes: null == startMinutes
                ? _value.startMinutes
                : startMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            endMinutes: null == endMinutes
                ? _value.endMinutes
                : endMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            timeZone: null == timeZone
                ? _value.timeZone
                : timeZone // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuietHoursImplCopyWith<$Res>
    implements $QuietHoursCopyWith<$Res> {
  factory _$$QuietHoursImplCopyWith(
    _$QuietHoursImpl value,
    $Res Function(_$QuietHoursImpl) then,
  ) = __$$QuietHoursImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int startMinutes, int endMinutes, String timeZone});
}

/// @nodoc
class __$$QuietHoursImplCopyWithImpl<$Res>
    extends _$QuietHoursCopyWithImpl<$Res, _$QuietHoursImpl>
    implements _$$QuietHoursImplCopyWith<$Res> {
  __$$QuietHoursImplCopyWithImpl(
    _$QuietHoursImpl _value,
    $Res Function(_$QuietHoursImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuietHours
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startMinutes = null,
    Object? endMinutes = null,
    Object? timeZone = null,
  }) {
    return _then(
      _$QuietHoursImpl(
        startMinutes: null == startMinutes
            ? _value.startMinutes
            : startMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        endMinutes: null == endMinutes
            ? _value.endMinutes
            : endMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        timeZone: null == timeZone
            ? _value.timeZone
            : timeZone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuietHoursImpl extends _QuietHours {
  const _$QuietHoursImpl({
    required this.startMinutes,
    required this.endMinutes,
    required this.timeZone,
  }) : super._();

  factory _$QuietHoursImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuietHoursImplFromJson(json);

  @override
  final int startMinutes;
  @override
  final int endMinutes;
  @override
  final String timeZone;

  @override
  String toString() {
    return 'QuietHours(startMinutes: $startMinutes, endMinutes: $endMinutes, timeZone: $timeZone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuietHoursImpl &&
            (identical(other.startMinutes, startMinutes) ||
                other.startMinutes == startMinutes) &&
            (identical(other.endMinutes, endMinutes) ||
                other.endMinutes == endMinutes) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, startMinutes, endMinutes, timeZone);

  /// Create a copy of QuietHours
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuietHoursImplCopyWith<_$QuietHoursImpl> get copyWith =>
      __$$QuietHoursImplCopyWithImpl<_$QuietHoursImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuietHoursImplToJson(this);
  }
}

abstract class _QuietHours extends QuietHours {
  const factory _QuietHours({
    required final int startMinutes,
    required final int endMinutes,
    required final String timeZone,
  }) = _$QuietHoursImpl;
  const _QuietHours._() : super._();

  factory _QuietHours.fromJson(Map<String, dynamic> json) =
      _$QuietHoursImpl.fromJson;

  @override
  int get startMinutes;
  @override
  int get endMinutes;
  @override
  String get timeZone;

  /// Create a copy of QuietHours
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuietHoursImplCopyWith<_$QuietHoursImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConsentRecord _$ConsentRecordFromJson(Map<String, dynamic> json) {
  return _ConsentRecord.fromJson(json);
}

/// @nodoc
mixin _$ConsentRecord {
  ConsentStatus get status => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;

  /// Serializes this ConsentRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsentRecordCopyWith<ConsentRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsentRecordCopyWith<$Res> {
  factory $ConsentRecordCopyWith(
    ConsentRecord value,
    $Res Function(ConsentRecord) then,
  ) = _$ConsentRecordCopyWithImpl<$Res, ConsentRecord>;
  @useResult
  $Res call({ConsentStatus status, DateTime updatedAt, String? version});
}

/// @nodoc
class _$ConsentRecordCopyWithImpl<$Res, $Val extends ConsentRecord>
    implements $ConsentRecordCopyWith<$Res> {
  _$ConsentRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? updatedAt = null,
    Object? version = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ConsentStatus,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            version: freezed == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsentRecordImplCopyWith<$Res>
    implements $ConsentRecordCopyWith<$Res> {
  factory _$$ConsentRecordImplCopyWith(
    _$ConsentRecordImpl value,
    $Res Function(_$ConsentRecordImpl) then,
  ) = __$$ConsentRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ConsentStatus status, DateTime updatedAt, String? version});
}

/// @nodoc
class __$$ConsentRecordImplCopyWithImpl<$Res>
    extends _$ConsentRecordCopyWithImpl<$Res, _$ConsentRecordImpl>
    implements _$$ConsentRecordImplCopyWith<$Res> {
  __$$ConsentRecordImplCopyWithImpl(
    _$ConsentRecordImpl _value,
    $Res Function(_$ConsentRecordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsentRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? updatedAt = null,
    Object? version = freezed,
  }) {
    return _then(
      _$ConsentRecordImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ConsentStatus,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        version: freezed == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsentRecordImpl implements _ConsentRecord {
  const _$ConsentRecordImpl({
    required this.status,
    required this.updatedAt,
    this.version,
  });

  factory _$ConsentRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsentRecordImplFromJson(json);

  @override
  final ConsentStatus status;
  @override
  final DateTime updatedAt;
  @override
  final String? version;

  @override
  String toString() {
    return 'ConsentRecord(status: $status, updatedAt: $updatedAt, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsentRecordImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, updatedAt, version);

  /// Create a copy of ConsentRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsentRecordImplCopyWith<_$ConsentRecordImpl> get copyWith =>
      __$$ConsentRecordImplCopyWithImpl<_$ConsentRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsentRecordImplToJson(this);
  }
}

abstract class _ConsentRecord implements ConsentRecord {
  const factory _ConsentRecord({
    required final ConsentStatus status,
    required final DateTime updatedAt,
    final String? version,
  }) = _$ConsentRecordImpl;

  factory _ConsentRecord.fromJson(Map<String, dynamic> json) =
      _$ConsentRecordImpl.fromJson;

  @override
  ConsentStatus get status;
  @override
  DateTime get updatedAt;
  @override
  String? get version;

  /// Create a copy of ConsentRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsentRecordImplCopyWith<_$ConsentRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EscalationRule _$EscalationRuleFromJson(Map<String, dynamic> json) {
  return _EscalationRule.fromJson(json);
}

/// @nodoc
mixin _$EscalationRule {
  String get id => throw _privateConstructorUsedError;
  String get channel => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;

  /// Serializes this EscalationRule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EscalationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EscalationRuleCopyWith<EscalationRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EscalationRuleCopyWith<$Res> {
  factory $EscalationRuleCopyWith(
    EscalationRule value,
    $Res Function(EscalationRule) then,
  ) = _$EscalationRuleCopyWithImpl<$Res, EscalationRule>;
  @useResult
  $Res call({String id, String channel, String target});
}

/// @nodoc
class _$EscalationRuleCopyWithImpl<$Res, $Val extends EscalationRule>
    implements $EscalationRuleCopyWith<$Res> {
  _$EscalationRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EscalationRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? channel = null,
    Object? target = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            channel: null == channel
                ? _value.channel
                : channel // ignore: cast_nullable_to_non_nullable
                      as String,
            target: null == target
                ? _value.target
                : target // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EscalationRuleImplCopyWith<$Res>
    implements $EscalationRuleCopyWith<$Res> {
  factory _$$EscalationRuleImplCopyWith(
    _$EscalationRuleImpl value,
    $Res Function(_$EscalationRuleImpl) then,
  ) = __$$EscalationRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String channel, String target});
}

/// @nodoc
class __$$EscalationRuleImplCopyWithImpl<$Res>
    extends _$EscalationRuleCopyWithImpl<$Res, _$EscalationRuleImpl>
    implements _$$EscalationRuleImplCopyWith<$Res> {
  __$$EscalationRuleImplCopyWithImpl(
    _$EscalationRuleImpl _value,
    $Res Function(_$EscalationRuleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EscalationRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? channel = null,
    Object? target = null,
  }) {
    return _then(
      _$EscalationRuleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        channel: null == channel
            ? _value.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as String,
        target: null == target
            ? _value.target
            : target // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EscalationRuleImpl implements _EscalationRule {
  const _$EscalationRuleImpl({
    required this.id,
    required this.channel,
    required this.target,
  });

  factory _$EscalationRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$EscalationRuleImplFromJson(json);

  @override
  final String id;
  @override
  final String channel;
  @override
  final String target;

  @override
  String toString() {
    return 'EscalationRule(id: $id, channel: $channel, target: $target)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EscalationRuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, channel, target);

  /// Create a copy of EscalationRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EscalationRuleImplCopyWith<_$EscalationRuleImpl> get copyWith =>
      __$$EscalationRuleImplCopyWithImpl<_$EscalationRuleImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EscalationRuleImplToJson(this);
  }
}

abstract class _EscalationRule implements EscalationRule {
  const factory _EscalationRule({
    required final String id,
    required final String channel,
    required final String target,
  }) = _$EscalationRuleImpl;

  factory _EscalationRule.fromJson(Map<String, dynamic> json) =
      _$EscalationRuleImpl.fromJson;

  @override
  String get id;
  @override
  String get channel;
  @override
  String get target;

  /// Create a copy of EscalationRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EscalationRuleImplCopyWith<_$EscalationRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SuppressionWindow _$SuppressionWindowFromJson(Map<String, dynamic> json) {
  return _SuppressionWindow.fromJson(json);
}

/// @nodoc
mixin _$SuppressionWindow {
  DateTime get startAt => throw _privateConstructorUsedError;
  DateTime get endAt => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this SuppressionWindow to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuppressionWindow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuppressionWindowCopyWith<SuppressionWindow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuppressionWindowCopyWith<$Res> {
  factory $SuppressionWindowCopyWith(
    SuppressionWindow value,
    $Res Function(SuppressionWindow) then,
  ) = _$SuppressionWindowCopyWithImpl<$Res, SuppressionWindow>;
  @useResult
  $Res call({DateTime startAt, DateTime endAt, String? reason});
}

/// @nodoc
class _$SuppressionWindowCopyWithImpl<$Res, $Val extends SuppressionWindow>
    implements $SuppressionWindowCopyWith<$Res> {
  _$SuppressionWindowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuppressionWindow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAt = null,
    Object? endAt = null,
    Object? reason = freezed,
  }) {
    return _then(
      _value.copyWith(
            startAt: null == startAt
                ? _value.startAt
                : startAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endAt: null == endAt
                ? _value.endAt
                : endAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SuppressionWindowImplCopyWith<$Res>
    implements $SuppressionWindowCopyWith<$Res> {
  factory _$$SuppressionWindowImplCopyWith(
    _$SuppressionWindowImpl value,
    $Res Function(_$SuppressionWindowImpl) then,
  ) = __$$SuppressionWindowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime startAt, DateTime endAt, String? reason});
}

/// @nodoc
class __$$SuppressionWindowImplCopyWithImpl<$Res>
    extends _$SuppressionWindowCopyWithImpl<$Res, _$SuppressionWindowImpl>
    implements _$$SuppressionWindowImplCopyWith<$Res> {
  __$$SuppressionWindowImplCopyWithImpl(
    _$SuppressionWindowImpl _value,
    $Res Function(_$SuppressionWindowImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SuppressionWindow
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startAt = null,
    Object? endAt = null,
    Object? reason = freezed,
  }) {
    return _then(
      _$SuppressionWindowImpl(
        startAt: null == startAt
            ? _value.startAt
            : startAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endAt: null == endAt
            ? _value.endAt
            : endAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SuppressionWindowImpl extends _SuppressionWindow {
  const _$SuppressionWindowImpl({
    required this.startAt,
    required this.endAt,
    this.reason,
  }) : super._();

  factory _$SuppressionWindowImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuppressionWindowImplFromJson(json);

  @override
  final DateTime startAt;
  @override
  final DateTime endAt;
  @override
  final String? reason;

  @override
  String toString() {
    return 'SuppressionWindow(startAt: $startAt, endAt: $endAt, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuppressionWindowImpl &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startAt, endAt, reason);

  /// Create a copy of SuppressionWindow
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuppressionWindowImplCopyWith<_$SuppressionWindowImpl> get copyWith =>
      __$$SuppressionWindowImplCopyWithImpl<_$SuppressionWindowImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SuppressionWindowImplToJson(this);
  }
}

abstract class _SuppressionWindow extends SuppressionWindow {
  const factory _SuppressionWindow({
    required final DateTime startAt,
    required final DateTime endAt,
    final String? reason,
  }) = _$SuppressionWindowImpl;
  const _SuppressionWindow._() : super._();

  factory _SuppressionWindow.fromJson(Map<String, dynamic> json) =
      _$SuppressionWindowImpl.fromJson;

  @override
  DateTime get startAt;
  @override
  DateTime get endAt;
  @override
  String? get reason;

  /// Create a copy of SuppressionWindow
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuppressionWindowImplCopyWith<_$SuppressionWindowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PersonalBoundaries _$PersonalBoundariesFromJson(Map<String, dynamic> json) {
  return _PersonalBoundaries.fromJson(json);
}

/// @nodoc
mixin _$PersonalBoundaries {
  List<String> get topicsToAvoid => throw _privateConstructorUsedError;
  QuietHours? get enforcedQuietHours => throw _privateConstructorUsedError;
  List<EscalationRule> get escalationRules =>
      throw _privateConstructorUsedError;
  List<SuppressionWindow> get suppressionWindows =>
      throw _privateConstructorUsedError;

  /// Serializes this PersonalBoundaries to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PersonalBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonalBoundariesCopyWith<PersonalBoundaries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalBoundariesCopyWith<$Res> {
  factory $PersonalBoundariesCopyWith(
    PersonalBoundaries value,
    $Res Function(PersonalBoundaries) then,
  ) = _$PersonalBoundariesCopyWithImpl<$Res, PersonalBoundaries>;
  @useResult
  $Res call({
    List<String> topicsToAvoid,
    QuietHours? enforcedQuietHours,
    List<EscalationRule> escalationRules,
    List<SuppressionWindow> suppressionWindows,
  });

  $QuietHoursCopyWith<$Res>? get enforcedQuietHours;
}

/// @nodoc
class _$PersonalBoundariesCopyWithImpl<$Res, $Val extends PersonalBoundaries>
    implements $PersonalBoundariesCopyWith<$Res> {
  _$PersonalBoundariesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonalBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicsToAvoid = null,
    Object? enforcedQuietHours = freezed,
    Object? escalationRules = null,
    Object? suppressionWindows = null,
  }) {
    return _then(
      _value.copyWith(
            topicsToAvoid: null == topicsToAvoid
                ? _value.topicsToAvoid
                : topicsToAvoid // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            enforcedQuietHours: freezed == enforcedQuietHours
                ? _value.enforcedQuietHours
                : enforcedQuietHours // ignore: cast_nullable_to_non_nullable
                      as QuietHours?,
            escalationRules: null == escalationRules
                ? _value.escalationRules
                : escalationRules // ignore: cast_nullable_to_non_nullable
                      as List<EscalationRule>,
            suppressionWindows: null == suppressionWindows
                ? _value.suppressionWindows
                : suppressionWindows // ignore: cast_nullable_to_non_nullable
                      as List<SuppressionWindow>,
          )
          as $Val,
    );
  }

  /// Create a copy of PersonalBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuietHoursCopyWith<$Res>? get enforcedQuietHours {
    if (_value.enforcedQuietHours == null) {
      return null;
    }

    return $QuietHoursCopyWith<$Res>(_value.enforcedQuietHours!, (value) {
      return _then(_value.copyWith(enforcedQuietHours: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PersonalBoundariesImplCopyWith<$Res>
    implements $PersonalBoundariesCopyWith<$Res> {
  factory _$$PersonalBoundariesImplCopyWith(
    _$PersonalBoundariesImpl value,
    $Res Function(_$PersonalBoundariesImpl) then,
  ) = __$$PersonalBoundariesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<String> topicsToAvoid,
    QuietHours? enforcedQuietHours,
    List<EscalationRule> escalationRules,
    List<SuppressionWindow> suppressionWindows,
  });

  @override
  $QuietHoursCopyWith<$Res>? get enforcedQuietHours;
}

/// @nodoc
class __$$PersonalBoundariesImplCopyWithImpl<$Res>
    extends _$PersonalBoundariesCopyWithImpl<$Res, _$PersonalBoundariesImpl>
    implements _$$PersonalBoundariesImplCopyWith<$Res> {
  __$$PersonalBoundariesImplCopyWithImpl(
    _$PersonalBoundariesImpl _value,
    $Res Function(_$PersonalBoundariesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PersonalBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicsToAvoid = null,
    Object? enforcedQuietHours = freezed,
    Object? escalationRules = null,
    Object? suppressionWindows = null,
  }) {
    return _then(
      _$PersonalBoundariesImpl(
        topicsToAvoid: null == topicsToAvoid
            ? _value._topicsToAvoid
            : topicsToAvoid // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        enforcedQuietHours: freezed == enforcedQuietHours
            ? _value.enforcedQuietHours
            : enforcedQuietHours // ignore: cast_nullable_to_non_nullable
                  as QuietHours?,
        escalationRules: null == escalationRules
            ? _value._escalationRules
            : escalationRules // ignore: cast_nullable_to_non_nullable
                  as List<EscalationRule>,
        suppressionWindows: null == suppressionWindows
            ? _value._suppressionWindows
            : suppressionWindows // ignore: cast_nullable_to_non_nullable
                  as List<SuppressionWindow>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalBoundariesImpl extends _PersonalBoundaries {
  const _$PersonalBoundariesImpl({
    required final List<String> topicsToAvoid,
    required this.enforcedQuietHours,
    final List<EscalationRule> escalationRules = const [],
    final List<SuppressionWindow> suppressionWindows = const [],
  }) : _topicsToAvoid = topicsToAvoid,
       _escalationRules = escalationRules,
       _suppressionWindows = suppressionWindows,
       super._();

  factory _$PersonalBoundariesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalBoundariesImplFromJson(json);

  final List<String> _topicsToAvoid;
  @override
  List<String> get topicsToAvoid {
    if (_topicsToAvoid is EqualUnmodifiableListView) return _topicsToAvoid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topicsToAvoid);
  }

  @override
  final QuietHours? enforcedQuietHours;
  final List<EscalationRule> _escalationRules;
  @override
  @JsonKey()
  List<EscalationRule> get escalationRules {
    if (_escalationRules is EqualUnmodifiableListView) return _escalationRules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_escalationRules);
  }

  final List<SuppressionWindow> _suppressionWindows;
  @override
  @JsonKey()
  List<SuppressionWindow> get suppressionWindows {
    if (_suppressionWindows is EqualUnmodifiableListView)
      return _suppressionWindows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suppressionWindows);
  }

  @override
  String toString() {
    return 'PersonalBoundaries(topicsToAvoid: $topicsToAvoid, enforcedQuietHours: $enforcedQuietHours, escalationRules: $escalationRules, suppressionWindows: $suppressionWindows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalBoundariesImpl &&
            const DeepCollectionEquality().equals(
              other._topicsToAvoid,
              _topicsToAvoid,
            ) &&
            (identical(other.enforcedQuietHours, enforcedQuietHours) ||
                other.enforcedQuietHours == enforcedQuietHours) &&
            const DeepCollectionEquality().equals(
              other._escalationRules,
              _escalationRules,
            ) &&
            const DeepCollectionEquality().equals(
              other._suppressionWindows,
              _suppressionWindows,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_topicsToAvoid),
    enforcedQuietHours,
    const DeepCollectionEquality().hash(_escalationRules),
    const DeepCollectionEquality().hash(_suppressionWindows),
  );

  /// Create a copy of PersonalBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalBoundariesImplCopyWith<_$PersonalBoundariesImpl> get copyWith =>
      __$$PersonalBoundariesImplCopyWithImpl<_$PersonalBoundariesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalBoundariesImplToJson(this);
  }
}

abstract class _PersonalBoundaries extends PersonalBoundaries {
  const factory _PersonalBoundaries({
    required final List<String> topicsToAvoid,
    required final QuietHours? enforcedQuietHours,
    final List<EscalationRule> escalationRules,
    final List<SuppressionWindow> suppressionWindows,
  }) = _$PersonalBoundariesImpl;
  const _PersonalBoundaries._() : super._();

  factory _PersonalBoundaries.fromJson(Map<String, dynamic> json) =
      _$PersonalBoundariesImpl.fromJson;

  @override
  List<String> get topicsToAvoid;
  @override
  QuietHours? get enforcedQuietHours;
  @override
  List<EscalationRule> get escalationRules;
  @override
  List<SuppressionWindow> get suppressionWindows;

  /// Create a copy of PersonalBoundaries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PersonalBoundariesImplCopyWith<_$PersonalBoundariesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
