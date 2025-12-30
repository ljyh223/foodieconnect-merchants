import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums/staff_status_enum.dart';

part 'staff_model.freezed.dart';
part 'staff_model.g.dart';

/// 员工模型
@freezed
class StaffModel with _$StaffModel {
  const StaffModel._();

  const factory StaffModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'restaurantId') required int restaurantId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'position') String? position,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'experience') String? experience,
    @JsonKey(name: 'rating') double? rating,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _StaffModel;

  factory StaffModel.fromJson(Map<String, dynamic> json) =>
      _$StaffModelFromJson(json);

  /// 获取StaffStatus枚举
  StaffStatus? get statusEnum => StaffStatus.fromValue(status);

  /// 检查员工是否在线
  bool get isOnline => statusEnum?.isOnline ?? false;

  /// 检查员工是否离线
  bool get isOffline => statusEnum?.isOffline ?? false;

  /// 检查员工是否忙碌
  bool get isBusy => statusEnum?.isBusy ?? false;

  /// 获取显示名称
  String get displayName => name.trim().isEmpty ? '' : name;

  /// 获取头像URL
  String get displayAvatar => avatarUrl ?? '';
}
