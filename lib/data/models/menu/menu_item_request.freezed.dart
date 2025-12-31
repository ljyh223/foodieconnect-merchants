// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MenuItemRequest _$MenuItemRequestFromJson(Map<String, dynamic> json) {
  return _MenuItemRequest.fromJson(json);
}

/// @nodoc
mixin _$MenuItemRequest {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'originalPrice')
  double? get originalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoryId')
  int get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'isAvailable')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'isRecommended')
  bool get isRecommended => throw _privateConstructorUsedError;
  @JsonKey(name: 'sortOrder')
  int get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'nutritionInfo')
  String? get nutritionInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'allergenInfo')
  String? get allergenInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'spiceLevel')
  String? get spiceLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'preparationTime')
  int? get preparationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'calories')
  int? get calories => throw _privateConstructorUsedError;

  /// Serializes this MenuItemRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemRequestCopyWith<MenuItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemRequestCopyWith<$Res> {
  factory $MenuItemRequestCopyWith(
    MenuItemRequest value,
    $Res Function(MenuItemRequest) then,
  ) = _$MenuItemRequestCopyWithImpl<$Res, MenuItemRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') double price,
    @JsonKey(name: 'originalPrice') double? originalPrice,
    @JsonKey(name: 'categoryId') int categoryId,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'isAvailable') bool isAvailable,
    @JsonKey(name: 'isRecommended') bool isRecommended,
    @JsonKey(name: 'sortOrder') int sortOrder,
    @JsonKey(name: 'nutritionInfo') String? nutritionInfo,
    @JsonKey(name: 'allergenInfo') String? allergenInfo,
    @JsonKey(name: 'spiceLevel') String? spiceLevel,
    @JsonKey(name: 'preparationTime') int? preparationTime,
    @JsonKey(name: 'calories') int? calories,
  });
}

/// @nodoc
class _$MenuItemRequestCopyWithImpl<$Res, $Val extends MenuItemRequest>
    implements $MenuItemRequestCopyWith<$Res> {
  _$MenuItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? originalPrice = freezed,
    Object? categoryId = null,
    Object? imageUrl = freezed,
    Object? isAvailable = null,
    Object? isRecommended = null,
    Object? sortOrder = null,
    Object? nutritionInfo = freezed,
    Object? allergenInfo = freezed,
    Object? spiceLevel = freezed,
    Object? preparationTime = freezed,
    Object? calories = freezed,
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
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            originalPrice: freezed == originalPrice
                ? _value.originalPrice
                : originalPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as int,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            isAvailable: null == isAvailable
                ? _value.isAvailable
                : isAvailable // ignore: cast_nullable_to_non_nullable
                      as bool,
            isRecommended: null == isRecommended
                ? _value.isRecommended
                : isRecommended // ignore: cast_nullable_to_non_nullable
                      as bool,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            nutritionInfo: freezed == nutritionInfo
                ? _value.nutritionInfo
                : nutritionInfo // ignore: cast_nullable_to_non_nullable
                      as String?,
            allergenInfo: freezed == allergenInfo
                ? _value.allergenInfo
                : allergenInfo // ignore: cast_nullable_to_non_nullable
                      as String?,
            spiceLevel: freezed == spiceLevel
                ? _value.spiceLevel
                : spiceLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            preparationTime: freezed == preparationTime
                ? _value.preparationTime
                : preparationTime // ignore: cast_nullable_to_non_nullable
                      as int?,
            calories: freezed == calories
                ? _value.calories
                : calories // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuItemRequestImplCopyWith<$Res>
    implements $MenuItemRequestCopyWith<$Res> {
  factory _$$MenuItemRequestImplCopyWith(
    _$MenuItemRequestImpl value,
    $Res Function(_$MenuItemRequestImpl) then,
  ) = __$$MenuItemRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') double price,
    @JsonKey(name: 'originalPrice') double? originalPrice,
    @JsonKey(name: 'categoryId') int categoryId,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'isAvailable') bool isAvailable,
    @JsonKey(name: 'isRecommended') bool isRecommended,
    @JsonKey(name: 'sortOrder') int sortOrder,
    @JsonKey(name: 'nutritionInfo') String? nutritionInfo,
    @JsonKey(name: 'allergenInfo') String? allergenInfo,
    @JsonKey(name: 'spiceLevel') String? spiceLevel,
    @JsonKey(name: 'preparationTime') int? preparationTime,
    @JsonKey(name: 'calories') int? calories,
  });
}

