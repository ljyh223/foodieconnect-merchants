import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

/// 聊天室消息模型
@freezed
class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    /// 消息ID
    int? id,

    /// 房间ID
    int? roomId,

    /// 发送者ID
    int? senderId,

    /// 发送者名称
    String? senderName,

    /// 消息内容
    String? content,

    /// 消息类型
    @JsonKey(name: 'messageType') String? type,

    /// 创建时间
    DateTime? createdAt,

    /// 更新时间
    DateTime? updatedAt,

    /// 发送者头像
    String? senderAvatar,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}
