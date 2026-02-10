// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffInfoImpl _$$StaffInfoImplFromJson(Map<String, dynamic> json) =>
    _$StaffInfoImpl(
      staffId: (json['staffId'] as num).toInt(),
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$$StaffInfoImplToJson(_$StaffInfoImpl instance) =>
    <String, dynamic>{
      'staffId': instance.staffId,
      'name': instance.name,
      'rating': instance.rating,
      'avatarUrl': instance.avatarUrl,
    };
