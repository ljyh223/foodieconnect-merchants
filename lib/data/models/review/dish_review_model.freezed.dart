// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DishReviewModel _$DishReviewModelFromJson(Map<String, dynamic> json) {
  return _DishReviewModel.fromJson(json);
}

/// @nodoc
mixin _$DishReviewModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'menuItemId')
  int get menuItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemName')
  String get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemPrice')
  double get itemPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemImage')
  String? get itemImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'userId')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'userAvatar')
  String? get userAvatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  int get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment')
  String? get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<String> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this DishReviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DishReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DishReviewModelCopyWith<DishReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishReviewModelCopyWith<$Res> {
  factory $DishReviewModelCopyWith(
    DishReviewModel value,
    $Res Function(DishReviewModel) then,
  ) = _$DishReviewModelCopyWithImpl<$Res, DishReviewModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'menuItemId') int menuItemId,
    @JsonKey(name: 'itemName') String itemName,
    @JsonKey(name: 'itemPrice') double itemPrice,
    @JsonKey(name: 'itemImage') String? itemImage,
    @JsonKey(name: 'userId') int userId,
    @JsonKey(name: 'userName') String userName,
    @JsonKey(name: 'userAvatar') String? userAvatar,
    @JsonKey(name: 'rating') int rating,
    @JsonKey(name: 'comment') String? comment,
    @JsonKey(name: 'images') List<String> images,
    @JsonKey(name: 'createdAt') String createdAt,
  });
}

/// @nodoc
class _$DishReviewModelCopyWithImpl<$Res, $Val extends DishReviewModel>
    implements $DishReviewModelCopyWith<$Res> {
  _$DishReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DishReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItemId = null,
    Object? itemName = null,
    Object? itemPrice = null,
    Object? itemImage = freezed,
    Object? userId = null,
    Object? userName = null,
    Object? userAvatar = freezed,
    Object? rating = null,
    Object? comment = freezed,
    Object? images = null,
    Object? createdAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            menuItemId: null == menuItemId
                ? _value.menuItemId
                : menuItemId // ignore: cast_nullable_to_non_nullable
                      as int,
            itemName: null == itemName
                ? _value.itemName
                : itemName // ignore: cast_nullable_to_non_nullable
                      as String,
            itemPrice: null == itemPrice
                ? _value.itemPrice
                : itemPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            itemImage: freezed == itemImage
                ? _value.itemImage
                : itemImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            userName: null == userName
                ? _value.userName
                : userName // ignore: cast_nullable_to_non_nullable
                      as String,
            userAvatar: freezed == userAvatar
                ? _value.userAvatar
                : userAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as int,
            comment: freezed == comment
                ? _value.comment
                : comment // ignore: cast_nullable_to_non_nullable
                      as String?,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>,
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
abstract class _$$DishReviewModelImplCopyWith<$Res>
    implements $DishReviewModelCopyWith<$Res> {
  factory _$$DishReviewModelImplCopyWith(
    _$DishReviewModelImpl value,
    $Res Function(_$DishReviewModelImpl) then,
  ) = __$$DishReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'menuItemId') int menuItemId,
    @JsonKey(name: 'itemName') String itemName,
    @JsonKey(name: 'itemPrice') double itemPrice,
    @JsonKey(name: 'itemImage') String? itemImage,
    @JsonKey(name: 'userId') int userId,
    @JsonKey(name: 'userName') String userName,
    @JsonKey(name: 'userAvatar') String? userAvatar,
    @JsonKey(name: 'rating') int rating,
    @JsonKey(name: 'comment') String? comment,
    @JsonKey(name: 'images') List<String> images,
    @JsonKey(name: 'createdAt') String createdAt,
  });
}

