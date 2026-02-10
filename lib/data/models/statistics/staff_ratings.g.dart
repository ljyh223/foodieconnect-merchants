// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffRatingsImpl _$$StaffRatingsImplFromJson(Map<String, dynamic> json) =>
    _$StaffRatingsImpl(
      highest: json['highest'] == null
          ? null
          : StaffInfo.fromJson(json['highest'] as Map<String, dynamic>),
      lowest: json['lowest'] == null
          ? null
          : StaffInfo.fromJson(json['lowest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StaffRatingsImplToJson(_$StaffRatingsImpl instance) =>
    <String, dynamic>{'highest': instance.highest, 'lowest': instance.lowest};
