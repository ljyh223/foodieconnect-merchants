import 'package:json_annotation/json_annotation.dart';

// 生成代码指令
part 'chat_room_model.g.dart';

/// 聊天室模型
@JsonSerializable()
class ChatRoomModel {
  /// 聊天室ID
  final int? id;

  /// 餐厅ID
  final int? restaurantId;

  /// 聊天室名称
  final String? name;

  /// 聊天室描述
  final String? description;

  /// 验证代码
  final String? verificationCode;

  /// 创建时间
  final DateTime? createdAt;

  /// 更新时间
  final DateTime? updatedAt;

  /// 构造函数
  ChatRoomModel({
    this.id,
    this.restaurantId,
    this.name,
    this.description,
    this.verificationCode,
    this.createdAt,
    this.updatedAt,
  });

  /// 从JSON转换
  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$ChatRoomModelToJson(this);
}
