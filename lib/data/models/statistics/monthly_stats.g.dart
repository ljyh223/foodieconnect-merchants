// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monthly_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MonthlyStatsImpl _$$MonthlyStatsImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyStatsImpl(
      year: (json['year'] as num).toInt(),
      month: (json['month'] as num).toInt(),
      dailyData: (json['dailyData'] as List<dynamic>)
          .map((e) => DailyData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MonthlyStatsImplToJson(_$MonthlyStatsImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'dailyData': instance.dailyData,
    };
