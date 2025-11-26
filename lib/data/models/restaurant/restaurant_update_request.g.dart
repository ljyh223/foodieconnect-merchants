// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantUpdateRequest _$RestaurantUpdateRequestFromJson(
  Map<String, dynamic> json,
) => RestaurantUpdateRequest(
  name: json['name'] as String,
  type: json['type'] as String,
  description: json['description'] as String?,
  address: json['address'] as String,
  phone: json['phone'] as String,
  hours: json['hours'] as String?,
  imageUrl: json['imageUrl'] as String?,
  isOpen: json['isOpen'] as bool?,
);

Map<String, dynamic> _$RestaurantUpdateRequestToJson(
  RestaurantUpdateRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'type': instance.type,
  'description': instance.description,
  'address': instance.address,
  'phone': instance.phone,
  'hours': instance.hours,
  'imageUrl': instance.imageUrl,
  'isOpen': instance.isOpen,
};
