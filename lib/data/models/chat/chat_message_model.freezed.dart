// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) {
  return _ChatMessageModel.fromJson(json);
}

/// @nodoc
mixin _$ChatMessageModel {
  /// 消息ID
  int? get id => throw _privateConstructorUsedError;

  /// 房间ID
  int? get roomId => throw _privateConstructorUsedError;

  /// 发送者ID
  int? get senderId => throw _privateConstructorUsedError;

  /// 发送者名称
  String? get senderName => throw _privateConstructorUsedError;

  /// 消息内容
  String? get content => throw _privateConstructorUsedError;

  /// 消息类型
  @JsonKey(name: 'messageType')
  String? get type => throw _privateConstructorUsedError; // 这里正确
  /// 创建时间
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// 更新时间
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// 发送者头像
  String? get senderAvatar => throw _privateConstructorUsedError;

  /// Serializes this ChatMessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageModelCopyWith<ChatMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageModelCopyWith<$Res> {
  factory $ChatMessageModelCopyWith(
    ChatMessageModel value,
    $Res Function(ChatMessageModel) then,
  ) = _$ChatMessageModelCopyWithImpl<$Res, ChatMessageModel>;
  @useResult
  $Res call({
    int? id,
    int? roomId,
    int? senderId,
    String? senderName,
    String? content,
    @JsonKey(name: 'messageType') String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? senderAvatar,
  });
}

/// @nodoc
class _$ChatMessageModelCopyWithImpl<$Res, $Val extends ChatMessageModel>
    implements $ChatMessageModelCopyWith<$Res> {
  _$ChatMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roomId = freezed,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? content = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? senderAvatar = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int?,
            roomId: freezed == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as int?,
            senderId: freezed == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as int?,
            senderName: freezed == senderName
                ? _value.senderName
                : senderName // ignore: cast_nullable_to_non_nullable
                      as String?,
            content: freezed == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            senderAvatar: freezed == senderAvatar
                ? _value.senderAvatar
                : senderAvatar // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageModelImplCopyWith<$Res>
    implements $ChatMessageModelCopyWith<$Res> {
  factory _$$ChatMessageModelImplCopyWith(
    _$ChatMessageModelImpl value,
    $Res Function(_$ChatMessageModelImpl) then,
  ) = __$$ChatMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? id,
    int? roomId,
    int? senderId,
    String? senderName,
    String? content,
    @JsonKey(name: 'messageType') String? type,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? senderAvatar,
  });
}

/// @nodoc
class __$$ChatMessageModelImplCopyWithImpl<$Res>
    extends _$ChatMessageModelCopyWithImpl<$Res, _$ChatMessageModelImpl>
    implements _$$ChatMessageModelImplCopyWith<$Res> {
  __$$ChatMessageModelImplCopyWithImpl(
    _$ChatMessageModelImpl _value,
    $Res Function(_$ChatMessageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? roomId = freezed,
    Object? senderId = freezed,
    Object? senderName = freezed,
    Object? content = freezed,
    Object? type = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? senderAvatar = freezed,
  }) {
    return _then(
      _$ChatMessageModelImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int?,
        roomId: freezed == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as int?,
        senderId: freezed == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as int?,
        senderName: freezed == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String?,
        content: freezed == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        senderAvatar: freezed == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageModelImpl implements _ChatMessageModel {
  const _$ChatMessageModelImpl({
    this.id,
    this.roomId,
    this.senderId,
    this.senderName,
    this.content,
    @JsonKey(name: 'messageType') this.type,
    this.createdAt,
    this.updatedAt,
    this.senderAvatar,
  });

  factory _$ChatMessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageModelImplFromJson(json);

  /// 消息ID
  @override
  final int? id;

  /// 房间ID
  @override
  final int? roomId;

  /// 发送者ID
  @override
  final int? senderId;

  /// 发送者名称
  @override
  final String? senderName;

  /// 消息内容
  @override
  final String? content;

  /// 消息类型
  @override
  @JsonKey(name: 'messageType')
  final String? type;
  // 这里正确
  /// 创建时间
  @override
  final DateTime? createdAt;

  /// 更新时间
  @override
  final DateTime? updatedAt;

  /// 发送者头像
  @override
  final String? senderAvatar;

  @override
  String toString() {
    return 'ChatMessageModel(id: $id, roomId: $roomId, senderId: $senderId, senderName: $senderName, content: $content, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, senderAvatar: $senderAvatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roomId,
    senderId,
    senderName,
    content,
    type,
    createdAt,
    updatedAt,
    senderAvatar,
  );

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageModelImplCopyWith<_$ChatMessageModelImpl> get copyWith =>
      __$$ChatMessageModelImplCopyWithImpl<_$ChatMessageModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageModelImplToJson(this);
  }
}

abstract class _ChatMessageModel implements ChatMessageModel {
  const factory _ChatMessageModel({
    final int? id,
    final int? roomId,
    final int? senderId,
    final String? senderName,
    final String? content,
    @JsonKey(name: 'messageType') final String? type,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final String? senderAvatar,
  }) = _$ChatMessageModelImpl;

  factory _ChatMessageModel.fromJson(Map<String, dynamic> json) =
      _$ChatMessageModelImpl.fromJson;

  /// 消息ID
  @override
  int? get id;

  /// 房间ID
  @override
  int? get roomId;

  /// 发送者ID
  @override
  int? get senderId;

  /// 发送者名称
  @override
  String? get senderName;

  /// 消息内容
  @override
  String? get content;

  /// 消息类型
  @override
  @JsonKey(name: 'messageType')
  String? get type; // 这里正确
  /// 创建时间
  @override
  DateTime? get createdAt;

  /// 更新时间
  @override
  DateTime? get updatedAt;

  /// 发送者头像
  @override
  String? get senderAvatar;

  /// Create a copy of ChatMessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageModelImplCopyWith<_$ChatMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
