// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
  id: (json['id'] as num).toInt(),
  restaurantId: (json['restaurantId'] as num).toInt(),
  username: json['username'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String?,
  role: json['role'] as String,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
);

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
  'id': instance.id,
  'restaurantId': instance.restaurantId,
  'username': instance.username,
  'email': instance.email,
  'name': instance.name,
  'phone': instance.phone,
  'role': instance.role,
  'status': instance.status,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
};
