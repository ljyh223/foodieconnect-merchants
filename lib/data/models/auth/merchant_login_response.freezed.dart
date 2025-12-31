// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MerchantLoginResponse _$MerchantLoginResponseFromJson(
  Map<String, dynamic> json,
) {
  return _MerchantLoginResponse.fromJson(json);
}

/// @nodoc
mixin _$MerchantLoginResponse {
  @JsonKey(name: 'token')
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'tokenType')
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'merchantId')
  int get merchantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantId')
  int get restaurantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'roleDescription')
  String get roleDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this MerchantLoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MerchantLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MerchantLoginResponseCopyWith<MerchantLoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantLoginResponseCopyWith<$Res> {
  factory $MerchantLoginResponseCopyWith(
    MerchantLoginResponse value,
    $Res Function(MerchantLoginResponse) then,
  ) = _$MerchantLoginResponseCopyWithImpl<$Res, MerchantLoginResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'token') String token,
    @JsonKey(name: 'tokenType') String tokenType,
    @JsonKey(name: 'merchantId') int merchantId,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'username') String username,
    @JsonKey(name: 'email') String email,
    @JsonKey(name: 'restaurantId') int restaurantId,
    @JsonKey(name: 'role') String role,
    @JsonKey(name: 'roleDescription') String roleDescription,
    @JsonKey(name: 'phone') String phone,
  });
}

/// @nodoc
class _$MerchantLoginResponseCopyWithImpl<
  $Res,
  $Val extends MerchantLoginResponse
>
    implements $MerchantLoginResponseCopyWith<$Res> {
  _$MerchantLoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MerchantLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? tokenType = null,
    Object? merchantId = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? restaurantId = null,
    Object? role = null,
    Object? roleDescription = null,
    Object? phone = null,
  }) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            tokenType: null == tokenType
                ? _value.tokenType
                : tokenType // ignore: cast_nullable_to_non_nullable
                      as String,
            merchantId: null == merchantId
                ? _value.merchantId
                : merchantId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
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
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MerchantLoginResponseImplCopyWith<$Res>
    implements $MerchantLoginResponseCopyWith<$Res> {
  factory _$$MerchantLoginResponseImplCopyWith(
    _$MerchantLoginResponseImpl value,
    $Res Function(_$MerchantLoginResponseImpl) then,
  ) = __$$MerchantLoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'token') String token,
    @JsonKey(name: 'tokenType') String tokenType,
    @JsonKey(name: 'merchantId') int merchantId,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'username') String username,
    @JsonKey(name: 'email') String email,
    @JsonKey(name: 'restaurantId') int restaurantId,
    @JsonKey(name: 'role') String role,
    @JsonKey(name: 'roleDescription') String roleDescription,
    @JsonKey(name: 'phone') String phone,
  });
}

/// @nodoc
class __$$MerchantLoginResponseImplCopyWithImpl<$Res>
    extends
        _$MerchantLoginResponseCopyWithImpl<$Res, _$MerchantLoginResponseImpl>
    implements _$$MerchantLoginResponseImplCopyWith<$Res> {
  __$$MerchantLoginResponseImplCopyWithImpl(
    _$MerchantLoginResponseImpl _value,
    $Res Function(_$MerchantLoginResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MerchantLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? tokenType = null,
    Object? merchantId = null,
    Object? name = null,
    Object? username = null,
    Object? email = null,
    Object? restaurantId = null,
    Object? role = null,
    Object? roleDescription = null,
    Object? phone = null,
  }) {
    return _then(
      _$MerchantLoginResponseImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        tokenType: null == tokenType
            ? _value.tokenType
            : tokenType // ignore: cast_nullable_to_non_nullable
                  as String,
        merchantId: null == merchantId
            ? _value.merchantId
            : merchantId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
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
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchantLoginResponseImpl implements _MerchantLoginResponse {
  const _$MerchantLoginResponseImpl({
    @JsonKey(name: 'token') required this.token,
    @JsonKey(name: 'tokenType') required this.tokenType,
    @JsonKey(name: 'merchantId') required this.merchantId,
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'username') required this.username,
    @JsonKey(name: 'email') required this.email,
    @JsonKey(name: 'restaurantId') required this.restaurantId,
    @JsonKey(name: 'role') required this.role,
    @JsonKey(name: 'roleDescription') required this.roleDescription,
    @JsonKey(name: 'phone') required this.phone,
  });

  factory _$MerchantLoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchantLoginResponseImplFromJson(json);

  @override
  @JsonKey(name: 'token')
  final String token;
  @override
  @JsonKey(name: 'tokenType')
  final String tokenType;
  @override
  @JsonKey(name: 'merchantId')
  final int merchantId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'email')
  final String email;
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
  @JsonKey(name: 'phone')
  final String phone;

  @override
  String toString() {
    return 'MerchantLoginResponse(token: $token, tokenType: $tokenType, merchantId: $merchantId, name: $name, username: $username, email: $email, restaurantId: $restaurantId, role: $role, roleDescription: $roleDescription, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantLoginResponseImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.roleDescription, roleDescription) ||
                other.roleDescription == roleDescription) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    token,
    tokenType,
    merchantId,
    name,
    username,
    email,
    restaurantId,
    role,
    roleDescription,
    phone,
  );

  /// Create a copy of MerchantLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchantLoginResponseImplCopyWith<_$MerchantLoginResponseImpl>
  get copyWith =>
      __$$MerchantLoginResponseImplCopyWithImpl<_$MerchantLoginResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchantLoginResponseImplToJson(this);
  }
}

abstract class _MerchantLoginResponse implements MerchantLoginResponse {
  const factory _MerchantLoginResponse({
    @JsonKey(name: 'token') required final String token,
    @JsonKey(name: 'tokenType') required final String tokenType,
    @JsonKey(name: 'merchantId') required final int merchantId,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'username') required final String username,
    @JsonKey(name: 'email') required final String email,
    @JsonKey(name: 'restaurantId') required final int restaurantId,
    @JsonKey(name: 'role') required final String role,
    @JsonKey(name: 'roleDescription') required final String roleDescription,
    @JsonKey(name: 'phone') required final String phone,
  }) = _$MerchantLoginResponseImpl;

  factory _MerchantLoginResponse.fromJson(Map<String, dynamic> json) =
      _$MerchantLoginResponseImpl.fromJson;

  @override
  @JsonKey(name: 'token')
  String get token;
  @override
  @JsonKey(name: 'tokenType')
  String get tokenType;
  @override
  @JsonKey(name: 'merchantId')
  int get merchantId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'email')
  String get email;
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
  @JsonKey(name: 'phone')
  String get phone;

  /// Create a copy of MerchantLoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MerchantLoginResponseImplCopyWith<_$MerchantLoginResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
