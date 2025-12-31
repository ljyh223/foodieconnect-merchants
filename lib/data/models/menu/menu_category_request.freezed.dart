// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_category_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MenuCategoryRequest _$MenuCategoryRequestFromJson(Map<String, dynamic> json) {
  return _MenuCategoryRequest.fromJson(json);
}

/// @nodoc
mixin _$MenuCategoryRequest {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'sortOrder')
  int get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'isActive')
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this MenuCategoryRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuCategoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuCategoryRequestCopyWith<MenuCategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCategoryRequestCopyWith<$Res> {
  factory $MenuCategoryRequestCopyWith(
    MenuCategoryRequest value,
    $Res Function(MenuCategoryRequest) then,
  ) = _$MenuCategoryRequestCopyWithImpl<$Res, MenuCategoryRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'sortOrder') int sortOrder,
    @JsonKey(name: 'isActive') bool isActive,
  });
}

/// @nodoc
class _$MenuCategoryRequestCopyWithImpl<$Res, $Val extends MenuCategoryRequest>
    implements $MenuCategoryRequestCopyWith<$Res> {
  _$MenuCategoryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuCategoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? sortOrder = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuCategoryRequestImplCopyWith<$Res>
    implements $MenuCategoryRequestCopyWith<$Res> {
  factory _$$MenuCategoryRequestImplCopyWith(
    _$MenuCategoryRequestImpl value,
    $Res Function(_$MenuCategoryRequestImpl) then,
  ) = __$$MenuCategoryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'sortOrder') int sortOrder,
    @JsonKey(name: 'isActive') bool isActive,
  });
}

/// @nodoc
class __$$MenuCategoryRequestImplCopyWithImpl<$Res>
    extends _$MenuCategoryRequestCopyWithImpl<$Res, _$MenuCategoryRequestImpl>
    implements _$$MenuCategoryRequestImplCopyWith<$Res> {
  __$$MenuCategoryRequestImplCopyWithImpl(
    _$MenuCategoryRequestImpl _value,
    $Res Function(_$MenuCategoryRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuCategoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? sortOrder = null,
    Object? isActive = null,
  }) {
    return _then(
      _$MenuCategoryRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuCategoryRequestImpl extends _MenuCategoryRequest {
  const _$MenuCategoryRequestImpl({
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'description') this.description,
    @JsonKey(name: 'sortOrder') this.sortOrder = 0,
    @JsonKey(name: 'isActive') this.isActive = true,
  }) : super._();

  factory _$MenuCategoryRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuCategoryRequestImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'sortOrder')
  final int sortOrder;
  @override
  @JsonKey(name: 'isActive')
  final bool isActive;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuCategoryRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, sortOrder, isActive);

  /// Create a copy of MenuCategoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuCategoryRequestImplCopyWith<_$MenuCategoryRequestImpl> get copyWith =>
      __$$MenuCategoryRequestImplCopyWithImpl<_$MenuCategoryRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuCategoryRequestImplToJson(this);
  }
}

abstract class _MenuCategoryRequest extends MenuCategoryRequest {
  const factory _MenuCategoryRequest({
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'description') final String? description,
    @JsonKey(name: 'sortOrder') final int sortOrder,
    @JsonKey(name: 'isActive') final bool isActive,
  }) = _$MenuCategoryRequestImpl;
  const _MenuCategoryRequest._() : super._();

  factory _MenuCategoryRequest.fromJson(Map<String, dynamic> json) =
      _$MenuCategoryRequestImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'sortOrder')
  int get sortOrder;
  @override
  @JsonKey(name: 'isActive')
  bool get isActive;

  /// Create a copy of MenuCategoryRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuCategoryRequestImplCopyWith<_$MenuCategoryRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
