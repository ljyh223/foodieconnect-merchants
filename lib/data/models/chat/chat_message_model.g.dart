// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageModelImpl _$$ChatMessageModelImplFromJson(
  Map<String, dynamic> json,
) => _$ChatMessageModelImpl(
  id: (json['id'] as num?)?.toInt(),
  roomId: (json['roomId'] as num?)?.toInt(),
  senderId: (json['senderId'] as num?)?.toInt(),
  senderName: json['senderName'] as String?,
  content: json['content'] as String?,
  type: json['messageType'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  senderAvatar: json['senderAvatar'] as String?,
);

Map<String, dynamic> _$$ChatMessageModelImplToJson(
  _$ChatMessageModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'roomId': instance.roomId,
  'senderId': instance.senderId,
  'senderName': instance.senderName,
  'content': instance.content,
  'messageType': instance.type,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'senderAvatar': instance.senderAvatar,
};
