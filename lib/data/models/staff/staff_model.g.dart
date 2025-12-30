// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffModelImpl _$$StaffModelImplFromJson(Map<String, dynamic> json) =>
    _$StaffModelImpl(
      id: (json['id'] as num).toInt(),
      restaurantId: (json['restaurantId'] as num).toInt(),
      name: json['name'] as String,
      position: json['position'] as String?,
      status: json['status'] as String,
      experience: json['experience'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      avatarUrl: json['avatarUrl'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$StaffModelImplToJson(_$StaffModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'position': instance.position,
      'status': instance.status,
      'experience': instance.experience,
      'rating': instance.rating,
      'avatarUrl': instance.avatarUrl,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
