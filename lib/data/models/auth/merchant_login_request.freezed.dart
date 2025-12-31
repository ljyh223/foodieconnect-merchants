// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'merchant_login_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MerchantLoginRequest _$MerchantLoginRequestFromJson(Map<String, dynamic> json) {
  return _MerchantLoginRequest.fromJson(json);
}

/// @nodoc
mixin _$MerchantLoginRequest {
  @JsonKey(name: 'username')
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;

  /// Serializes this MerchantLoginRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MerchantLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MerchantLoginRequestCopyWith<MerchantLoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MerchantLoginRequestCopyWith<$Res> {
  factory $MerchantLoginRequestCopyWith(
    MerchantLoginRequest value,
    $Res Function(MerchantLoginRequest) then,
  ) = _$MerchantLoginRequestCopyWithImpl<$Res, MerchantLoginRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'username') String username,
    @JsonKey(name: 'password') String password,
  });
}

/// @nodoc
class _$MerchantLoginRequestCopyWithImpl<
  $Res,
  $Val extends MerchantLoginRequest
>
    implements $MerchantLoginRequestCopyWith<$Res> {
  _$MerchantLoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MerchantLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? username = null, Object? password = null}) {
    return _then(
      _value.copyWith(
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MerchantLoginRequestImplCopyWith<$Res>
    implements $MerchantLoginRequestCopyWith<$Res> {
  factory _$$MerchantLoginRequestImplCopyWith(
    _$MerchantLoginRequestImpl value,
    $Res Function(_$MerchantLoginRequestImpl) then,
  ) = __$$MerchantLoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'username') String username,
    @JsonKey(name: 'password') String password,
  });
}

/// @nodoc
class __$$MerchantLoginRequestImplCopyWithImpl<$Res>
    extends _$MerchantLoginRequestCopyWithImpl<$Res, _$MerchantLoginRequestImpl>
    implements _$$MerchantLoginRequestImplCopyWith<$Res> {
  __$$MerchantLoginRequestImplCopyWithImpl(
    _$MerchantLoginRequestImpl _value,
    $Res Function(_$MerchantLoginRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MerchantLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? username = null, Object? password = null}) {
    return _then(
      _$MerchantLoginRequestImpl(
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MerchantLoginRequestImpl implements _MerchantLoginRequest {
  const _$MerchantLoginRequestImpl({
    @JsonKey(name: 'username') required this.username,
    @JsonKey(name: 'password') required this.password,
  });

  factory _$MerchantLoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MerchantLoginRequestImplFromJson(json);

  @override
  @JsonKey(name: 'username')
  final String username;
  @override
  @JsonKey(name: 'password')
  final String password;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MerchantLoginRequestImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  /// Create a copy of MerchantLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MerchantLoginRequestImplCopyWith<_$MerchantLoginRequestImpl>
  get copyWith =>
      __$$MerchantLoginRequestImplCopyWithImpl<_$MerchantLoginRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MerchantLoginRequestImplToJson(this);
  }
}

abstract class _MerchantLoginRequest implements MerchantLoginRequest {
  const factory _MerchantLoginRequest({
    @JsonKey(name: 'username') required final String username,
    @JsonKey(name: 'password') required final String password,
  }) = _$MerchantLoginRequestImpl;

  factory _MerchantLoginRequest.fromJson(Map<String, dynamic> json) =
      _$MerchantLoginRequestImpl.fromJson;

  @override
  @JsonKey(name: 'username')
  String get username;
  @override
  @JsonKey(name: 'password')
  String get password;

  /// Create a copy of MerchantLoginRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MerchantLoginRequestImplCopyWith<_$MerchantLoginRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