/// @nodoc
class __$$DishReviewModelImplCopyWithImpl<$Res>
    extends _$DishReviewModelCopyWithImpl<$Res, _$DishReviewModelImpl>
    implements _$$DishReviewModelImplCopyWith<$Res> {
  __$$DishReviewModelImplCopyWithImpl(
    _$DishReviewModelImpl _value,
    $Res Function(_$DishReviewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DishReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? menuItemId = null,
    Object? itemName = null,
    Object? itemPrice = null,
    Object? itemImage = freezed,
    Object? userId = null,
    Object? userName = null,
    Object? userAvatar = freezed,
    Object? rating = null,
    Object? comment = freezed,
    Object? images = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$DishReviewModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        menuItemId: null == menuItemId
            ? _value.menuItemId
            : menuItemId // ignore: cast_nullable_to_non_nullable
                  as int,
        itemName: null == itemName
            ? _value.itemName
            : itemName // ignore: cast_nullable_to_non_nullable
                  as String,
        itemPrice: null == itemPrice
            ? _value.itemPrice
            : itemPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        itemImage: freezed == itemImage
            ? _value.itemImage
            : itemImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        userName: null == userName
            ? _value.userName
            : userName // ignore: cast_nullable_to_non_nullable
                  as String,
        userAvatar: freezed == userAvatar
            ? _value.userAvatar
            : userAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as int,
        comment: freezed == comment
            ? _value.comment
            : comment // ignore: cast_nullable_to_non_nullable
                  as String?,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>,
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
class _$DishReviewModelImpl implements _DishReviewModel {
  const _$DishReviewModelImpl({
    @JsonKey(name: 'id') required this.id,
    @JsonKey(name: 'menuItemId') required this.menuItemId,
    @JsonKey(name: 'itemName') required this.itemName,
    @JsonKey(name: 'itemPrice') required this.itemPrice,
    @JsonKey(name: 'itemImage') this.itemImage,
    @JsonKey(name: 'userId') required this.userId,
    @JsonKey(name: 'userName') required this.userName,
    @JsonKey(name: 'userAvatar') this.userAvatar,
    @JsonKey(name: 'rating') required this.rating,
    @JsonKey(name: 'comment') this.comment,
    @JsonKey(name: 'images') required final List<String> images,
    @JsonKey(name: 'createdAt') required this.createdAt,
  }) : _images = images;

  factory _$DishReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DishReviewModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'menuItemId')
  final int menuItemId;
  @override
  @JsonKey(name: 'itemName')
  final String itemName;
  @override
  @JsonKey(name: 'itemPrice')
  final double itemPrice;
  @override
  @JsonKey(name: 'itemImage')
  final String? itemImage;
  @override
  @JsonKey(name: 'userId')
  final int userId;
  @override
  @JsonKey(name: 'userName')
  final String userName;
  @override
  @JsonKey(name: 'userAvatar')
  final String? userAvatar;
  @override
  @JsonKey(name: 'rating')
  final int rating;
  @override
  @JsonKey(name: 'comment')
  final String? comment;
  final List<String> _images;
  @override
  @JsonKey(name: 'images')
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey(name: 'createdAt')
  final String createdAt;

  @override
  String toString() {
    return 'DishReviewModel(id: $id, menuItemId: $menuItemId, itemName: $itemName, itemPrice: $itemPrice, itemImage: $itemImage, userId: $userId, userName: $userName, userAvatar: $userAvatar, rating: $rating, comment: $comment, images: $images, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishReviewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.menuItemId, menuItemId) ||
                other.menuItemId == menuItemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice) &&
            (identical(other.itemImage, itemImage) ||
                other.itemImage == itemImage) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userAvatar, userAvatar) ||
                other.userAvatar == userAvatar) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    menuItemId,
    itemName,
    itemPrice,
    itemImage,
    userId,
    userName,
    userAvatar,
    rating,
    comment,
    const DeepCollectionEquality().hash(_images),
    createdAt,
  );

  /// Create a copy of DishReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DishReviewModelImplCopyWith<_$DishReviewModelImpl> get copyWith =>
      __$$DishReviewModelImplCopyWithImpl<_$DishReviewModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DishReviewModelImplToJson(this);
  }
}

abstract class _DishReviewModel implements DishReviewModel {
  const factory _DishReviewModel({
    @JsonKey(name: 'id') required final int id,
    @JsonKey(name: 'menuItemId') required final int menuItemId,
    @JsonKey(name: 'itemName') required final String itemName,
    @JsonKey(name: 'itemPrice') required final double itemPrice,
    @JsonKey(name: 'itemImage') final String? itemImage,
    @JsonKey(name: 'userId') required final int userId,
    @JsonKey(name: 'userName') required final String userName,
    @JsonKey(name: 'userAvatar') final String? userAvatar,
    @JsonKey(name: 'rating') required final int rating,
    @JsonKey(name: 'comment') final String? comment,
    @JsonKey(name: 'images') required final List<String> images,
    @JsonKey(name: 'createdAt') required final String createdAt,
  }) = _$DishReviewModelImpl;

  factory _DishReviewModel.fromJson(Map<String, dynamic> json) =
      _$DishReviewModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'menuItemId')
  int get menuItemId;
  @override
  @JsonKey(name: 'itemName')
  String get itemName;
  @override
  @JsonKey(name: 'itemPrice')
  double get itemPrice;
  @override
  @JsonKey(name: 'itemImage')
  String? get itemImage;
  @override
  @JsonKey(name: 'userId')
  int get userId;
  @override
  @JsonKey(name: 'userName')
  String get userName;
  @override
  @JsonKey(name: 'userAvatar')
  String? get userAvatar;
  @override
  @JsonKey(name: 'rating')
  int get rating;
  @override
  @JsonKey(name: 'comment')
  String? get comment;
  @override
  @JsonKey(name: 'images')
  List<String> get images;
  @override
  @JsonKey(name: 'createdAt')
  String get createdAt;

  /// Create a copy of DishReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DishReviewModelImplCopyWith<_$DishReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
