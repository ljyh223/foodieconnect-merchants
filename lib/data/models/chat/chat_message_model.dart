import 'package:json_annotation/json_annotation.dart';

// 生成代码指令
part 'chat_message_model.g.dart';

/// 聊天室消息模型
@JsonSerializable()
class ChatMessageModel {
  /// 消息ID
  final String? id;

  /// 房间ID
  final int? roomId;

  /// 发送者ID
  final String? senderId;

  /// 发送者名称
  final String? senderName;

  /// 消息内容
  final String? content;

  /// 消息类型
  final String? type;

  /// 创建时间
  final DateTime? createdAt;

  /// 构造函数
  ChatMessageModel({
    this.id,
    this.roomId,
    this.senderId,
    this.senderName,
    this.content,
    this.type,
    this.createdAt,
  });

  /// 从JSON转换
  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
}
