import 'package:freezed_annotation/freezed_annotation.dart';
import 'daily_data.dart';

part 'monthly_stats.freezed.dart';
part 'monthly_stats.g.dart';

@freezed
class MonthlyStats with _$MonthlyStats {
  const factory MonthlyStats({
    @JsonKey(name: 'year') required int year,
    @JsonKey(name: 'month') required int month,
    @JsonKey(name: 'dailyData') required List<DailyData> dailyData,
  }) = _MonthlyStats;

  factory MonthlyStats.fromJson(Map<String, dynamic> json) =>
      _$MonthlyStatsFromJson(json);
}
