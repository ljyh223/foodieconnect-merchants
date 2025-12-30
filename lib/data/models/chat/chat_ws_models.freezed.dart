// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_ws_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WebSocketMessage _$WebSocketMessageFromJson(Map<String, dynamic> json) {
  return _WebSocketMessage.fromJson(json);
}

/// @nodoc
mixin _$WebSocketMessage {
  String get type => throw _privateConstructorUsedError;
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;

  /// Serializes this WebSocketMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebSocketMessageCopyWith<WebSocketMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketMessageCopyWith<$Res> {
  factory $WebSocketMessageCopyWith(
    WebSocketMessage value,
    $Res Function(WebSocketMessage) then,
  ) = _$WebSocketMessageCopyWithImpl<$Res, WebSocketMessage>;
  @useResult
  $Res call({String type, Map<String, dynamic> payload});
}

/// @nodoc
class _$WebSocketMessageCopyWithImpl<$Res, $Val extends WebSocketMessage>
    implements $WebSocketMessageCopyWith<$Res> {
  _$WebSocketMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? payload = null}) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            payload: null == payload
                ? _value.payload
                : payload // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WebSocketMessageImplCopyWith<$Res>
    implements $WebSocketMessageCopyWith<$Res> {
  factory _$$WebSocketMessageImplCopyWith(
    _$WebSocketMessageImpl value,
    $Res Function(_$WebSocketMessageImpl) then,
  ) = __$$WebSocketMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, Map<String, dynamic> payload});
}

/// @nodoc
class __$$WebSocketMessageImplCopyWithImpl<$Res>
    extends _$WebSocketMessageCopyWithImpl<$Res, _$WebSocketMessageImpl>
    implements _$$WebSocketMessageImplCopyWith<$Res> {
  __$$WebSocketMessageImplCopyWithImpl(
    _$WebSocketMessageImpl _value,
    $Res Function(_$WebSocketMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? payload = null}) {
    return _then(
      _$WebSocketMessageImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        payload: null == payload
            ? _value._payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WebSocketMessageImpl implements _WebSocketMessage {
  const _$WebSocketMessageImpl({
    required this.type,
    required final Map<String, dynamic> payload,
  }) : _payload = payload;

  factory _$WebSocketMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebSocketMessageImplFromJson(json);

  @override
  final String type;
  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'WebSocketMessage(type: $type, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebSocketMessageImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    const DeepCollectionEquality().hash(_payload),
  );

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebSocketMessageImplCopyWith<_$WebSocketMessageImpl> get copyWith =>
      __$$WebSocketMessageImplCopyWithImpl<_$WebSocketMessageImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WebSocketMessageImplToJson(this);
  }
}

abstract class _WebSocketMessage implements WebSocketMessage {
  const factory _WebSocketMessage({
    required final String type,
    required final Map<String, dynamic> payload,
  }) = _$WebSocketMessageImpl;

  factory _WebSocketMessage.fromJson(Map<String, dynamic> json) =
      _$WebSocketMessageImpl.fromJson;

  @override
  String get type;
  @override
  Map<String, dynamic> get payload;

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebSocketMessageImplCopyWith<_$WebSocketMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) {
  return _ChatMessage.fromJson(json);
}

/// @nodoc
mixin _$ChatMessage {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'room_id')
  int get roomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_id')
  int get senderId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'message_type')
  MessageType get messageType => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_name')
  String get senderName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sender_avatar')
  String get senderAvatar => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCopyWith<ChatMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
    ChatMessage value,
    $Res Function(ChatMessage) then,
  ) = _$ChatMessageCopyWithImpl<$Res, ChatMessage>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'room_id') int roomId,
    @JsonKey(name: 'sender_id') int senderId,
    String content,
    @JsonKey(name: 'message_type') MessageType messageType,
    @JsonKey(name: 'sender_name') String senderName,
    @JsonKey(name: 'sender_avatar') String senderAvatar,
    String timestamp,
  });
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res, $Val extends ChatMessage>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
    Object? senderId = null,
    Object? content = null,
    Object? messageType = null,
    Object? senderName = null,
    Object? senderAvatar = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as int,
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as int,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            messageType: null == messageType
                ? _value.messageType
                : messageType // ignore: cast_nullable_to_non_nullable
                      as MessageType,
            senderName: null == senderName
                ? _value.senderName
                : senderName // ignore: cast_nullable_to_non_nullable
                      as String,
            senderAvatar: null == senderAvatar
                ? _value.senderAvatar
                : senderAvatar // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatMessageImplCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$$ChatMessageImplCopyWith(
    _$ChatMessageImpl value,
    $Res Function(_$ChatMessageImpl) then,
  ) = __$$ChatMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'room_id') int roomId,
    @JsonKey(name: 'sender_id') int senderId,
    String content,
    @JsonKey(name: 'message_type') MessageType messageType,
    @JsonKey(name: 'sender_name') String senderName,
    @JsonKey(name: 'sender_avatar') String senderAvatar,
    String timestamp,
  });
}

