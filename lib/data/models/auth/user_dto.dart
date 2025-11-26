import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'user_dto.g.dart';

/// 用户数据传输对象（基于Merchant模型）
@JsonSerializable()
class UserDTO extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  
  @JsonKey(name: 'restaurantId')
  final int restaurantId;
  
  @JsonKey(name: 'username')
  final String username;
  
  @JsonKey(name: 'email')
  final String email;
  
  @JsonKey(name: 'name')
  final String name;
  
  @JsonKey(name: 'phone')
  final String? phone;
  
  @JsonKey(name: 'role')
  final String role;
  
  @JsonKey(name: 'status')
  final String status;
  
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  
  @JsonKey(name: 'lastLoginAt')
  final DateTime? lastLoginAt;

  const UserDTO({
    required this.id,
    required this.restaurantId,
    required this.username,
    required this.email,
    required this.name,
    this.phone,
    required this.role,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.lastLoginAt,
  });

  /// 从JSON创建实例
  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  /// 创建副本
  UserDTO copyWith({
    int? id,
    int? restaurantId,
    String? username,
    String? email,
    String? name,
    String? phone,
    String? role,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastLoginAt,
  }) {
    return UserDTO(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      username: username ?? this.username,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }

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
  List<Object?> get props => [
        id,
        restaurantId,
        username,
        email,
        name,
        phone,
        role,
        status,
        createdAt,
        updatedAt,
        lastLoginAt,
      ];

  @override
  String toString() {
    return 'UserDTO(id: $id, restaurantId: $restaurantId, username: $username, email: $email, name: $name, role: $role, status: $status)';
  }
}