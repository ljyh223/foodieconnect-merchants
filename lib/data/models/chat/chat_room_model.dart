import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room_model.freezed.dart';
part 'chat_room_model.g.dart';

/// 聊天室模型
@freezed
class ChatRoomModel with _$ChatRoomModel {
  const factory ChatRoomModel({
    /// 聊天室ID
    int? id,

    /// 餐厅ID
    int? restaurantId,

    /// 聊天室名称
    String? name,

    /// 聊天室描述
    String? description,

    /// 验证代码
    String? verificationCode,

    /// 创建时间
    DateTime? createdAt,

    /// 更新时间
    DateTime? updatedAt,
  }) = _ChatRoomModel;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomModelFromJson(json);
}