/// @nodoc
class __$$ChatMessageImplCopyWithImpl<$Res>
    extends _$ChatMessageCopyWithImpl<$Res, _$ChatMessageImpl>
    implements _$$ChatMessageImplCopyWith<$Res> {
  __$$ChatMessageImplCopyWithImpl(
    _$ChatMessageImpl _value,
    $Res Function(_$ChatMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? roomId = null,
    Object? senderId = null,
    Object? content = null,
    Object? messageType = null,
    Object? senderName = null,
    Object? senderAvatar = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$ChatMessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as int,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as int,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        messageType: null == messageType
            ? _value.messageType
            : messageType // ignore: cast_nullable_to_non_nullable
                  as MessageType,
        senderName: null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                  as String,
        senderAvatar: null == senderAvatar
            ? _value.senderAvatar
            : senderAvatar // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatMessageImpl implements _ChatMessage {
  const _$ChatMessageImpl({
    required this.id,
    @JsonKey(name: 'room_id') required this.roomId,
    @JsonKey(name: 'sender_id') required this.senderId,
    required this.content,
    @JsonKey(name: 'message_type') required this.messageType,
    @JsonKey(name: 'sender_name') required this.senderName,
    @JsonKey(name: 'sender_avatar') required this.senderAvatar,
    required this.timestamp,
  });

  factory _$ChatMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatMessageImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'room_id')
  final int roomId;
  @override
  @JsonKey(name: 'sender_id')
  final int senderId;
  @override
  final String content;
  @override
  @JsonKey(name: 'message_type')
  final MessageType messageType;
  @override
  @JsonKey(name: 'sender_name')
  final String senderName;
  @override
  @JsonKey(name: 'sender_avatar')
  final String senderAvatar;
  @override
  final String timestamp;

  @override
  String toString() {
    return 'ChatMessage(id: $id, roomId: $roomId, senderId: $senderId, content: $content, messageType: $messageType, senderName: $senderName, senderAvatar: $senderAvatar, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName) &&
            (identical(other.senderAvatar, senderAvatar) ||
                other.senderAvatar == senderAvatar) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    roomId,
    senderId,
    content,
    messageType,
    senderName,
    senderAvatar,
    timestamp,
  );

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      __$$ChatMessageImplCopyWithImpl<_$ChatMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatMessageImplToJson(this);
  }
}

abstract class _ChatMessage implements ChatMessage {
  const factory _ChatMessage({
    required final int id,
    @JsonKey(name: 'room_id') required final int roomId,
    @JsonKey(name: 'sender_id') required final int senderId,
    required final String content,
    @JsonKey(name: 'message_type') required final MessageType messageType,
    @JsonKey(name: 'sender_name') required final String senderName,
    @JsonKey(name: 'sender_avatar') required final String senderAvatar,
    required final String timestamp,
  }) = _$ChatMessageImpl;

