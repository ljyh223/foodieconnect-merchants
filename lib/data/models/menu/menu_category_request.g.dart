// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategoryRequest _$MenuCategoryRequestFromJson(Map<String, dynamic> json) =>
    MenuCategoryRequest(
      name: json['name'] as String,
      description: json['description'] as String?,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$MenuCategoryRequestToJson(
  MenuCategoryRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'sortOrder': instance.sortOrder,
  'isActive': instance.isActive,
};
