import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../models/chat/chat_message_model.dart';
import '../models/chat/chat_room_model.dart';
import 'api_service.dart';
import '../../core/utils/logger.dart';

/// 聊天室服务类
class ChatService {
  static final ChatService _instance = ChatService._internal();
  factory ChatService() => _instance;
  ChatService._internal();

  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  bool _isConnected = false;
  int? _currentRoomId;

  // 消息流控制器
  final StreamController<List<ChatMessageModel>> _messagesController =
      StreamController<List<ChatMessageModel>>.broadcast();
  final List<ChatMessageModel> _messages = [];

  // 连接状态流控制器
  final StreamController<bool> _connectionStatusController =
      StreamController<bool>.broadcast();

  // 获取消息流
  Stream<List<ChatMessageModel>> get messagesStream =>
      _messagesController.stream;

  // 获取连接状态流
  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;

  // 获取当前连接状态
  bool get isConnected => _isConnected;

  // 初始化服务
  void init() {
    AppLogger.info('ChatService: 初始化完成');
  }

  // 获取聊天室信息
  Future<ChatRoomModel?> getChatRoomInfo() async {
    try {
      final apiService = ApiService();
      final response = await apiService.get('/api/v1/merchant/chat-rooms');

      if (response.data['success'] == true) {
        return ChatRoomModel.fromJson(response.data['data']);
      }
      return null;
    } catch (e) {
      AppLogger.error('ChatService: 获取聊天室信息失败', error: e);
      return null;
    }
  }

  // 连接到聊天室（观察者模式）
  Future<void> connectToChatRoom(int roomId) async {
    try {
      // 如果已经连接到同一个房间，直接返回
      if (_isConnected && _currentRoomId == roomId) {
        AppLogger.info('ChatService: 已经连接到房间 $roomId');
        return;
      }

      // 断开现有连接
      await disconnect();

      // 构建WebSocket URL
      final wsUrl = 'ws://localhost:8080/api/v1/ws/chat-bin/$roomId';
      AppLogger.info('ChatService: 连接到WebSocket URL: $wsUrl');

      // 创建WebSocket连接
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));

      // 监听连接状态
      _isConnected = true;
      _currentRoomId = roomId;
      _connectionStatusController.add(true);

      // 监听消息
      _subscription = _channel!.stream.listen(
        _onMessageReceived,
        onError: _onError,
        onDone: _onDone,
      );

      // 发送加入房间请求
      _sendJoinRoomRequest(roomId);

      AppLogger.info('ChatService: 连接到聊天室 $roomId 成功');
    } catch (e) {
      AppLogger.error('ChatService: 连接到聊天室 $roomId 失败', error: e);
      _isConnected = false;
      _connectionStatusController.add(false);
      rethrow;
    }
  }

  // 断开连接
  Future<void> disconnect() async {
    if (_isConnected) {
      try {
        // 发送离开房间请求
        if (_currentRoomId != null) {
          _sendLeaveRoomRequest(_currentRoomId!);
        }

        // 取消订阅
        _subscription?.cancel();

        // 关闭通道
        await _channel?.sink.close(status.goingAway);

        // 更新状态
        _isConnected = false;
        _currentRoomId = null;
        _connectionStatusController.add(false);

        AppLogger.info('ChatService: 断开连接成功');
      } catch (e) {
        AppLogger.error('ChatService: 断开连接失败', error: e);
      }
    }
  }

  // 发送加入房间请求
  void _sendJoinRoomRequest(int roomId) {
    try {
      // 构建加入房间请求（根据后端协议）
      final joinReq = {
        'type': 'JOIN_ROOM',
        'payload': {'roomId': roomId},
      };

      _channel?.sink.add(json.encode(joinReq));
      AppLogger.debug('ChatService: 发送加入房间请求: $roomId');
    } catch (e) {
      AppLogger.error('ChatService: 发送加入房间请求失败', error: e);
    }
  }

  // 发送离开房间请求
  void _sendLeaveRoomRequest(int roomId) {
    try {
      // 构建离开房间请求（根据后端协议）
      final leaveReq = {
        'type': 'LEAVE_ROOM',
        'payload': {'roomId': roomId},
      };

      _channel?.sink.add(json.encode(leaveReq));
      AppLogger.debug('ChatService: 发送离开房间请求: $roomId');
    } catch (e) {
      AppLogger.error('ChatService: 发送离开房间请求失败', error: e);
    }
  }

  // 处理接收到的消息
  void _onMessageReceived(dynamic message) {
    try {
      // 解析消息
      final Map<String, dynamic> data = json.decode(message);
      AppLogger.debug('ChatService: 收到消息: $data');

      // 检查是否是聊天消息
      if (data.containsKey('type') && data.containsKey('payload')) {
        final String type = data['type'];
        final dynamic payload = data['payload'];

        if (type == 'CHAT_MESSAGE') {
          // 解析聊天消息
          final ChatMessageModel chatMessage = ChatMessageModel.fromJson(
            payload,
          );

          // 添加到消息列表
          _messages.add(chatMessage);

          // 发送更新后的消息列表
          _messagesController.add(List.from(_messages));

          AppLogger.info('ChatService: 处理聊天消息成功: ${chatMessage.content}');
        } else if (type == 'JOIN_ROOM_RESPONSE') {
          // 处理加入房间响应
          AppLogger.info('ChatService: 加入房间成功: ${payload['roomId']}');
        } else if (type == 'LEAVE_ROOM_RESPONSE') {
          // 处理离开房间响应
          AppLogger.info('ChatService: 离开房间成功: ${payload['roomId']}');
        } else if (type == 'ERROR') {
          // 处理错误消息
          AppLogger.error('ChatService: 收到错误消息: ${payload['errorMessage']}');
        }
      }
    } catch (e) {
      AppLogger.error('ChatService: 解析消息失败', error: e);
    }
  }

  // 处理错误
  void _onError(dynamic error) {
    AppLogger.error('ChatService: WebSocket错误', error: error);

    _isConnected = false;
    _connectionStatusController.add(false);
  }

  // 处理连接关闭
  void _onDone() {
    AppLogger.info('ChatService: WebSocket连接已关闭');

    _isConnected = false;
    _connectionStatusController.add(false);
  }

  // 清理资源
  void dispose() {
    disconnect();
    _messagesController.close();
    _connectionStatusController.close();
    AppLogger.info('ChatService: 资源已清理');
  }
}
