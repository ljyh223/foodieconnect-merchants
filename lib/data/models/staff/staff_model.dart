import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'staff_model.g.dart';

/// 员工模型
@JsonSerializable()
class StaffModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  
  @JsonKey(name: 'restaurantId')
  final int restaurantId;
  
  @JsonKey(name: 'name')
  final String name;
  
  @JsonKey(name: 'position')
  final String? position;
  
  @JsonKey(name: 'status')
  final String status;
  
  @JsonKey(name: 'experience')
  final String? experience;
  
  @JsonKey(name: 'rating')
  final double? rating;
  
  @JsonKey(name: 'avatarUrl')
  final String? avatarUrl;
  
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  const StaffModel({
    required this.id,
    required this.restaurantId,
    required this.name,
    this.position,
    required this.status,
    this.experience,
    this.rating,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt,
  });

  /// 从JSON创建实例
  factory StaffModel.fromJson(Map<String, dynamic> json) =>
      _$StaffModelFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$StaffModelToJson(this);

  /// 创建副本
  StaffModel copyWith({
    int? id,
    int? restaurantId,
    String? name,
    String? position,
    String? status,
    String? experience,
    double? rating,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StaffModel(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      name: name ?? this.name,
      position: position ?? this.position,
      status: status ?? this.status,
      experience: experience ?? this.experience,
      rating: rating ?? this.rating,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// 检查员工是否在线
  bool get isOnline => status.toUpperCase() == 'ONLINE';

  /// 检查员工是否离线
  bool get isOffline => status.toUpperCase() == 'OFFLINE';

  /// 检查员工是否忙碌
  bool get isBusy => status.toUpperCase() == 'BUSY';

  /// 获取状态显示文本
  String get statusDisplay {
    switch (status.toUpperCase()) {
      case 'ONLINE':
        return '在线';
      case 'OFFLINE':
        return '离线';
      case 'BUSY':
        return '忙碌';
      default:
        return '未知';
    }
  }

  /// 获取状态颜色
  String get statusColor {
    switch (status.toUpperCase()) {
      case 'ONLINE':
        return '#4CAF50'; // 绿色
      case 'OFFLINE':
        return '#9E9E9E'; // 灰色
      case 'BUSY':
        return '#FF9800'; // 橙色
      default:
        return '#9E9E9E'; // 灰色
    }
  }

  /// 获取评分显示文本
  String get ratingDisplay {
    if (rating == null) return '暂无评分';
    return '${rating!.toStringAsFixed(1)} ⭐';
  }

  /// 获取职位显示文本
  String get positionDisplay {
    if (position == null || position!.isEmpty) return '员工';
    return position!;
  }

  /// 获取经验显示文本
  String get experienceDisplay {
    if (experience == null || experience!.isEmpty) return '经验未知';
    return experience!;
  }

  /// 获取显示名称
  String get displayName => name.trim().isEmpty ? '未知员工' : name;

  /// 获取头像URL，如果没有则返回默认头像
  String get displayAvatar => avatarUrl ?? '';

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        position,
        status,
        experience,
        rating,
        avatarUrl,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'StaffModel(id: $id, name: $name, position: $position, status: $status, rating: $rating)';
  }
}