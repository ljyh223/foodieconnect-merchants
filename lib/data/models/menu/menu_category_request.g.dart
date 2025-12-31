// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MenuCategoryRequestImpl _$$MenuCategoryRequestImplFromJson(
  Map<String, dynamic> json,
) => _$MenuCategoryRequestImpl(
  name: json['name'] as String,
  description: json['description'] as String?,
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  isActive: json['isActive'] as bool? ?? true,
);

Map<String, dynamic> _$$MenuCategoryRequestImplToJson(
  _$MenuCategoryRequestImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'sortOrder': instance.sortOrder,
  'isActive': instance.isActive,
};
