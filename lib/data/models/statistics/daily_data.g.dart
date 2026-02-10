// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DailyDataImpl _$$DailyDataImplFromJson(Map<String, dynamic> json) =>
    _$DailyDataImpl(
      date: json['date'] as String,
      revenue: (json['revenue'] as num).toDouble(),
      orderCount: (json['orderCount'] as num).toInt(),
    );

Map<String, dynamic> _$$DailyDataImplToJson(_$DailyDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'revenue': instance.revenue,
      'orderCount': instance.orderCount,
    };
