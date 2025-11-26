// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) =>
    MenuItemModel(
      id: (json['id'] as num).toInt(),
      restaurantId: (json['restaurantId'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      imageUrl: json['imageUrl'] as String?,
      isAvailable: json['isAvailable'] as bool,
      isRecommended: json['isRecommended'] as bool,
      sortOrder: (json['sortOrder'] as num).toInt(),
      nutritionInfo: json['nutritionInfo'] as String?,
      allergenInfo: json['allergenInfo'] as String?,
      spiceLevel: json['spiceLevel'] as String?,
      preparationTime: (json['preparationTime'] as num?)?.toInt(),
      calories: (json['calories'] as num?)?.toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$MenuItemModelToJson(MenuItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'originalPrice': instance.originalPrice,
      'imageUrl': instance.imageUrl,
      'isAvailable': instance.isAvailable,
      'isRecommended': instance.isRecommended,
      'sortOrder': instance.sortOrder,
      'nutritionInfo': instance.nutritionInfo,
      'allergenInfo': instance.allergenInfo,
      'spiceLevel': instance.spiceLevel,
      'preparationTime': instance.preparationTime,
      'calories': instance.calories,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
