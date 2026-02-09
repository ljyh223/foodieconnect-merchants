// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MerchantRegisterRequest _$MerchantRegisterRequestFromJson(
  Map<String, dynamic> json,
) {
  return _MerchantRegisterRequest.fromJson(json);
}

/// @nodoc
mixin _$MerchantRegisterRequest {
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantName')
  String get restaurantName => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantType')
  String get restaurantType => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantAddress')
  String get restaurantAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'restaurantImage')
  String? get restaurantImage => throw _privateConstructorUsedError;

  /// Serializes this MerchantRegisterRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MerchantRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MerchantRegisterRequestCopyWith<MerchantRegisterRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantRegisterRequestCopyWith<$Res> {
  factory $MerchantRegisterRequestCopyWith(
    MerchantRegisterRequest value,
    $Res Function(MerchantRegisterRequest) then,
  ) = _$MerchantRegisterRequestCopyWithImpl<$Res, MerchantRegisterRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'username') String username,
    @JsonKey(name: 'email') String email,
    @JsonKey(name: 'password') String password,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'restaurantName') String restaurantName,
    @JsonKey(name: 'restaurantType') String restaurantType,
    @JsonKey(name: 'restaurantAddress') String restaurantAddress,
    @JsonKey(name: 'restaurantImage') String? restaurantImage,
  });
}

/// @nodoc
class _$MerchantRegisterRequestCopyWithImpl<
  $Res,
  $Val extends MerchantRegisterRequest
>
    implements $MerchantRegisterRequestCopyWith<$Res> {
  _$MerchantRegisterRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MerchantRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? phone = freezed,
    Object? restaurantName = null,
    Object? restaurantType = null,
    Object? restaurantAddress = null,
    Object? restaurantImage = freezed,
  }) {
    return _then(
      _value.copyWith(
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            restaurantName: null == restaurantName
                ? _value.restaurantName
                : restaurantName // ignore: cast_nullable_to_non_nullable
                      as String,
            restaurantType: null == restaurantType
                ? _value.restaurantType
                : restaurantType // ignore: cast_nullable_to_non_nullable
                      as String,
            restaurantAddress: null == restaurantAddress
                ? _value.restaurantAddress
                : restaurantAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            restaurantImage: freezed == restaurantImage
                ? _value.restaurantImage
                : restaurantImage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MerchantRegisterRequestImplCopyWith<$Res>
    implements $MerchantRegisterRequestCopyWith<$Res> {
  factory _$$MerchantRegisterRequestImplCopyWith(
    _$MerchantRegisterRequestImpl value,
    $Res Function(_$MerchantRegisterRequestImpl) then,
  ) = __$$MerchantRegisterRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'username') String username,
    @JsonKey(name: 'email') String email,
    @JsonKey(name: 'password') String password,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'restaurantName') String restaurantName,
    @JsonKey(name: 'restaurantType') String restaurantType,
    @JsonKey(name: 'restaurantAddress') String restaurantAddress,
    @JsonKey(name: 'restaurantImage') String? restaurantImage,
  });
}

/// @nodoc
class __$$MerchantRegisterRequestImplCopyWithImpl<$Res>
    extends
        _$MerchantRegisterRequestCopyWithImpl<
          $Res,
          _$MerchantRegisterRequestImpl
        >
    implements _$$MerchantRegisterRequestImplCopyWith<$Res> {
  __$$MerchantRegisterRequestImplCopyWithImpl(
    _$MerchantRegisterRequestImpl _value,
    $Res Function(_$MerchantRegisterRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MerchantRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? phone = freezed,
    Object? restaurantName = null,
    Object? restaurantType = null,
    Object? restaurantAddress = null,
    Object? restaurantImage = freezed,
  }) {
    return _then(
      _$MerchantRegisterRequestImpl(
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        restaurantName: null == restaurantName
            ? _value.restaurantName
            : restaurantName // ignore: cast_nullable_to_non_nullable
                  as String,
        restaurantType: null == restaurantType
            ? _value.restaurantType
            : restaurantType // ignore: cast_nullable_to_non_nullable
                  as String,
        restaurantAddress: null == restaurantAddress
            ? _value.restaurantAddress
            : restaurantAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        restaurantImage: freezed == restaurantImage
            ? _value.restaurantImage
            : restaurantImage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchantRegisterRequestImpl implements _MerchantRegisterRequest {
  const _$MerchantRegisterRequestImpl({
    @JsonKey(name: 'username') required this.username,
    @JsonKey(name: 'email') required this.email,
    @JsonKey(name: 'password') required this.password,
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'phone') this.phone,
    @JsonKey(name: 'restaurantName') required this.restaurantName,
    @JsonKey(name: 'restaurantType') required this.restaurantType,
    @JsonKey(name: 'restaurantAddress') required this.restaurantAddress,
    @JsonKey(name: 'restaurantImage') this.restaurantImage,
  });

  factory _$MerchantRegisterRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchantRegisterRequestImplFromJson(json);

  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'password')
  final String password;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'restaurantName')
  final String restaurantName;
  @override
  @JsonKey(name: 'restaurantType')
  final String restaurantType;
  @override
  @JsonKey(name: 'restaurantAddress')
  final String restaurantAddress;
  @override
  @JsonKey(name: 'restaurantImage')
  final String? restaurantImage;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantRegisterRequestImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.restaurantType, restaurantType) ||
                other.restaurantType == restaurantType) &&
            (identical(other.restaurantAddress, restaurantAddress) ||
                other.restaurantAddress == restaurantAddress) &&
            (identical(other.restaurantImage, restaurantImage) ||
                other.restaurantImage == restaurantImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    username,
    email,
    password,
    name,
    phone,
    restaurantName,
    restaurantType,
    restaurantAddress,
    restaurantImage,
  );

  /// Create a copy of MerchantRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchantRegisterRequestImplCopyWith<_$MerchantRegisterRequestImpl>
  get copyWith =>
      __$$MerchantRegisterRequestImplCopyWithImpl<
        _$MerchantRegisterRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchantRegisterRequestImplToJson(this);
  }
}

abstract class _MerchantRegisterRequest implements MerchantRegisterRequest {
  const factory _MerchantRegisterRequest({
    @JsonKey(name: 'username') required final String username,
    @JsonKey(name: 'email') required final String email,
    @JsonKey(name: 'password') required final String password,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'phone') final String? phone,
    @JsonKey(name: 'restaurantName') required final String restaurantName,
    @JsonKey(name: 'restaurantType') required final String restaurantType,
    @JsonKey(name: 'restaurantAddress') required final String restaurantAddress,
    @JsonKey(name: 'restaurantImage') final String? restaurantImage,
  }) = _$MerchantRegisterRequestImpl;

  factory _MerchantRegisterRequest.fromJson(Map<String, dynamic> json) =
      _$MerchantRegisterRequestImpl.fromJson;

  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'restaurantName')
  String get restaurantName;
  @override
  @JsonKey(name: 'restaurantType')
  String get restaurantType;
  @override
  @JsonKey(name: 'restaurantAddress')
  String get restaurantAddress;
  @override
  @JsonKey(name: 'restaurantImage')
  String? get restaurantImage;

  /// Create a copy of MerchantRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MerchantRegisterRequestImplCopyWith<_$MerchantRegisterRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
