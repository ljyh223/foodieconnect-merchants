// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuItemRequestImpl _$$MenuItemRequestImplFromJson(
  Map<String, dynamic> json,
) => _$MenuItemRequestImpl(
  name: json['name'] as String,
  description: json['description'] as String?,
  price: (json['price'] as num).toDouble(),
  originalPrice: (json['originalPrice'] as num?)?.toDouble(),
  categoryId: (json['categoryId'] as num).toInt(),
  imageUrl: json['imageUrl'] as String?,
  isAvailable: json['isAvailable'] as bool? ?? true,
  isRecommended: json['isRecommended'] as bool? ?? false,
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  nutritionInfo: json['nutritionInfo'] as String?,
  allergenInfo: json['allergenInfo'] as String?,
  spiceLevel: json['spiceLevel'] as String?,
  preparationTime: (json['preparationTime'] as num?)?.toInt(),
  calories: (json['calories'] as num?)?.toInt(),
);

Map<String, dynamic> _$$MenuItemRequestImplToJson(
  _$MenuItemRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'originalPrice': instance.originalPrice,
  'categoryId': instance.categoryId,
  'imageUrl': instance.imageUrl,
  'isAvailable': instance.isAvailable,
  'isRecommended': instance.isRecommended,
  'sortOrder': instance.sortOrder,
  'nutritionInfo': instance.nutritionInfo,
  'allergenInfo': instance.allergenInfo,
  'spiceLevel': instance.spiceLevel,
  'preparationTime': instance.preparationTime,
  'calories': instance.calories,
};
