// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    RestaurantModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      description: json['description'] as String?,
      address: json['address'] as String,
      phone: json['phone'] as String,
      hours: json['hours'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      isOpen: json['isOpen'] as bool?,
      avatar: json['avatar'] as String?,
      imageUrl: json['imageUrl'] as String?,
      distance: json['distance'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'address': instance.address,
      'phone': instance.phone,
      'hours': instance.hours,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'isOpen': instance.isOpen,
      'avatar': instance.avatar,
      'imageUrl': instance.imageUrl,
      'distance': instance.distance,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
