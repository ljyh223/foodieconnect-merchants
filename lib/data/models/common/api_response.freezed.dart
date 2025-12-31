// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ErrorInfo _$ErrorInfoFromJson(Map<String, dynamic> json) {
  return _ErrorInfo.fromJson(json);
}

/// @nodoc
mixin _$ErrorInfo {
  @JsonKey(name: 'code')
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'details')
  Map<String, dynamic>? get details => throw _privateConstructorUsedError;

  /// Serializes this ErrorInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ErrorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ErrorInfoCopyWith<ErrorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorInfoCopyWith<$Res> {
  factory $ErrorInfoCopyWith(ErrorInfo value, $Res Function(ErrorInfo) then) =
      _$ErrorInfoCopyWithImpl<$Res, ErrorInfo>;
  @useResult
  $Res call({
    @JsonKey(name: 'code') int code,
    @JsonKey(name: 'message') String message,
    @JsonKey(name: 'details') Map<String, dynamic>? details,
  });
}

/// @nodoc
class _$ErrorInfoCopyWithImpl<$Res, $Val extends ErrorInfo>
    implements $ErrorInfoCopyWith<$Res> {
  _$ErrorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ErrorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as int,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            details: freezed == details
                ? _value.details
                : details // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ErrorInfoImplCopyWith<$Res>
    implements $ErrorInfoCopyWith<$Res> {
  factory _$$ErrorInfoImplCopyWith(
    _$ErrorInfoImpl value,
    $Res Function(_$ErrorInfoImpl) then,
  ) = __$$ErrorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'code') int code,
    @JsonKey(name: 'message') String message,
    @JsonKey(name: 'details') Map<String, dynamic>? details,
  });
}