  factory _ChatMessage.fromJson(Map<String, dynamic> json) =
      _$ChatMessageImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'room_id')
  int get roomId;
  @override
  @JsonKey(name: 'sender_id')
  int get senderId;
  @override
  String get content;
  @override
  @JsonKey(name: 'message_type')
  MessageType get messageType;
  @override
  @JsonKey(name: 'sender_name')
  String get senderName;
  @override
  @JsonKey(name: 'sender_avatar')
  String get senderAvatar;
  @override
  String get timestamp;

  /// Create a copy of ChatMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageImplCopyWith<_$ChatMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendMessageRequest _$SendMessageRequestFromJson(Map<String, dynamic> json) {
  return _SendMessageRequest.fromJson(json);
}

/// @nodoc
mixin _$SendMessageRequest {
  @JsonKey(name: 'room_id')
  int get roomId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this SendMessageRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendMessageRequestCopyWith<SendMessageRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageRequestCopyWith<$Res> {
  factory $SendMessageRequestCopyWith(
    SendMessageRequest value,
    $Res Function(SendMessageRequest) then,
  ) = _$SendMessageRequestCopyWithImpl<$Res, SendMessageRequest>;
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId, String content});
}

/// @nodoc
class _$SendMessageRequestCopyWithImpl<$Res, $Val extends SendMessageRequest>
    implements $SendMessageRequestCopyWith<$Res> {
  _$SendMessageRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null, Object? content = null}) {
    return _then(
      _value.copyWith(
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as int,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SendMessageRequestImplCopyWith<$Res>
    implements $SendMessageRequestCopyWith<$Res> {
  factory _$$SendMessageRequestImplCopyWith(
    _$SendMessageRequestImpl value,
    $Res Function(_$SendMessageRequestImpl) then,
  ) = __$$SendMessageRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId, String content});
}

/// @nodoc
class __$$SendMessageRequestImplCopyWithImpl<$Res>
    extends _$SendMessageRequestCopyWithImpl<$Res, _$SendMessageRequestImpl>
    implements _$$SendMessageRequestImplCopyWith<$Res> {
  __$$SendMessageRequestImplCopyWithImpl(
    _$SendMessageRequestImpl _value,
    $Res Function(_$SendMessageRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null, Object? content = null}) {
    return _then(
      _$SendMessageRequestImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as int,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SendMessageRequestImpl implements _SendMessageRequest {
  const _$SendMessageRequestImpl({
    @JsonKey(name: 'room_id') required this.roomId,
    required this.content,
  });

  factory _$SendMessageRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendMessageRequestImplFromJson(json);

  @override
  @JsonKey(name: 'room_id')
  final int roomId;
  @override
  final String content;

  @override
  String toString() {
    return 'SendMessageRequest(roomId: $roomId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageRequestImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, content);

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageRequestImplCopyWith<_$SendMessageRequestImpl> get copyWith =>
      __$$SendMessageRequestImplCopyWithImpl<_$SendMessageRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SendMessageRequestImplToJson(this);
  }
}

abstract class _SendMessageRequest implements SendMessageRequest {
  const factory _SendMessageRequest({
    @JsonKey(name: 'room_id') required final int roomId,
    required final String content,
  }) = _$SendMessageRequestImpl;

  factory _SendMessageRequest.fromJson(Map<String, dynamic> json) =
      _$SendMessageRequestImpl.fromJson;

  @override
  @JsonKey(name: 'room_id')
  int get roomId;
  @override
  String get content;

  /// Create a copy of SendMessageRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageRequestImplCopyWith<_$SendMessageRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JoinRoomRequest _$JoinRoomRequestFromJson(Map<String, dynamic> json) {
  return _JoinRoomRequest.fromJson(json);
}

/// @nodoc
mixin _$JoinRoomRequest {
  @JsonKey(name: 'room_id')
  int get roomId => throw _privateConstructorUsedError;

  /// Serializes this JoinRoomRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JoinRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JoinRoomRequestCopyWith<JoinRoomRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinRoomRequestCopyWith<$Res> {
  factory $JoinRoomRequestCopyWith(
    JoinRoomRequest value,
    $Res Function(JoinRoomRequest) then,
  ) = _$JoinRoomRequestCopyWithImpl<$Res, JoinRoomRequest>;
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId});
}

/// @nodoc
class _$JoinRoomRequestCopyWithImpl<$Res, $Val extends JoinRoomRequest>
    implements $JoinRoomRequestCopyWith<$Res> {
  _$JoinRoomRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JoinRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null}) {
    return _then(
      _value.copyWith(
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JoinRoomRequestImplCopyWith<$Res>
    implements $JoinRoomRequestCopyWith<$Res> {
  factory _$$JoinRoomRequestImplCopyWith(
    _$JoinRoomRequestImpl value,
    $Res Function(_$JoinRoomRequestImpl) then,
  ) = __$$JoinRoomRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId});
}

/// @nodoc
class __$$JoinRoomRequestImplCopyWithImpl<$Res>
    extends _$JoinRoomRequestCopyWithImpl<$Res, _$JoinRoomRequestImpl>
    implements _$$JoinRoomRequestImplCopyWith<$Res> {
  __$$JoinRoomRequestImplCopyWithImpl(
    _$JoinRoomRequestImpl _value,
    $Res Function(_$JoinRoomRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JoinRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null}) {
    return _then(
      _$JoinRoomRequestImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinRoomRequestImpl implements _JoinRoomRequest {
  const _$JoinRoomRequestImpl({@JsonKey(name: 'room_id') required this.roomId});

  factory _$JoinRoomRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinRoomRequestImplFromJson(json);

  @override
  @JsonKey(name: 'room_id')
  final int roomId;

  @override
  String toString() {
    return 'JoinRoomRequest(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinRoomRequestImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  /// Create a copy of JoinRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinRoomRequestImplCopyWith<_$JoinRoomRequestImpl> get copyWith =>
      __$$JoinRoomRequestImplCopyWithImpl<_$JoinRoomRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinRoomRequestImplToJson(this);
  }
}

abstract class _JoinRoomRequest implements JoinRoomRequest {
  const factory _JoinRoomRequest({
    @JsonKey(name: 'room_id') required final int roomId,
  }) = _$JoinRoomRequestImpl;

  factory _JoinRoomRequest.fromJson(Map<String, dynamic> json) =
      _$JoinRoomRequestImpl.fromJson;

  @override
  @JsonKey(name: 'room_id')
  int get roomId;

  /// Create a copy of JoinRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinRoomRequestImplCopyWith<_$JoinRoomRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaveRoomRequest _$LeaveRoomRequestFromJson(Map<String, dynamic> json) {
  return _LeaveRoomRequest.fromJson(json);
}

/// @nodoc
mixin _$LeaveRoomRequest {
  @JsonKey(name: 'room_id')
  int get roomId => throw _privateConstructorUsedError;

  /// Serializes this LeaveRoomRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaveRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaveRoomRequestCopyWith<LeaveRoomRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveRoomRequestCopyWith<$Res> {
  factory $LeaveRoomRequestCopyWith(
    LeaveRoomRequest value,
    $Res Function(LeaveRoomRequest) then,
  ) = _$LeaveRoomRequestCopyWithImpl<$Res, LeaveRoomRequest>;
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId});
}

/// @nodoc
class _$LeaveRoomRequestCopyWithImpl<$Res, $Val extends LeaveRoomRequest>
    implements $LeaveRoomRequestCopyWith<$Res> {
  _$LeaveRoomRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaveRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null}) {
    return _then(
      _value.copyWith(
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeaveRoomRequestImplCopyWith<$Res>
    implements $LeaveRoomRequestCopyWith<$Res> {
  factory _$$LeaveRoomRequestImplCopyWith(
    _$LeaveRoomRequestImpl value,
    $Res Function(_$LeaveRoomRequestImpl) then,
  ) = __$$LeaveRoomRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId});
}

/// @nodoc
class __$$LeaveRoomRequestImplCopyWithImpl<$Res>
    extends _$LeaveRoomRequestCopyWithImpl<$Res, _$LeaveRoomRequestImpl>
    implements _$$LeaveRoomRequestImplCopyWith<$Res> {
  __$$LeaveRoomRequestImplCopyWithImpl(
    _$LeaveRoomRequestImpl _value,
    $Res Function(_$LeaveRoomRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeaveRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null}) {
    return _then(
      _$LeaveRoomRequestImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveRoomRequestImpl implements _LeaveRoomRequest {
  const _$LeaveRoomRequestImpl({
    @JsonKey(name: 'room_id') required this.roomId,
  });

  factory _$LeaveRoomRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveRoomRequestImplFromJson(json);

  @override
  @JsonKey(name: 'room_id')
  final int roomId;

  @override
  String toString() {
    return 'LeaveRoomRequest(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveRoomRequestImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  /// Create a copy of LeaveRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveRoomRequestImplCopyWith<_$LeaveRoomRequestImpl> get copyWith =>
      __$$LeaveRoomRequestImplCopyWithImpl<_$LeaveRoomRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveRoomRequestImplToJson(this);
  }
}

abstract class _LeaveRoomRequest implements LeaveRoomRequest {
  const factory _LeaveRoomRequest({
    @JsonKey(name: 'room_id') required final int roomId,
  }) = _$LeaveRoomRequestImpl;

  factory _LeaveRoomRequest.fromJson(Map<String, dynamic> json) =
      _$LeaveRoomRequestImpl.fromJson;

  @override
  @JsonKey(name: 'room_id')
  int get roomId;

  /// Create a copy of LeaveRoomRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaveRoomRequestImplCopyWith<_$LeaveRoomRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

JoinRoomResponse _$JoinRoomResponseFromJson(Map<String, dynamic> json) {
  return _JoinRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$JoinRoomResponse {
  @JsonKey(name: 'room_id')
  int get roomId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this JoinRoomResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JoinRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JoinRoomResponseCopyWith<JoinRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JoinRoomResponseCopyWith<$Res> {
  factory $JoinRoomResponseCopyWith(
    JoinRoomResponse value,
    $Res Function(JoinRoomResponse) then,
  ) = _$JoinRoomResponseCopyWithImpl<$Res, JoinRoomResponse>;
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId, String message});
}

/// @nodoc
class _$JoinRoomResponseCopyWithImpl<$Res, $Val extends JoinRoomResponse>
    implements $JoinRoomResponseCopyWith<$Res> {
  _$JoinRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JoinRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null, Object? message = null}) {
    return _then(
      _value.copyWith(
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as int,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$JoinRoomResponseImplCopyWith<$Res>
    implements $JoinRoomResponseCopyWith<$Res> {
  factory _$$JoinRoomResponseImplCopyWith(
    _$JoinRoomResponseImpl value,
    $Res Function(_$JoinRoomResponseImpl) then,
  ) = __$$JoinRoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId, String message});
}

/// @nodoc
class __$$JoinRoomResponseImplCopyWithImpl<$Res>
    extends _$JoinRoomResponseCopyWithImpl<$Res, _$JoinRoomResponseImpl>
    implements _$$JoinRoomResponseImplCopyWith<$Res> {
  __$$JoinRoomResponseImplCopyWithImpl(
    _$JoinRoomResponseImpl _value,
    $Res Function(_$JoinRoomResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of JoinRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null, Object? message = null}) {
    return _then(
      _$JoinRoomResponseImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as int,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JoinRoomResponseImpl implements _JoinRoomResponse {
  const _$JoinRoomResponseImpl({
    @JsonKey(name: 'room_id') required this.roomId,
    required this.message,
  });

  factory _$JoinRoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JoinRoomResponseImplFromJson(json);

  @override
  @JsonKey(name: 'room_id')
  final int roomId;
  @override
  final String message;

  @override
  String toString() {
    return 'JoinRoomResponse(roomId: $roomId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinRoomResponseImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, message);

  /// Create a copy of JoinRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinRoomResponseImplCopyWith<_$JoinRoomResponseImpl> get copyWith =>
      __$$JoinRoomResponseImplCopyWithImpl<_$JoinRoomResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$JoinRoomResponseImplToJson(this);
  }
}

abstract class _JoinRoomResponse implements JoinRoomResponse {
  const factory _JoinRoomResponse({
    @JsonKey(name: 'room_id') required final int roomId,
    required final String message,
  }) = _$JoinRoomResponseImpl;

  factory _JoinRoomResponse.fromJson(Map<String, dynamic> json) =
      _$JoinRoomResponseImpl.fromJson;

  @override
  @JsonKey(name: 'room_id')
  int get roomId;
  @override
  String get message;

  /// Create a copy of JoinRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinRoomResponseImplCopyWith<_$JoinRoomResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaveRoomResponse _$LeaveRoomResponseFromJson(Map<String, dynamic> json) {
  return _LeaveRoomResponse.fromJson(json);
}

/// @nodoc
mixin _$LeaveRoomResponse {
  @JsonKey(name: 'room_id')
  int get roomId => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this LeaveRoomResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaveRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaveRoomResponseCopyWith<LeaveRoomResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveRoomResponseCopyWith<$Res> {
  factory $LeaveRoomResponseCopyWith(
    LeaveRoomResponse value,
    $Res Function(LeaveRoomResponse) then,
  ) = _$LeaveRoomResponseCopyWithImpl<$Res, LeaveRoomResponse>;
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId, String message});
}

/// @nodoc
class _$LeaveRoomResponseCopyWithImpl<$Res, $Val extends LeaveRoomResponse>
    implements $LeaveRoomResponseCopyWith<$Res> {
  _$LeaveRoomResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaveRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null, Object? message = null}) {
    return _then(
      _value.copyWith(
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as int,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeaveRoomResponseImplCopyWith<$Res>
    implements $LeaveRoomResponseCopyWith<$Res> {
  factory _$$LeaveRoomResponseImplCopyWith(
    _$LeaveRoomResponseImpl value,
    $Res Function(_$LeaveRoomResponseImpl) then,
  ) = __$$LeaveRoomResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'room_id') int roomId, String message});
}

/// @nodoc
class __$$LeaveRoomResponseImplCopyWithImpl<$Res>
    extends _$LeaveRoomResponseCopyWithImpl<$Res, _$LeaveRoomResponseImpl>
    implements _$$LeaveRoomResponseImplCopyWith<$Res> {
  __$$LeaveRoomResponseImplCopyWithImpl(
    _$LeaveRoomResponseImpl _value,
    $Res Function(_$LeaveRoomResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeaveRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null, Object? message = null}) {
    return _then(
      _$LeaveRoomResponseImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as int,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveRoomResponseImpl implements _LeaveRoomResponse {
  const _$LeaveRoomResponseImpl({
    @JsonKey(name: 'room_id') required this.roomId,
    required this.message,
  });

  factory _$LeaveRoomResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveRoomResponseImplFromJson(json);

  @override
  @JsonKey(name: 'room_id')
  final int roomId;
  @override
  final String message;

  @override
  String toString() {
    return 'LeaveRoomResponse(roomId: $roomId, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveRoomResponseImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, message);

  /// Create a copy of LeaveRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveRoomResponseImplCopyWith<_$LeaveRoomResponseImpl> get copyWith =>
      __$$LeaveRoomResponseImplCopyWithImpl<_$LeaveRoomResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveRoomResponseImplToJson(this);
  }
}

abstract class _LeaveRoomResponse implements LeaveRoomResponse {
  const factory _LeaveRoomResponse({
    @JsonKey(name: 'room_id') required final int roomId,
    required final String message,
  }) = _$LeaveRoomResponseImpl;

  factory _LeaveRoomResponse.fromJson(Map<String, dynamic> json) =
      _$LeaveRoomResponseImpl.fromJson;

  @override
  @JsonKey(name: 'room_id')
  int get roomId;
  @override
  String get message;

  /// Create a copy of LeaveRoomResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaveRoomResponseImplCopyWith<_$LeaveRoomResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return _ChatResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatResponse {
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_message')
  String get errorMessage => throw _privateConstructorUsedError;
  dynamic get payload => throw _privateConstructorUsedError;

  /// Serializes this ChatResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatResponseCopyWith<ChatResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseCopyWith<$Res> {
  factory $ChatResponseCopyWith(
    ChatResponse value,
    $Res Function(ChatResponse) then,
  ) = _$ChatResponseCopyWithImpl<$Res, ChatResponse>;
  @useResult
  $Res call({
    bool success,
    @JsonKey(name: 'error_message') String errorMessage,
    dynamic payload,
  });
}

/// @nodoc
class _$ChatResponseCopyWithImpl<$Res, $Val extends ChatResponse>
    implements $ChatResponseCopyWith<$Res> {
  _$ChatResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? errorMessage = null,
    Object? payload = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: null == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String,
            payload: freezed == payload
                ? _value.payload
                : payload // ignore: cast_nullable_to_non_nullable
                      as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatResponseImplCopyWith<$Res>
    implements $ChatResponseCopyWith<$Res> {
  factory _$$ChatResponseImplCopyWith(
    _$ChatResponseImpl value,
    $Res Function(_$ChatResponseImpl) then,
  ) = __$$ChatResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    @JsonKey(name: 'error_message') String errorMessage,
    dynamic payload,
  });
}

/// @nodoc
class __$$ChatResponseImplCopyWithImpl<$Res>
    extends _$ChatResponseCopyWithImpl<$Res, _$ChatResponseImpl>
    implements _$$ChatResponseImplCopyWith<$Res> {
  __$$ChatResponseImplCopyWithImpl(
    _$ChatResponseImpl _value,
    $Res Function(_$ChatResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? errorMessage = null,
    Object? payload = freezed,
  }) {
    return _then(
      _$ChatResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: null == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String,
        payload: freezed == payload
            ? _value.payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatResponseImpl implements _ChatResponse {
  const _$ChatResponseImpl({
    required this.success,
    @JsonKey(name: 'error_message') required this.errorMessage,
    this.payload,
  });

  factory _$ChatResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatResponseImplFromJson(json);

  @override
  final bool success;
  @override
  @JsonKey(name: 'error_message')
  final String errorMessage;
  @override
  final dynamic payload;

  @override
  String toString() {
    return 'ChatResponse(success: $success, errorMessage: $errorMessage, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    errorMessage,
    const DeepCollectionEquality().hash(payload),
  );

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      __$$ChatResponseImplCopyWithImpl<_$ChatResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatResponseImplToJson(this);
  }
}

abstract class _ChatResponse implements ChatResponse {
  const factory _ChatResponse({
    required final bool success,
    @JsonKey(name: 'error_message') required final String errorMessage,
    final dynamic payload,
  }) = _$ChatResponseImpl;

  factory _ChatResponse.fromJson(Map<String, dynamic> json) =
      _$ChatResponseImpl.fromJson;

  @override
  bool get success;
  @override
  @JsonKey(name: 'error_message')
  String get errorMessage;
  @override
  dynamic get payload;

  /// Create a copy of ChatResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatResponseImplCopyWith<_$ChatResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
