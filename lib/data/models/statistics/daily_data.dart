import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_data.freezed.dart';
part 'daily_data.g.dart';

@freezed
class DailyData with _$DailyData {
  const factory DailyData({
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'revenue') required double revenue,
    @JsonKey(name: 'orderCount') required int orderCount,
  }) = _DailyData;

  factory DailyData.fromJson(Map<String, dynamic> json) =>
      _$DailyDataFromJson(json);
}
