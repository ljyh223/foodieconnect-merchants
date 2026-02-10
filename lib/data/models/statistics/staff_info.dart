import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_info.freezed.dart';
part 'staff_info.g.dart';

@freezed
class StaffInfo with _$StaffInfo {
  const factory StaffInfo({
    @JsonKey(name: 'staffId') required int staffId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'rating') required double rating,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
  }) = _StaffInfo;

  factory StaffInfo.fromJson(Map<String, dynamic> json) =>
      _$StaffInfoFromJson(json);
}
