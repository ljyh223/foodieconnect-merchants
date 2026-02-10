// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StaffInfo _$StaffInfoFromJson(Map<String, dynamic> json) {
  return _StaffInfo.fromJson(json);
}

/// @nodoc
mixin _$StaffInfo {
  @JsonKey(name: 'staffId')
  int get staffId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  double get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatarUrl')
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this StaffInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaffInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffInfoCopyWith<StaffInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffInfoCopyWith<$Res> {
  factory $StaffInfoCopyWith(StaffInfo value, $Res Function(StaffInfo) then) =
      _$StaffInfoCopyWithImpl<$Res, StaffInfo>;
  @useResult
  $Res call({
    @JsonKey(name: 'staffId') int staffId,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'rating') double rating,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
  });
}

/// @nodoc
class _$StaffInfoCopyWithImpl<$Res, $Val extends StaffInfo>
    implements $StaffInfoCopyWith<$Res> {
  _$StaffInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? name = null,
    Object? rating = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            staffId: null == staffId
                ? _value.staffId
                : staffId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StaffInfoImplCopyWith<$Res>
    implements $StaffInfoCopyWith<$Res> {
  factory _$$StaffInfoImplCopyWith(
    _$StaffInfoImpl value,
    $Res Function(_$StaffInfoImpl) then,
  ) = __$$StaffInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'staffId') int staffId,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'rating') double rating,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
  });
}

/// @nodoc
class __$$StaffInfoImplCopyWithImpl<$Res>
    extends _$StaffInfoCopyWithImpl<$Res, _$StaffInfoImpl>
    implements _$$StaffInfoImplCopyWith<$Res> {
  __$$StaffInfoImplCopyWithImpl(
    _$StaffInfoImpl _value,
    $Res Function(_$StaffInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StaffInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? name = null,
    Object? rating = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _$StaffInfoImpl(
        staffId: null == staffId
            ? _value.staffId
            : staffId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffInfoImpl implements _StaffInfo {
  const _$StaffInfoImpl({
    @JsonKey(name: 'staffId') required this.staffId,
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'rating') required this.rating,
    @JsonKey(name: 'avatarUrl') this.avatarUrl,
  });

  factory _$StaffInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffInfoImplFromJson(json);

  @override
  @JsonKey(name: 'staffId')
  final int staffId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'rating')
  final double rating;
  @override
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;

  @override
  String toString() {
    return 'StaffInfo(staffId: $staffId, name: $name, rating: $rating, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffInfoImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, staffId, name, rating, avatarUrl);

  /// Create a copy of StaffInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffInfoImplCopyWith<_$StaffInfoImpl> get copyWith =>
      __$$StaffInfoImplCopyWithImpl<_$StaffInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffInfoImplToJson(this);
  }
}

abstract class _StaffInfo implements StaffInfo {
  const factory _StaffInfo({
    @JsonKey(name: 'staffId') required final int staffId,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'rating') required final double rating,
    @JsonKey(name: 'avatarUrl') final String? avatarUrl,
  }) = _$StaffInfoImpl;

  factory _StaffInfo.fromJson(Map<String, dynamic> json) =
      _$StaffInfoImpl.fromJson;

  @override
  @JsonKey(name: 'staffId')
  int get staffId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'rating')
  double get rating;
  @override
  @JsonKey(name: 'avatarUrl')
  String? get avatarUrl;

  /// Create a copy of StaffInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffInfoImplCopyWith<_$StaffInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
