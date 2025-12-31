import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

/// 用户数据传输对象（基于Merchant模型）
@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();

  const factory UserDTO({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'restaurantId') required int restaurantId,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    @JsonKey(name: 'lastLoginAt') DateTime? lastLoginAt,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  /// 检查用户是否活跃
  bool get isActive => status.toUpperCase() == 'ACTIVE';

  /// 检查用户是否被禁用
  bool get isBanned => status.toUpperCase() == 'BANNED';

  /// 检查用户是否非活跃
  bool get isInactive => status.toUpperCase() == 'INACTIVE';

  /// 获取用户状态显示文本
  String get statusDisplay {
    switch (status.toUpperCase()) {
      case 'ACTIVE':
        return '活跃';
      case 'INACTIVE':
        return '非活跃';
      case 'BANNED':
        return '已禁用';
      default:
        return '未知';
    }
  }

  /// 获取用户显示名称（优先使用name，其次使用username）
  String get displayName => name.isNotEmpty ? name : username;

  /// 获取用户显示名称（优先使用name，其次使用邮箱前缀）
  String get displayOrEmail {
    if (name.isNotEmpty) return name;
    return email.split('@').first;
  }

  @override
  String toString() {
    return 'UserDTO(id: $id, restaurantId: $restaurantId, username: $username, email: $email, name: $name, role: $role, status: $status)';
  }
}