import '../models/chat/chat_message_model.dart';
import '../models/chat/chat_room_model.dart';
import '../services/api_service.dart';

/// 聊天室API服务
class ChatApi {
  /// 获取聊天室信息
  static Future<ChatRoomModel> getChatRoomInfo() async {
    final response = await ApiService().get<Map<String, dynamic>>(
      '/merchant/chat-rooms',
    );
    final data = response.data!;
    return ChatRoomModel.fromJson(data['data']);
  }

  /// 获取历史消息
  static Future<List<ChatMessageModel>> getHistoryMessages() async {
    final response = await ApiService().get<Map<String, dynamic>>(
      '/merchant/chat-rooms/messages',
    );
    final data = response.data!;

    // 处理API返回的数据结构
    final messageList = <ChatMessageModel>[];

    // 检查data['data']的类型
    if (data['data'] is List) {
      // 如果直接是列表
      final list = data['data'] as List;
      messageList.addAll(
        list.map(
          (record) => ChatMessageModel.fromJson(record as Map<String, dynamic>),
        ),
      );
    } else if (data['data'] is Map<String, dynamic>) {
      // 如果是Map，可能包含records字段
      final mapData = data['data'] as Map<String, dynamic>;
      if (mapData.containsKey('records') && mapData['records'] is List) {
        final records = mapData['records'] as List;
        messageList.addAll(
          records.map(
            (record) =>
                ChatMessageModel.fromJson(record as Map<String, dynamic>),
          ),
        );
      }
    }

    return messageList;
  }
}
