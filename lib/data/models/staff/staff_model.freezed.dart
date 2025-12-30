// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StaffModel _$StaffModelFromJson(Map<String, dynamic> json) {
  return _StaffModel.fromJson(json);
}

/// @nodoc
mixin _$StaffModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantId')
  int get restaurantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'position')
  String? get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience')
  String? get experience => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatarUrl')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this StaffModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffModelCopyWith<StaffModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffModelCopyWith<$Res> {
  factory $StaffModelCopyWith(
    StaffModel value,
    $Res Function(StaffModel) then,
  ) = _$StaffModelCopyWithImpl<$Res, StaffModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'restaurantId') int restaurantId,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'position') String? position,
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'experience') String? experience,
    @JsonKey(name: 'rating') double? rating,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  });
}

/// @nodoc
class _$StaffModelCopyWithImpl<$Res, $Val extends StaffModel>
    implements $StaffModelCopyWith<$Res> {
  _$StaffModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantId = null,
    Object? name = null,
    Object? position = freezed,
    Object? status = null,
    Object? experience = freezed,
    Object? rating = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            restaurantId: null == restaurantId
                ? _value.restaurantId
                : restaurantId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            experience: freezed == experience
                ? _value.experience
                : experience // ignore: cast_nullable_to_non_nullable
                      as String?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StaffModelImplCopyWith<$Res>
    implements $StaffModelCopyWith<$Res> {
  factory _$$StaffModelImplCopyWith(
    _$StaffModelImpl value,
    $Res Function(_$StaffModelImpl) then,
  ) = __$$StaffModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'restaurantId') int restaurantId,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'position') String? position,
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'experience') String? experience,
    @JsonKey(name: 'rating') double? rating,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  });
}

/// @nodoc
class __$$StaffModelImplCopyWithImpl<$Res>
    extends _$StaffModelCopyWithImpl<$Res, _$StaffModelImpl>
    implements _$$StaffModelImplCopyWith<$Res> {
  __$$StaffModelImplCopyWithImpl(
    _$StaffModelImpl _value,
    $Res Function(_$StaffModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantId = null,
    Object? name = null,
    Object? position = freezed,
    Object? status = null,
    Object? experience = freezed,
    Object? rating = freezed,
    Object? avatarUrl = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$StaffModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        restaurantId: null == restaurantId
            ? _value.restaurantId
            : restaurantId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        experience: freezed == experience
            ? _value.experience
            : experience // ignore: cast_nullable_to_non_nullable
                  as String?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffModelImpl extends _StaffModel {
  const _$StaffModelImpl({
    @JsonKey(name: 'id') required this.id,
    @JsonKey(name: 'restaurantId') required this.restaurantId,
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'position') this.position,
    @JsonKey(name: 'status') required this.status,
    @JsonKey(name: 'experience') this.experience,
    @JsonKey(name: 'rating') this.rating,
    @JsonKey(name: 'avatarUrl') this.avatarUrl,
    @JsonKey(name: 'createdAt') this.createdAt,
    @JsonKey(name: 'updatedAt') this.updatedAt,
  }) : super._();

  factory _$StaffModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'restaurantId')
  final int restaurantId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'position')
  final String? position;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'experience')
  final String? experience;
  @override
  @JsonKey(name: 'rating')
  final double? rating;
  @override
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'StaffModel(id: $id, restaurantId: $restaurantId, name: $name, position: $position, status: $status, experience: $experience, rating: $rating, avatarUrl: $avatarUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.experience, experience) ||
                other.experience == experience) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    restaurantId,
    name,
    position,
    status,
    experience,
    rating,
    avatarUrl,
    createdAt,
    updatedAt,
  );

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffModelImplCopyWith<_$StaffModelImpl> get copyWith =>
      __$$StaffModelImplCopyWithImpl<_$StaffModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffModelImplToJson(this);
  }
}

abstract class _StaffModel extends StaffModel {
  const factory _StaffModel({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'restaurantId') required final int restaurantId,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'position') final String? position,
    @JsonKey(name: 'status') required final String status,
    @JsonKey(name: 'experience') final String? experience,
    @JsonKey(name: 'rating') final double? rating,
    @JsonKey(name: 'avatarUrl') final String? avatarUrl,
    @JsonKey(name: 'createdAt') final DateTime? createdAt,
    @JsonKey(name: 'updatedAt') final DateTime? updatedAt,
  }) = _$StaffModelImpl;
  const _StaffModel._() : super._();

  factory _StaffModel.fromJson(Map<String, dynamic> json) =
      _$StaffModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'restaurantId')
  int get restaurantId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'position')
  String? get position;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'experience')
  String? get experience;
  @override
  @JsonKey(name: 'rating')
  double? get rating;
  @override
  @JsonKey(name: 'avatarUrl')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'createdAt')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  DateTime? get updatedAt;

  /// Create a copy of StaffModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffModelImplCopyWith<_$StaffModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
