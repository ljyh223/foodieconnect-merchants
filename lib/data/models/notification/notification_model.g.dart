// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationModelImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
  status: $enumDecode(_$NotificationStatusEnumMap, json['status']),
  data: json['data'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  readAt: json['readAt'] == null
      ? null
      : DateTime.parse(json['readAt'] as String),
);

Map<String, dynamic> _$$NotificationModelImplToJson(
  _$NotificationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'type': _$NotificationTypeEnumMap[instance.type]!,
  'status': _$NotificationStatusEnumMap[instance.status]!,
  'data': instance.data,
  'createdAt': instance.createdAt.toIso8601String(),
  'readAt': instance.readAt?.toIso8601String(),
};

const _$NotificationTypeEnumMap = {
  NotificationType.order: 'ORDER',
  NotificationType.system: 'SYSTEM',
  NotificationType.marketing: 'MARKETING',
  NotificationType.chat: 'CHAT',
};

const _$NotificationStatusEnumMap = {
  NotificationStatus.unread: 'UNREAD',
  NotificationStatus.read: 'READ',
  NotificationStatus.deleted: 'DELETED',
};

_$NotificationListResponseImpl _$$NotificationListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationListResponseImpl(
  records: (json['records'] as List<dynamic>)
      .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
  size: (json['size'] as num).toInt(),
  current: (json['current'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
);

Map<String, dynamic> _$$NotificationListResponseImplToJson(
  _$NotificationListResponseImpl instance,
) => <String, dynamic>{
  'records': instance.records,
  'total': instance.total,
  'size': instance.size,
  'current': instance.current,
  'pages': instance.pages,
};
