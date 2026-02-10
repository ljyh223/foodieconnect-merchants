// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_stats_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OverviewStatsResponseImpl _$$OverviewStatsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OverviewStatsResponseImpl(
  today: TodayStats.fromJson(json['today'] as Map<String, dynamic>),
  monthly: MonthlyStats.fromJson(json['monthly'] as Map<String, dynamic>),
  staffRatings: StaffRatings.fromJson(
    json['staffRatings'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$OverviewStatsResponseImplToJson(
  _$OverviewStatsResponseImpl instance,
) => <String, dynamic>{
  'today': instance.today,
  'monthly': instance.monthly,
  'staffRatings': instance.staffRatings,
};
