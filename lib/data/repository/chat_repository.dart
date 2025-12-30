import '../api/chat_api.dart';
import '../models/chat/chat_message_model.dart';
import '../models/chat/chat_room_model.dart';
import '../models/common/api_error.dart';
import 'package:dio/dio.dart';

/// 聊天室Repository
class ChatRepository {
  /// 获取聊天室信息
  Future<ChatRoomModel> fetchChatRoomInfo() async {
    try {
      return await ChatApi.getChatRoomInfo();
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 获取历史消息
  Future<List<ChatMessageModel>> fetchHistoryMessages() async {
    try {
      return await ChatApi.getHistoryMessages();
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }
}
