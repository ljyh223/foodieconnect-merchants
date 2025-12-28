import 'package:flutter/material.dart';

import '../../data/models/chat/chat_message_model.dart';
import '../../data/models/chat/chat_room_model.dart';
import '../../data/services/chat_service.dart';
import '../../core/utils/logger.dart';

/// 聊天室状态管理Provider
class ChatProvider extends ChangeNotifier {
  final ChatService _chatService = ChatService();
  
  // 聊天室信息
  ChatRoomModel? _chatRoom;
  
  // 消息列表
  List<ChatMessageModel> _messages = [];
  
  // 连接状态
  bool _isConnected = false;
  
  // 加载状态
  bool _isLoading = false;
  
  // 错误信息
  String? _errorMessage;
  
  // 获取聊天室信息
  ChatRoomModel? get chatRoom => _chatRoom;
  
  // 获取消息列表
  List<ChatMessageModel> get messages => _messages;
  
  // 获取连接状态
  bool get isConnected => _isConnected;
  
  // 获取加载状态
  bool get isLoading => _isLoading;
  
  // 获取错误信息
  String? get errorMessage => _errorMessage;
  
  // 初始化方法
  Future<void> init() async {
    AppLogger.debug('ChatProvider: 初始化');
    _chatService.init();
    
    // 监听连接状态变化
    _chatService.connectionStatusStream.listen((status) {
      _isConnected = status;
      notifyListeners();
    });
    
    // 监听消息变化
    _chatService.messagesStream.listen((messages) {
      _messages = messages;
      notifyListeners();
    });
  }
  
  // 加载聊天室信息
  Future<void> loadChatRoom() async {
    _setLoading(true);
    try {
      final chatRoom = await _chatService.getChatRoomInfo();
      if (chatRoom != null) {
        _chatRoom = chatRoom;
        _errorMessage = null;
        
        // 如果获取到聊天室信息，自动连接到聊天室
        await connectToChatRoom(chatRoom.id!);
      } else {
        _errorMessage = '获取聊天室信息失败';
      }
    } catch (e) {
      _errorMessage = '加载聊天室信息时出错: $e';
      AppLogger.error('ChatProvider: 加载聊天室信息失败', error: e);
    } finally {
      _setLoading(false);
    }
  }
  
  // 连接到聊天室
  Future<void> connectToChatRoom(int roomId) async {
    _setLoading(true);
    try {
      await _chatService.connectToChatRoom(roomId);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = '连接聊天室失败: $e';
      AppLogger.error('ChatProvider: 连接聊天室失败', error: e);
    } finally {
      _setLoading(false);
    }
  }
  
  // 断开连接
  Future<void> disconnect() async {
    _setLoading(true);
    try {
      await _chatService.disconnect();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = '断开连接失败: $e';
      AppLogger.error('ChatProvider: 断开连接失败', error: e);
    } finally {
      _setLoading(false);
    }
  }
  
  // 刷新聊天室信息
  Future<void> refreshChatRoom() async {
    await loadChatRoom();
  }
  
  // 设置加载状态
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
  
  // 重置错误信息
  void resetError() {
    _errorMessage = null;
    notifyListeners();
  }
  
  @override
  void dispose() {
    _chatService.dispose();
    super.dispose();
  }
}
