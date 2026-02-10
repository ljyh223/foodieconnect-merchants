import 'package:freezed_annotation/freezed_annotation.dart';
import 'today_stats.dart';
import 'monthly_stats.dart';
import 'staff_ratings.dart';

part 'overview_stats_response.freezed.dart';
part 'overview_stats_response.g.dart';

@freezed
class OverviewStatsResponse with _$OverviewStatsResponse {
  const factory OverviewStatsResponse({
    @JsonKey(name: 'today') required TodayStats today,
    @JsonKey(name: 'monthly') required MonthlyStats monthly,
    @JsonKey(name: 'staffRatings') required StaffRatings staffRatings,
  }) = _OverviewStatsResponse;

  factory OverviewStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$OverviewStatsResponseFromJson(json);
}
