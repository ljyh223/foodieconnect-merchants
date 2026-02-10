// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodayStatsImpl _$$TodayStatsImplFromJson(Map<String, dynamic> json) =>
    _$TodayStatsImpl(
      revenue: (json['revenue'] as num).toDouble(),
      dishAverageRating: (json['dishAverageRating'] as num).toDouble(),
      staffAverageRating: (json['staffAverageRating'] as num).toDouble(),
    );

Map<String, dynamic> _$$TodayStatsImplToJson(_$TodayStatsImpl instance) =>
    <String, dynamic>{
      'revenue': instance.revenue,
      'dishAverageRating': instance.dishAverageRating,
      'staffAverageRating': instance.staffAverageRating,
    };
