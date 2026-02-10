import 'package:freezed_annotation/freezed_annotation.dart';
import 'staff_info.dart';

part 'staff_ratings.freezed.dart';
part 'staff_ratings.g.dart';

@freezed
class StaffRatings with _$StaffRatings {
  const factory StaffRatings({
    @JsonKey(name: 'highest') required StaffInfo? highest,
    @JsonKey(name: 'lowest') required StaffInfo? lowest,
  }) = _StaffRatings;

  factory StaffRatings.fromJson(Map<String, dynamic> json) =>
      _$StaffRatingsFromJson(json);
}
