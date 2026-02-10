import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_stats.freezed.dart';
part 'today_stats.g.dart';

@freezed
class TodayStats with _$TodayStats {
  const factory TodayStats({
    @JsonKey(name: 'revenue') required double revenue,
    @JsonKey(name: 'dishAverageRating') required double dishAverageRating,
    @JsonKey(name: 'staffAverageRating') required double staffAverageRating,
  }) = _TodayStats;

  factory TodayStats.fromJson(Map<String, dynamic> json) =>
      _$TodayStatsFromJson(json);
}
