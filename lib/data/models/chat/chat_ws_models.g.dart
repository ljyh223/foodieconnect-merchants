// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_ws_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WebSocketMessageImpl _$$WebSocketMessageImplFromJson(
  Map<String, dynamic> json,
) => _$WebSocketMessageImpl(
  type: json['type'] as String,
  payload: json['payload'] as Map<String, dynamic>,
);

Map<String, dynamic> _$$WebSocketMessageImplToJson(
  _$WebSocketMessageImpl instance,
) => <String, dynamic>{'type': instance.type, 'payload': instance.payload};

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: (json['id'] as num).toInt(),
      roomId: (json['room_id'] as num).toInt(),
      senderId: (json['sender_id'] as num).toInt(),
      content: json['content'] as String,
      messageType: $enumDecode(_$MessageTypeEnumMap, json['message_type']),
      senderName: json['sender_name'] as String,
      senderAvatar: json['sender_avatar'] as String,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'room_id': instance.roomId,
      'sender_id': instance.senderId,
      'content': instance.content,
      'message_type': _$MessageTypeEnumMap[instance.messageType]!,
      'sender_name': instance.senderName,
      'sender_avatar': instance.senderAvatar,
      'timestamp': instance.timestamp,
    };

const _$MessageTypeEnumMap = {
  MessageType.text: 'TEXT',
  MessageType.image: 'IMAGE',
  MessageType.system: 'SYSTEM',
};

_$SendMessageRequestImpl _$$SendMessageRequestImplFromJson(
  Map<String, dynamic> json,
) => _$SendMessageRequestImpl(
  roomId: (json['room_id'] as num).toInt(),
  content: json['content'] as String,
);

Map<String, dynamic> _$$SendMessageRequestImplToJson(
  _$SendMessageRequestImpl instance,
) => <String, dynamic>{'room_id': instance.roomId, 'content': instance.content};

_$JoinRoomRequestImpl _$$JoinRoomRequestImplFromJson(
  Map<String, dynamic> json,
) => _$JoinRoomRequestImpl(roomId: (json['room_id'] as num).toInt());

Map<String, dynamic> _$$JoinRoomRequestImplToJson(
  _$JoinRoomRequestImpl instance,
) => <String, dynamic>{'room_id': instance.roomId};

_$LeaveRoomRequestImpl _$$LeaveRoomRequestImplFromJson(
  Map<String, dynamic> json,
) => _$LeaveRoomRequestImpl(roomId: (json['room_id'] as num).toInt());

Map<String, dynamic> _$$LeaveRoomRequestImplToJson(
  _$LeaveRoomRequestImpl instance,
) => <String, dynamic>{'room_id': instance.roomId};

_$JoinRoomResponseImpl _$$JoinRoomResponseImplFromJson(
  Map<String, dynamic> json,
) => _$JoinRoomResponseImpl(
  roomId: (json['room_id'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$$JoinRoomResponseImplToJson(
  _$JoinRoomResponseImpl instance,
) => <String, dynamic>{'room_id': instance.roomId, 'message': instance.message};

_$LeaveRoomResponseImpl _$$LeaveRoomResponseImplFromJson(
  Map<String, dynamic> json,
) => _$LeaveRoomResponseImpl(
  roomId: (json['room_id'] as num).toInt(),
  message: json['message'] as String,
);

Map<String, dynamic> _$$LeaveRoomResponseImplToJson(
  _$LeaveRoomResponseImpl instance,
) => <String, dynamic>{'room_id': instance.roomId, 'message': instance.message};

_$ChatResponseImpl _$$ChatResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChatResponseImpl(
      success: json['success'] as bool,
      errorMessage: json['error_message'] as String,
      payload: json['payload'],
    );

Map<String, dynamic> _$$ChatResponseImplToJson(_$ChatResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error_message': instance.errorMessage,
      'payload': instance.payload,
    };
