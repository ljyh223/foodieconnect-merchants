// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DishReviewModelImpl _$$DishReviewModelImplFromJson(
  Map<String, dynamic> json,
) => _$DishReviewModelImpl(
  id: (json['id'] as num).toInt(),
  menuItemId: (json['menuItemId'] as num).toInt(),
  itemName: json['itemName'] as String,
  itemPrice: (json['itemPrice'] as num).toDouble(),
  itemImage: json['itemImage'] as String?,
  userId: (json['userId'] as num).toInt(),
  userName: json['userName'] as String,
  userAvatar: json['userAvatar'] as String?,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String?,
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$$DishReviewModelImplToJson(
  _$DishReviewModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'menuItemId': instance.menuItemId,
  'itemName': instance.itemName,
  'itemPrice': instance.itemPrice,
  'itemImage': instance.itemImage,
  'userId': instance.userId,
  'userName': instance.userName,
  'userAvatar': instance.userAvatar,
  'rating': instance.rating,
  'comment': instance.comment,
  'images': instance.images,
  'createdAt': instance.createdAt,
};
