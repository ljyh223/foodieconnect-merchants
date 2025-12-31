// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuCategoryModelImpl _$$MenuCategoryModelImplFromJson(
  Map<String, dynamic> json,
) => _$MenuCategoryModelImpl(
  id: (json['id'] as num).toInt(),
  restaurantId: (json['restaurantId'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  sortOrder: (json['sortOrder'] as num).toInt(),
  isActive: json['isActive'] as bool,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$MenuCategoryModelImplToJson(
  _$MenuCategoryModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'restaurantId': instance.restaurantId,
  'name': instance.name,
  'description': instance.description,
  'sortOrder': instance.sortOrder,
  'isActive': instance.isActive,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
