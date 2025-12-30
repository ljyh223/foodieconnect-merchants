import '../models/chat/chat_message_model.dart';
import '../models/chat/chat_room_model.dart';
import '../network/dio_client.dart';

/// 聊天室API服务
class ChatApi {
  /// 获取聊天室信息
  static Future<ChatRoomModel> getChatRoomInfo() async {
    final response = await DioClient.dio.get<Map<String, dynamic>>(
      '/merchant/chat-rooms',
    );
    final data = response.data!;
    return ChatRoomModel.fromJson(data['data']);
  }

  /// 获取历史消息
  static Future<List<ChatMessageModel>> getHistoryMessages() async {
    final response = await DioClient.dio.get<Map<String, dynamic>>(
      '/merchant/chat-rooms/messages',
    );
    final data = response.data!;

    // 直接解析列表，不使用分页响应
    final messageList = data['data'] as List;
    return messageList
        .map(
          (record) => ChatMessageModel.fromJson(record as Map<String, dynamic>),
        )
        .toList();
  }
}
