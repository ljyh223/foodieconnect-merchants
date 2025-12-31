// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RestaurantUpdateRequest _$RestaurantUpdateRequestFromJson(
  Map<String, dynamic> json,
) {
  return _RestaurantUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$RestaurantUpdateRequest {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'hours')
  String? get hours => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'isOpen')
  bool? get isOpen => throw _privateConstructorUsedError;

  /// Serializes this RestaurantUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantUpdateRequestCopyWith<RestaurantUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantUpdateRequestCopyWith<$Res> {
  factory $RestaurantUpdateRequestCopyWith(
    RestaurantUpdateRequest value,
    $Res Function(RestaurantUpdateRequest) then,
  ) = _$RestaurantUpdateRequestCopyWithImpl<$Res, RestaurantUpdateRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'type') String type,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'address') String address,
    @JsonKey(name: 'phone') String phone,
    @JsonKey(name: 'hours') String? hours,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'isOpen') bool? isOpen,
  });
}

/// @nodoc
class _$RestaurantUpdateRequestCopyWithImpl<
  $Res,
  $Val extends RestaurantUpdateRequest
>
    implements $RestaurantUpdateRequestCopyWith<$Res> {
  _$RestaurantUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? description = freezed,
    Object? address = null,
    Object? phone = null,
    Object? hours = freezed,
    Object? imageUrl = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            address: null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            hours: freezed == hours
                ? _value.hours
                : hours // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOpen: freezed == isOpen
                ? _value.isOpen
                : isOpen // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RestaurantUpdateRequestImplCopyWith<$Res>
    implements $RestaurantUpdateRequestCopyWith<$Res> {
  factory _$$RestaurantUpdateRequestImplCopyWith(
    _$RestaurantUpdateRequestImpl value,
    $Res Function(_$RestaurantUpdateRequestImpl) then,
  ) = __$$RestaurantUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'type') String type,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'address') String address,
    @JsonKey(name: 'phone') String phone,
    @JsonKey(name: 'hours') String? hours,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'isOpen') bool? isOpen,
  });
}

/// @nodoc
class __$$RestaurantUpdateRequestImplCopyWithImpl<$Res>
    extends
        _$RestaurantUpdateRequestCopyWithImpl<
          $Res,
          _$RestaurantUpdateRequestImpl
        >
    implements _$$RestaurantUpdateRequestImplCopyWith<$Res> {
  __$$RestaurantUpdateRequestImplCopyWithImpl(
    _$RestaurantUpdateRequestImpl _value,
    $Res Function(_$RestaurantUpdateRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RestaurantUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? description = freezed,
    Object? address = null,
    Object? phone = null,
    Object? hours = freezed,
    Object? imageUrl = freezed,
    Object? isOpen = freezed,
  }) {
    return _then(
      _$RestaurantUpdateRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        address: null == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        hours: freezed == hours
            ? _value.hours
            : hours // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOpen: freezed == isOpen
            ? _value.isOpen
            : isOpen // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantUpdateRequestImpl extends _RestaurantUpdateRequest {
  const _$RestaurantUpdateRequestImpl({
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'type') required this.type,
    @JsonKey(name: 'description') this.description,
    @JsonKey(name: 'address') required this.address,
    @JsonKey(name: 'phone') required this.phone,
    @JsonKey(name: 'hours') this.hours,
    @JsonKey(name: 'imageUrl') this.imageUrl,
    @JsonKey(name: 'isOpen') this.isOpen,
  }) : super._();

  factory _$RestaurantUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantUpdateRequestImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'address')
  final String address;
  @override
  @JsonKey(name: 'phone')
  final String phone;
  @override
  @JsonKey(name: 'hours')
  final String? hours;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'isOpen')
  final bool? isOpen;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantUpdateRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.hours, hours) || other.hours == hours) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    type,
    description,
    address,
    phone,
    hours,
    imageUrl,
    isOpen,
  );

  /// Create a copy of RestaurantUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantUpdateRequestImplCopyWith<_$RestaurantUpdateRequestImpl>
  get copyWith =>
      __$$RestaurantUpdateRequestImplCopyWithImpl<
        _$RestaurantUpdateRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantUpdateRequestImplToJson(this);
  }
}

abstract class _RestaurantUpdateRequest extends RestaurantUpdateRequest {
  const factory _RestaurantUpdateRequest({
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'type') required final String type,
    @JsonKey(name: 'description') final String? description,
    @JsonKey(name: 'address') required final String address,
    @JsonKey(name: 'phone') required final String phone,
    @JsonKey(name: 'hours') final String? hours,
    @JsonKey(name: 'imageUrl') final String? imageUrl,
    @JsonKey(name: 'isOpen') final bool? isOpen,
  }) = _$RestaurantUpdateRequestImpl;
  const _RestaurantUpdateRequest._() : super._();

  factory _RestaurantUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$RestaurantUpdateRequestImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'address')
  String get address;
  @override
  @JsonKey(name: 'phone')
  String get phone;
  @override
  @JsonKey(name: 'hours')
  String? get hours;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'isOpen')
  bool? get isOpen;

  /// Create a copy of RestaurantUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantUpdateRequestImplCopyWith<_$RestaurantUpdateRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