/// @nodoc
class __$$ErrorInfoImplCopyWithImpl<$Res>
    extends _$ErrorInfoCopyWithImpl<$Res, _$ErrorInfoImpl>
    implements _$$ErrorInfoImplCopyWith<$Res> {
  __$$ErrorInfoImplCopyWithImpl(
    _$ErrorInfoImpl _value,
    $Res Function(_$ErrorInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ErrorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? details = freezed,
  }) {
    return _then(
      _$ErrorInfoImpl(
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as int,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        details: freezed == details
            ? _value._details
            : details // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorInfoImpl implements _ErrorInfo {
  const _$ErrorInfoImpl({
    @JsonKey(name: 'code') required this.code,
    @JsonKey(name: 'message') required this.message,
    @JsonKey(name: 'details') final Map<String, dynamic>? details,
  }) : _details = details;

  factory _$ErrorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorInfoImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int code;
  @override
  @JsonKey(name: 'message')
  final String message;
  final Map<String, dynamic>? _details;
  @override
  @JsonKey(name: 'details')
  Map<String, dynamic>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableMapView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ErrorInfo(code: $code, message: $message, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorInfoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    message,
    const DeepCollectionEquality().hash(_details),
  );

  /// Create a copy of ErrorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorInfoImplCopyWith<_$ErrorInfoImpl> get copyWith =>
      __$$ErrorInfoImplCopyWithImpl<_$ErrorInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorInfoImplToJson(this);
  }
}

abstract class _ErrorInfo implements ErrorInfo {
  const factory _ErrorInfo({
    @JsonKey(name: 'code') required final int code,
    @JsonKey(name: 'message') required final String message,
    @JsonKey(name: 'details') final Map<String, dynamic>? details,
  }) = _$ErrorInfoImpl;

  factory _ErrorInfo.fromJson(Map<String, dynamic> json) =
      _$ErrorInfoImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  int get code;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'details')
  Map<String, dynamic>? get details;

  /// Create a copy of ErrorInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorInfoImplCopyWith<_$ErrorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _ApiResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponse<T> {
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  T? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'error')
  ErrorInfo? get error => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  DateTime? get timestamp => throw _privateConstructorUsedError;

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
    ApiResponse<T> value,
    $Res Function(ApiResponse<T>) then,
  ) = _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({
    @JsonKey(name: 'success') bool success,
    @JsonKey(name: 'data') T? data,
    @JsonKey(name: 'error') ErrorInfo? error,
    @JsonKey(name: 'timestamp') DateTime? timestamp,
  });

  $ErrorInfoCopyWith<$Res>? get error;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as T?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as ErrorInfo?,
            timestamp: freezed == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ErrorInfoCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ErrorInfoCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(
    _$ApiResponseImpl<T> value,
    $Res Function(_$ApiResponseImpl<T>) then,
  ) = __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'success') bool success,
    @JsonKey(name: 'data') T? data,
    @JsonKey(name: 'error') ErrorInfo? error,
    @JsonKey(name: 'timestamp') DateTime? timestamp,
  });

  @override
  $ErrorInfoCopyWith<$Res>? get error;
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
    _$ApiResponseImpl<T> _value,
    $Res Function(_$ApiResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = freezed,
    Object? error = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(
      _$ApiResponseImpl<T>(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ErrorInfo?,
        timestamp: freezed == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiResponseImpl<T> extends _ApiResponse<T> {
  const _$ApiResponseImpl({
    @JsonKey(name: 'success') required this.success,
    @JsonKey(name: 'data') this.data,
    @JsonKey(name: 'error') this.error,
    @JsonKey(name: 'timestamp') this.timestamp,
  }) : super._();

  factory _$ApiResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$ApiResponseImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'data')
  final T? data;
  @override
  @JsonKey(name: 'error')
  final ErrorInfo? error;
  @override
  @JsonKey(name: 'timestamp')
  final DateTime? timestamp;

  @override
  String toString() {
    return 'ApiResponse<$T>(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    const DeepCollectionEquality().hash(data),
    error,
    timestamp,
  );

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiResponse<T> extends ApiResponse<T> {
  const factory _ApiResponse({
    @JsonKey(name: 'success') required final bool success,
    @JsonKey(name: 'data') final T? data,
    @JsonKey(name: 'error') final ErrorInfo? error,
    @JsonKey(name: 'timestamp') final DateTime? timestamp,
  }) = _$ApiResponseImpl<T>;
  const _ApiResponse._() : super._();

  factory _ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$ApiResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'data')
  T? get data;
  @override
  @JsonKey(name: 'error')
  ErrorInfo? get error;
  @override
  @JsonKey(name: 'timestamp')
  DateTime? get timestamp;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _PaginatedResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$PaginatedResponse<T> {
  @JsonKey(name: 'records')
  List<T> get records => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'current')
  int get current => throw _privateConstructorUsedError;
  @JsonKey(name: 'pages')
  int get pages => throw _privateConstructorUsedError;

  /// Serializes this PaginatedResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedResponseCopyWith<T, PaginatedResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedResponseCopyWith<T, $Res> {
  factory $PaginatedResponseCopyWith(
    PaginatedResponse<T> value,
    $Res Function(PaginatedResponse<T>) then,
  ) = _$PaginatedResponseCopyWithImpl<T, $Res, PaginatedResponse<T>>;
  @useResult
  $Res call({
    @JsonKey(name: 'records') List<T> records,
    @JsonKey(name: 'total') int total,
    @JsonKey(name: 'size') int size,
    @JsonKey(name: 'current') int current,
    @JsonKey(name: 'pages') int pages,
  });
}

/// @nodoc
class _$PaginatedResponseCopyWithImpl<
  T,
  $Res,
  $Val extends PaginatedResponse<T>
>
    implements $PaginatedResponseCopyWith<T, $Res> {
  _$PaginatedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? total = null,
    Object? size = null,
    Object? current = null,
    Object? pages = null,
  }) {
    return _then(
      _value.copyWith(
            records: null == records
                ? _value.records
                : records // ignore: cast_nullable_to_non_nullable
                      as List<T>,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
            current: null == current
                ? _value.current
                : current // ignore: cast_nullable_to_non_nullable
                      as int,
            pages: null == pages
                ? _value.pages
                : pages // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginatedResponseImplCopyWith<T, $Res>
    implements $PaginatedResponseCopyWith<T, $Res> {
  factory _$$PaginatedResponseImplCopyWith(
    _$PaginatedResponseImpl<T> value,
    $Res Function(_$PaginatedResponseImpl<T>) then,
  ) = __$$PaginatedResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'records') List<T> records,
    @JsonKey(name: 'total') int total,
    @JsonKey(name: 'size') int size,
    @JsonKey(name: 'current') int current,
    @JsonKey(name: 'pages') int pages,
  });
}

/// @nodoc
class __$$PaginatedResponseImplCopyWithImpl<T, $Res>
    extends _$PaginatedResponseCopyWithImpl<T, $Res, _$PaginatedResponseImpl<T>>
    implements _$$PaginatedResponseImplCopyWith<T, $Res> {
  __$$PaginatedResponseImplCopyWithImpl(
    _$PaginatedResponseImpl<T> _value,
    $Res Function(_$PaginatedResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? records = null,
    Object? total = null,
    Object? size = null,
    Object? current = null,
    Object? pages = null,
  }) {
    return _then(
      _$PaginatedResponseImpl<T>(
        records: null == records
            ? _value._records
            : records // ignore: cast_nullable_to_non_nullable
                  as List<T>,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
        current: null == current
            ? _value.current
            : current // ignore: cast_nullable_to_non_nullable
                  as int,
        pages: null == pages
            ? _value.pages
            : pages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$PaginatedResponseImpl<T> implements _PaginatedResponse<T> {
  const _$PaginatedResponseImpl({
    @JsonKey(name: 'records') required final List<T> records,
    @JsonKey(name: 'total') required this.total,
    @JsonKey(name: 'size') required this.size,
    @JsonKey(name: 'current') required this.current,
    @JsonKey(name: 'pages') required this.pages,
  }) : _records = records;

  factory _$PaginatedResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$PaginatedResponseImplFromJson(json, fromJsonT);

  final List<T> _records;
  @override
  @JsonKey(name: 'records')
  List<T> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  @JsonKey(name: 'total')
  final int total;
  @override
  @JsonKey(name: 'size')
  final int size;
  @override
  @JsonKey(name: 'current')
  final int current;
  @override
  @JsonKey(name: 'pages')
  final int pages;

  @override
  String toString() {
    return 'PaginatedResponse<$T>(records: $records, total: $total, size: $size, current: $current, pages: $pages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedResponseImpl<T> &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.pages, pages) || other.pages == pages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_records),
    total,
    size,
    current,
    pages,
  );

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedResponseImplCopyWith<T, _$PaginatedResponseImpl<T>>
  get copyWith =>
      __$$PaginatedResponseImplCopyWithImpl<T, _$PaginatedResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$PaginatedResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _PaginatedResponse<T> implements PaginatedResponse<T> {
  const factory _PaginatedResponse({
    @JsonKey(name: 'records') required final List<T> records,
    @JsonKey(name: 'total') required final int total,
    @JsonKey(name: 'size') required final int size,
    @JsonKey(name: 'current') required final int current,
    @JsonKey(name: 'pages') required final int pages,
  }) = _$PaginatedResponseImpl<T>;

  factory _PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$PaginatedResponseImpl<T>.fromJson;

  @override
  @JsonKey(name: 'records')
  List<T> get records;
  @override
  @JsonKey(name: 'total')
  int get total;
  @override
  @JsonKey(name: 'size')
  int get size;
  @override
  @JsonKey(name: 'current')
  int get current;
  @override
  @JsonKey(name: 'pages')
  int get pages;

  /// Create a copy of PaginatedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedResponseImplCopyWith<T, _$PaginatedResponseImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}
