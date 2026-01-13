import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../models/chat/chat.pb.dart' as pb;
import '../models/chat/chat_message_model.dart';
import '../models/chat/chat_room_model.dart';
import '../models/chat/chat_ws_models.dart' as ws;
import '../repository/chat_repository.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/logger.dart';

/// 聊天室服务类
class ChatService {
  static final ChatService _instance = ChatService._internal();
  factory ChatService() => _instance;
  ChatService._internal();

  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  bool _isConnected = false;
  bool _isConnecting = false;
  int? _currentRoomId;

  // Repository实例
  final ChatRepository _chatRepository = ChatRepository();

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
      final chatRoom = await _chatRepository.fetchChatRoomInfo();
      AppLogger.info('ChatService: 获取聊天室信息成功');
      return chatRoom;
    } catch (e) {
      AppLogger.error('ChatService: 获取聊天室信息失败', error: e);
      return null;
    }
  }

  // 获取历史消息
  Future<void> getHistoryMessages() async {
    try {
      final messages = await _chatRepository.fetchHistoryMessages();

      // 清空现有消息列表
      _messages.clear();

      // 添加历史消息
      _messages.addAll(messages);

      // 按创建时间排序，确保最旧的消息在前，最新的消息在后
      _messages.sort((a, b) => (a.createdAt ?? DateTime.now()).compareTo(b.createdAt ?? DateTime.now()));

      // 发送更新后的消息列表
      _messagesController.add(List.from(_messages));
      AppLogger.info('ChatService: 获取历史消息成功，共 ${_messages.length} 条');
    } catch (e) {
      AppLogger.error('ChatService: 获取历史消息失败', error: e);
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

      // 如果正在连接，直接返回，避免重复连接
      if (_isConnecting) {
        AppLogger.info('ChatService: 正在连接到房间，请勿重复调用');
        return;
      }

      // 断开现有连接
      await disconnect();

      // 设置正在连接状态
      _isConnecting = true;

      // 构建WebSocket URL
      // 将HTTP协议转换为WebSocket协议
      final baseUrl = AppConstants.baseUrl
          .replaceFirst('http://', 'ws://')
          .replaceFirst('https://', 'wss://');
      final wsUrl = '$baseUrl/ws/chat-bin/$roomId';
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
    } finally {
      // 连接完成，重置连接状态
      _isConnecting = false;
    }
  }

  // 断开连接
  Future<void> disconnect() async {
    // 如果已经断开连接，直接返回
    if (!_isConnected && !_isConnecting) {
      AppLogger.info('ChatService: 已经断开连接');
      return;
    }

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
      _isConnecting = false;
      _currentRoomId = null;
      _connectionStatusController.add(false);

      AppLogger.info('ChatService: 断开连接成功');
    } catch (e) {
      AppLogger.error('ChatService: 断开连接失败', error: e);
      // 无论如何都更新状态，确保状态一致性
      _isConnected = false;
      _isConnecting = false;
      _currentRoomId = null;
      _connectionStatusController.add(false);
    }
  }

  // 发送加入房间请求
  void _sendJoinRoomRequest(int roomId) {
    try {
      // 构建加入房间请求（使用ws别名）
      final joinReq = ws.JoinRoomRequest(roomId: roomId);

      // 构建WebSocket消息（使用ws别名）
      final wsMsg = ws.WebSocketMessage(
        type: 'JOIN_ROOM',
        payload: joinReq.toJson(),
      );

      // 发送JSON消息
      _channel?.sink.add(json.encode(wsMsg.toJson()));
      AppLogger.debug('ChatService: 发送加入房间请求: $roomId');
    } catch (e) {
      AppLogger.error('ChatService: 发送加入房间请求失败', error: e);
    }
  }

  // 发送离开房间请求
  void _sendLeaveRoomRequest(int roomId) {
    try {
      // 构建离开房间请求（使用ws别名）
      final leaveReq = ws.LeaveRoomRequest(roomId: roomId);

      // 构建WebSocket消息（使用ws别名）
      final wsMsg = ws.WebSocketMessage(
        type: 'LEAVE_ROOM',
        payload: leaveReq.toJson(),
      );

      // 发送JSON消息
      _channel?.sink.add(json.encode(wsMsg.toJson()));
      AppLogger.debug('ChatService: 发送离开房间请求: $roomId');
    } catch (e) {
      AppLogger.error('ChatService: 发送离开房间请求失败', error: e);
    }
  }

  // 处理接收到的消息
  void _onMessageReceived(dynamic message) {
    try {
      // 检查消息类型
      if (message is String) {
        // 解析JSON消息
        final jsonData = json.decode(message);
        final chatResponse = ws.ChatResponse.fromJson(jsonData);
        AppLogger.debug('ChatService: 收到JSON消息: $chatResponse');

        if (chatResponse.success) {
          _handleChatWSChatResponse(chatResponse);
        } else {
          // 处理错误响应
          AppLogger.error('ChatService: 收到错误消息: ${chatResponse.errorMessage}');
        }
      } else if (message is Uint8List) {
        // 处理protobuf二进制消息
        AppLogger.debug('ChatService: 收到protobuf二进制消息');
        try {
          // 使用生成的protobuf类解析消息
          final chatResponse = pb.ChatResponse.fromBuffer(message);
          AppLogger.debug('ChatService: 解析protobuf消息成功: $chatResponse');
          
          if (chatResponse.success) {
            _handleProtobufChatResponse(chatResponse);
          } else {
            // 处理错误响应
            AppLogger.error('ChatService: 收到错误消息: ${chatResponse.errorMessage}');
          }
        } catch (e) {
          AppLogger.error('ChatService: 解析protobuf消息失败', error: e);
        }
      } else {
        AppLogger.error('ChatService: 收到未知类型消息，无法处理: ${message.runtimeType} $message');
      }
    } catch (e) {
      AppLogger.error('ChatService: 解析消息失败', error: e);
    }
  }
  
  // 处理WebSocket JSON聊天响应
  void _handleChatWSChatResponse(ws.ChatResponse chatResponse) {
    if (chatResponse.payload is ws.ChatMessage) {
      // 处理聊天消息
      final chatMsg = chatResponse.payload as ws.ChatMessage;
      final chatMessageModel = ChatMessageModel(
        id: chatMsg.id,
        roomId: chatMsg.roomId,
        senderId: chatMsg.senderId,
        senderName: chatMsg.senderName,
        content: chatMsg.content,
        type: chatMsg.messageType.toString(),
        createdAt: DateTime.parse(chatMsg.timestamp),
        updatedAt: DateTime.parse(chatMsg.timestamp), // 实时消息的创建时间和更新时间相同
        senderAvatar: chatMsg.senderAvatar,
      );

      // 添加到消息列表
      _messages.add(chatMessageModel);
      // 发送更新后的消息列表
      _messagesController.add(List.from(_messages));

      AppLogger.info(
        'ChatService: 处理JSON聊天消息成功: ${chatMessageModel.content}',
      );
    } else if (chatResponse.payload is ws.JoinRoomResponse) {
      // 处理加入房间响应
      final joinResponse = chatResponse.payload as ws.JoinRoomResponse;
      AppLogger.info(
        'ChatService: 加入房间成功: ${joinResponse.roomId}, 消息: ${joinResponse.message}',
      );
    } else if (chatResponse.payload is ws.LeaveRoomResponse) {
      // 处理离开房间响应
      final leaveResponse = chatResponse.payload as ws.LeaveRoomResponse;
      AppLogger.info(
        'ChatService: 离开房间成功: ${leaveResponse.roomId}, 消息: ${leaveResponse.message}',
      );
    }
  }
  


  // 处理protobuf聊天响应
  void _handleProtobufChatResponse(pb.ChatResponse chatResponse) {
    // 检查payload类型
    switch (chatResponse.whichPayload()) {
      case pb.ChatResponse_Payload.message:
        // 处理聊天消息
        final chatMsg = chatResponse.message;
        final chatMessageModel = ChatMessageModel(
          id: chatMsg.id.toInt(),
          roomId: chatMsg.roomId.toInt(),
          senderId: chatMsg.senderId.toInt(),
          senderName: chatMsg.senderName,
          content: chatMsg.content,
          type: chatMsg.messageType.name,
          createdAt: DateTime.parse(chatMsg.timestamp),
          updatedAt: DateTime.parse(chatMsg.timestamp), // 实时消息的创建时间和更新时间相同
          senderAvatar: chatMsg.senderAvatar,
        );

        // 添加到消息列表
        _messages.add(chatMessageModel);
        // 发送更新后的消息列表
        _messagesController.add(List.from(_messages));

        AppLogger.info(
          'ChatService: 处理protobuf聊天消息成功: ${chatMessageModel.content}',
        );
        break;
      case pb.ChatResponse_Payload.joinResponse:
        // 处理加入房间响应
        final joinResponse = chatResponse.joinResponse;
        AppLogger.info(
          'ChatService: 加入房间成功: ${joinResponse.roomId}, 消息: ${joinResponse.message}',
        );
        break;
      case pb.ChatResponse_Payload.leaveResponse:
        // 处理离开房间响应
        final leaveResponse = chatResponse.leaveResponse;
        AppLogger.info(
          'ChatService: 离开房间成功: ${leaveResponse.roomId}, 消息: ${leaveResponse.message}',
        );
        break;
      case pb.ChatResponse_Payload.notSet:
        // 没有payload
        AppLogger.warning('ChatService: 收到没有payload的protobuf消息');
        break;
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