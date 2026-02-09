// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_register_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MerchantRegisterResponse _$MerchantRegisterResponseFromJson(
  Map<String, dynamic> json,
) {
  return _MerchantRegisterResponse.fromJson(json);
}

/// @nodoc
mixin _$MerchantRegisterResponse {
  @JsonKey(name: 'merchantId')
  int get merchantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantId')
  int get restaurantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'roleDescription')
  String get roleDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MerchantRegisterResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MerchantRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MerchantRegisterResponseCopyWith<MerchantRegisterResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantRegisterResponseCopyWith<$Res> {
  factory $MerchantRegisterResponseCopyWith(
    MerchantRegisterResponse value,
    $Res Function(MerchantRegisterResponse) then,
  ) = _$MerchantRegisterResponseCopyWithImpl<$Res, MerchantRegisterResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'merchantId') int merchantId,
    @JsonKey(name: 'username') String username,
    @JsonKey(name: 'email') String email,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'restaurantId') int restaurantId,
    @JsonKey(name: 'role') String role,
    @JsonKey(name: 'roleDescription') String roleDescription,
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'createdAt') String createdAt,
  });
}

/// @nodoc
class _$MerchantRegisterResponseCopyWithImpl<
  $Res,
  $Val extends MerchantRegisterResponse
>
    implements $MerchantRegisterResponseCopyWith<$Res> {
  _$MerchantRegisterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MerchantRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantId = null,
    Object? username = null,
    Object? email = null,
    Object? name = null,
    Object? phone = freezed,
    Object? restaurantId = null,
    Object? role = null,
    Object? roleDescription = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            merchantId: null == merchantId
                ? _value.merchantId
                : merchantId // ignore: cast_nullable_to_non_nullable
                      as int,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            restaurantId: null == restaurantId
                ? _value.restaurantId
                : restaurantId // ignore: cast_nullable_to_non_nullable
                      as int,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            roleDescription: null == roleDescription
                ? _value.roleDescription
                : roleDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MerchantRegisterResponseImplCopyWith<$Res>
    implements $MerchantRegisterResponseCopyWith<$Res> {
  factory _$$MerchantRegisterResponseImplCopyWith(
    _$MerchantRegisterResponseImpl value,
    $Res Function(_$MerchantRegisterResponseImpl) then,
  ) = __$$MerchantRegisterResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'merchantId') int merchantId,
    @JsonKey(name: 'username') String username,
    @JsonKey(name: 'email') String email,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'restaurantId') int restaurantId,
    @JsonKey(name: 'role') String role,
    @JsonKey(name: 'roleDescription') String roleDescription,
    @JsonKey(name: 'status') String status,
    @JsonKey(name: 'createdAt') String createdAt,
  });
}

/// @nodoc
class __$$MerchantRegisterResponseImplCopyWithImpl<$Res>
    extends
        _$MerchantRegisterResponseCopyWithImpl<
          $Res,
          _$MerchantRegisterResponseImpl
        >
    implements _$$MerchantRegisterResponseImplCopyWith<$Res> {
  __$$MerchantRegisterResponseImplCopyWithImpl(
    _$MerchantRegisterResponseImpl _value,
    $Res Function(_$MerchantRegisterResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MerchantRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? merchantId = null,
    Object? username = null,
    Object? email = null,
    Object? name = null,
    Object? phone = freezed,
    Object? restaurantId = null,
    Object? role = null,
    Object? roleDescription = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$MerchantRegisterResponseImpl(
        merchantId: null == merchantId
            ? _value.merchantId
            : merchantId // ignore: cast_nullable_to_non_nullable
                  as int,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        restaurantId: null == restaurantId
            ? _value.restaurantId
            : restaurantId // ignore: cast_nullable_to_non_nullable
                  as int,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        roleDescription: null == roleDescription
            ? _value.roleDescription
            : roleDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchantRegisterResponseImpl implements _MerchantRegisterResponse {
  const _$MerchantRegisterResponseImpl({
    @JsonKey(name: 'merchantId') required this.merchantId,
    @JsonKey(name: 'username') required this.username,
    @JsonKey(name: 'email') required this.email,
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'phone') this.phone,
    @JsonKey(name: 'restaurantId') required this.restaurantId,
    @JsonKey(name: 'role') required this.role,
    @JsonKey(name: 'roleDescription') required this.roleDescription,
    @JsonKey(name: 'status') required this.status,
    @JsonKey(name: 'createdAt') required this.createdAt,
  });

  factory _$MerchantRegisterResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchantRegisterResponseImplFromJson(json);

  @override
  @JsonKey(name: 'merchantId')
  final int merchantId;
  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'restaurantId')
  final int restaurantId;
  @override
  @JsonKey(name: 'role')
  final String role;
  @override
  @JsonKey(name: 'roleDescription')
  final String roleDescription;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'createdAt')
  final String createdAt;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantRegisterResponseImpl &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.roleDescription, roleDescription) ||
                other.roleDescription == roleDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    merchantId,
    username,
    email,
    name,
    phone,
    restaurantId,
    role,
    roleDescription,
    status,
    createdAt,
  );

  /// Create a copy of MerchantRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchantRegisterResponseImplCopyWith<_$MerchantRegisterResponseImpl>
  get copyWith =>
      __$$MerchantRegisterResponseImplCopyWithImpl<
        _$MerchantRegisterResponseImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchantRegisterResponseImplToJson(this);
  }
}

abstract class _MerchantRegisterResponse implements MerchantRegisterResponse {
  const factory _MerchantRegisterResponse({
    @JsonKey(name: 'merchantId') required final int merchantId,
    @JsonKey(name: 'username') required final String username,
    @JsonKey(name: 'email') required final String email,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'phone') final String? phone,
    @JsonKey(name: 'restaurantId') required final int restaurantId,
    @JsonKey(name: 'role') required final String role,
    @JsonKey(name: 'roleDescription') required final String roleDescription,
    @JsonKey(name: 'status') required final String status,
    @JsonKey(name: 'createdAt') required final String createdAt,
  }) = _$MerchantRegisterResponseImpl;

  factory _MerchantRegisterResponse.fromJson(Map<String, dynamic> json) =
      _$MerchantRegisterResponseImpl.fromJson;

  @override
  @JsonKey(name: 'merchantId')
  int get merchantId;
  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'restaurantId')
  int get restaurantId;
  @override
  @JsonKey(name: 'role')
  String get role;
  @override
  @JsonKey(name: 'roleDescription')
  String get roleDescription;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'createdAt')
  String get createdAt;

  /// Create a copy of MerchantRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MerchantRegisterResponseImplCopyWith<_$MerchantRegisterResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
