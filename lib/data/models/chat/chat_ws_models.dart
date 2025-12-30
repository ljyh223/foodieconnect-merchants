import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_ws_models.freezed.dart';
part 'chat_ws_models.g.dart';

/// 消息类型枚举
enum MessageType {
  @JsonValue('TEXT')
  text,
  @JsonValue('IMAGE')
  image,
  @JsonValue('SYSTEM')
  system,
}

/// WebSocket消息包装器
@freezed
class WebSocketMessage with _$WebSocketMessage {
  const factory WebSocketMessage({
    required String type,
    required Map<String, dynamic> payload,
  }) = _WebSocketMessage;

  factory WebSocketMessage.fromJson(Map<String, dynamic> json) =>
      _$WebSocketMessageFromJson(json);
}

/// 聊天消息（WebSocket）
@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required int id,
    @JsonKey(name: 'room_id') required int roomId,
    @JsonKey(name: 'sender_id') required int senderId,
    required String content,
    @JsonKey(name: 'message_type') required MessageType messageType,
    @JsonKey(name: 'sender_name') required String senderName,
    @JsonKey(name: 'sender_avatar') required String senderAvatar,
    required String timestamp,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

/// 发送消息请求
@freezed
class SendMessageRequest with _$SendMessageRequest {
  const factory SendMessageRequest({
    @JsonKey(name: 'room_id') required int roomId,
    required String content,
  }) = _SendMessageRequest;

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestFromJson(json);
}

/// 加入聊天室请求
@freezed
class JoinRoomRequest with _$JoinRoomRequest {
  const factory JoinRoomRequest({
    @JsonKey(name: 'room_id') required int roomId,
  }) = _JoinRoomRequest;

  factory JoinRoomRequest.fromJson(Map<String, dynamic> json) =>
      _$JoinRoomRequestFromJson(json);
}

/// 离开聊天室请求
@freezed
class LeaveRoomRequest with _$LeaveRoomRequest {
  const factory LeaveRoomRequest({
    @JsonKey(name: 'room_id') required int roomId,
  }) = _LeaveRoomRequest;

  factory LeaveRoomRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveRoomRequestFromJson(json);
}

/// 加入聊天室响应
@freezed
class JoinRoomResponse with _$JoinRoomResponse {
  const factory JoinRoomResponse({
    @JsonKey(name: 'room_id') required int roomId,
    required String message,
  }) = _JoinRoomResponse;

  factory JoinRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$JoinRoomResponseFromJson(json);
}

/// 离开聊天室响应
@freezed
class LeaveRoomResponse with _$LeaveRoomResponse {
  const factory LeaveRoomResponse({
    @JsonKey(name: 'room_id') required int roomId,
    required String message,
  }) = _LeaveRoomResponse;

  factory LeaveRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaveRoomResponseFromJson(json);
}

/// 通用聊天响应
@freezed
class ChatResponse with _$ChatResponse {
  const factory ChatResponse({
    required bool success,
    @JsonKey(name: 'error_message') required String errorMessage,
    dynamic payload,
  }) = _ChatResponse;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
}
