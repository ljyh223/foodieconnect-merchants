// 手动实现的protobuf消息模型，用于替代自动生成的代码

// 消息类型枚举
enum MessageType { text, image, system }

// 聊天消息
class ChatMessage {
  final int id;
  final int roomId;
  final int senderId;
  final String content;
  final MessageType messageType;
  final String senderName;
  final String senderAvatar;
  final String timestamp;

  ChatMessage({
    required this.id,
    required this.roomId,
    required this.senderId,
    required this.content,
    required this.messageType,
    required this.senderName,
    required this.senderAvatar,
    required this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      roomId: json['room_id'],
      senderId: json['sender_id'],
      content: json['content'],
      messageType: MessageType.values[json['message_type']],
      senderName: json['sender_name'],
      senderAvatar: json['sender_avatar'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'room_id': roomId,
      'sender_id': senderId,
      'content': content,
      'message_type': messageType.index,
      'sender_name': senderName,
      'sender_avatar': senderAvatar,
      'timestamp': timestamp,
    };
  }
}

// 发送消息请求
class SendMessageRequest {
  final int roomId;
  final String content;

  SendMessageRequest({required this.roomId, required this.content});

  Map<String, dynamic> toJson() {
    return {'room_id': roomId, 'content': content};
  }
}

// 加入聊天室请求
class JoinRoomRequest {
  final int roomId;

  JoinRoomRequest({required this.roomId});

  Map<String, dynamic> toJson() {
    return {'room_id': roomId};
  }
}

// 离开聊天室请求
class LeaveRoomRequest {
  final int roomId;

  LeaveRoomRequest({required this.roomId});

  Map<String, dynamic> toJson() {
    return {'room_id': roomId};
  }
}

// 加入聊天室响应
class JoinRoomResponse {
  final int roomId;
  final String message;

  JoinRoomResponse({required this.roomId, required this.message});

  factory JoinRoomResponse.fromJson(Map<String, dynamic> json) {
    return JoinRoomResponse(roomId: json['room_id'], message: json['message']);
  }
}

// 离开聊天室响应
class LeaveRoomResponse {
  final int roomId;
  final String message;

  LeaveRoomResponse({required this.roomId, required this.message});

  factory LeaveRoomResponse.fromJson(Map<String, dynamic> json) {
    return LeaveRoomResponse(roomId: json['room_id'], message: json['message']);
  }
}

// 通用响应
class ChatResponse {
  final bool success;
  final String errorMessage;
  final dynamic payload;

  ChatResponse({
    required this.success,
    required this.errorMessage,
    this.payload,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    dynamic payload;
    if (json.containsKey('message')) {
      payload = ChatMessage.fromJson(json['message']);
    } else if (json.containsKey('join_response')) {
      payload = JoinRoomResponse.fromJson(json['join_response']);
    } else if (json.containsKey('leave_response')) {
      payload = LeaveRoomResponse.fromJson(json['leave_response']);
    }

    return ChatResponse(
      success: json['success'],
      errorMessage: json['error_message'],
      payload: payload,
    );
  }
}

// WebSocket消息包装器
class WebSocketMessage {
  final String type;
  final Map<String, dynamic> payload;

  WebSocketMessage({required this.type, required this.payload});

  factory WebSocketMessage.fromJson(Map<String, dynamic> json) {
    return WebSocketMessage(type: json['type'], payload: json['payload']);
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'payload': payload};
  }
}
