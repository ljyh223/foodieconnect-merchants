import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

/// 通知类型枚举
enum NotificationType {
  @JsonValue('ORDER')
  order,
  @JsonValue('SYSTEM')
  system,
  @JsonValue('MARKETING')
  marketing,
  @JsonValue('CHAT')
  chat,
}

/// 通知状态枚举
enum NotificationStatus {
  @JsonValue('UNREAD')
  unread,
  @JsonValue('READ')
  read,
  @JsonValue('DELETED')
  deleted,
}

/// 通知模型
@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'type') required NotificationType type,
    @JsonKey(name: 'status') required NotificationStatus status,
    @JsonKey(name: 'data') Map<String, dynamic>? data,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'readAt') DateTime? readAt,
  }) = _NotificationModel;
  
  factory NotificationModel.fromJson(Map<String, dynamic> json) => 
      _$NotificationModelFromJson(json);
}

/// 通知列表响应模型
@freezed
class NotificationListResponse with _$NotificationListResponse {
  const factory NotificationListResponse({
    @JsonKey(name: 'records') required List<NotificationModel> records,
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'size') required int size,
    @JsonKey(name: 'current') required int current,
    @JsonKey(name: 'pages') required int pages,
  }) = _NotificationListResponse;
  
  factory NotificationListResponse.fromJson(Map<String, dynamic> json) => 
      _$NotificationListResponseFromJson(json);
}