/// @nodoc
class __$$MenuItemRequestImplCopyWithImpl<$Res>
    extends _$MenuItemRequestCopyWithImpl<$Res, _$MenuItemRequestImpl>
    implements _$$MenuItemRequestImplCopyWith<$Res> {
  __$$MenuItemRequestImplCopyWithImpl(
    _$MenuItemRequestImpl _value,
    $Res Function(_$MenuItemRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? price = null,
    Object? originalPrice = freezed,
    Object? categoryId = null,
    Object? imageUrl = freezed,
    Object? isAvailable = null,
    Object? isRecommended = null,
    Object? sortOrder = null,
    Object? nutritionInfo = freezed,
    Object? allergenInfo = freezed,
    Object? spiceLevel = freezed,
    Object? preparationTime = freezed,
    Object? calories = freezed,
  }) {
    return _then(
      _$MenuItemRequestImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        originalPrice: freezed == originalPrice
            ? _value.originalPrice
            : originalPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as int,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        isAvailable: null == isAvailable
            ? _value.isAvailable
            : isAvailable // ignore: cast_nullable_to_non_nullable
                  as bool,
        isRecommended: null == isRecommended
            ? _value.isRecommended
            : isRecommended // ignore: cast_nullable_to_non_nullable
                  as bool,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        nutritionInfo: freezed == nutritionInfo
            ? _value.nutritionInfo
            : nutritionInfo // ignore: cast_nullable_to_non_nullable
                  as String?,
        allergenInfo: freezed == allergenInfo
            ? _value.allergenInfo
            : allergenInfo // ignore: cast_nullable_to_non_nullable
                  as String?,
        spiceLevel: freezed == spiceLevel
            ? _value.spiceLevel
            : spiceLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        preparationTime: freezed == preparationTime
            ? _value.preparationTime
            : preparationTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        calories: freezed == calories
            ? _value.calories
            : calories // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemRequestImpl extends _MenuItemRequest {
  const _$MenuItemRequestImpl({
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'description') this.description,
    @JsonKey(name: 'price') required this.price,
    @JsonKey(name: 'originalPrice') this.originalPrice,
    @JsonKey(name: 'categoryId') required this.categoryId,
    @JsonKey(name: 'imageUrl') this.imageUrl,
    @JsonKey(name: 'isAvailable') this.isAvailable = true,
    @JsonKey(name: 'isRecommended') this.isRecommended = false,
    @JsonKey(name: 'sortOrder') this.sortOrder = 0,
    @JsonKey(name: 'nutritionInfo') this.nutritionInfo,
    @JsonKey(name: 'allergenInfo') this.allergenInfo,
    @JsonKey(name: 'spiceLevel') this.spiceLevel,
    @JsonKey(name: 'preparationTime') this.preparationTime,
    @JsonKey(name: 'calories') this.calories,
  }) : super._();

  factory _$MenuItemRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemRequestImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'price')
  final double price;
  @override
  @JsonKey(name: 'originalPrice')
  final double? originalPrice;
  @override
  @JsonKey(name: 'categoryId')
  final int categoryId;
  @override
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  @override
  @JsonKey(name: 'isAvailable')
  final bool isAvailable;
  @override
  @JsonKey(name: 'isRecommended')
  final bool isRecommended;
  @override
  @JsonKey(name: 'sortOrder')
  final int sortOrder;
  @override
  @JsonKey(name: 'nutritionInfo')
  final String? nutritionInfo;
  @override
  @JsonKey(name: 'allergenInfo')
  final String? allergenInfo;
  @override
  @JsonKey(name: 'spiceLevel')
  final String? spiceLevel;
  @override
  @JsonKey(name: 'preparationTime')
  final int? preparationTime;
  @override
  @JsonKey(name: 'calories')
  final int? calories;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.nutritionInfo, nutritionInfo) ||
                other.nutritionInfo == nutritionInfo) &&
            (identical(other.allergenInfo, allergenInfo) ||
                other.allergenInfo == allergenInfo) &&
            (identical(other.spiceLevel, spiceLevel) ||
                other.spiceLevel == spiceLevel) &&
            (identical(other.preparationTime, preparationTime) ||
                other.preparationTime == preparationTime) &&
            (identical(other.calories, calories) ||
                other.calories == calories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    price,
    originalPrice,
    categoryId,
    imageUrl,
    isAvailable,
    isRecommended,
    sortOrder,
    nutritionInfo,
    allergenInfo,
    spiceLevel,
    preparationTime,
    calories,
  );

  /// Create a copy of MenuItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemRequestImplCopyWith<_$MenuItemRequestImpl> get copyWith =>
      __$$MenuItemRequestImplCopyWithImpl<_$MenuItemRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemRequestImplToJson(this);
  }
}

abstract class _MenuItemRequest extends MenuItemRequest {
  const factory _MenuItemRequest({
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'description') final String? description,
    @JsonKey(name: 'price') required final double price,
    @JsonKey(name: 'originalPrice') final double? originalPrice,
    @JsonKey(name: 'categoryId') required final int categoryId,
    @JsonKey(name: 'imageUrl') final String? imageUrl,
    @JsonKey(name: 'isAvailable') final bool isAvailable,
    @JsonKey(name: 'isRecommended') final bool isRecommended,
    @JsonKey(name: 'sortOrder') final int sortOrder,
    @JsonKey(name: 'nutritionInfo') final String? nutritionInfo,
    @JsonKey(name: 'allergenInfo') final String? allergenInfo,
    @JsonKey(name: 'spiceLevel') final String? spiceLevel,
    @JsonKey(name: 'preparationTime') final int? preparationTime,
    @JsonKey(name: 'calories') final int? calories,
  }) = _$MenuItemRequestImpl;
  const _MenuItemRequest._() : super._();

  factory _MenuItemRequest.fromJson(Map<String, dynamic> json) =
      _$MenuItemRequestImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'price')
  double get price;
  @override
  @JsonKey(name: 'originalPrice')
  double? get originalPrice;
  @override
  @JsonKey(name: 'categoryId')
  int get categoryId;
  @override
  @JsonKey(name: 'imageUrl')
  String? get imageUrl;
  @override
  @JsonKey(name: 'isAvailable')
  bool get isAvailable;
  @override
  @JsonKey(name: 'isRecommended')
  bool get isRecommended;
  @override
  @JsonKey(name: 'sortOrder')
  int get sortOrder;
  @override
  @JsonKey(name: 'nutritionInfo')
  String? get nutritionInfo;
  @override
  @JsonKey(name: 'allergenInfo')
  String? get allergenInfo;
  @override
  @JsonKey(name: 'spiceLevel')
  String? get spiceLevel;
  @override
  @JsonKey(name: 'preparationTime')
  int? get preparationTime;
  @override
  @JsonKey(name: 'calories')
  int? get calories;

  /// Create a copy of MenuItemRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemRequestImplCopyWith<_$MenuItemRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
