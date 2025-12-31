import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

/// 错误信息模型
@freezed
class ErrorInfo with _$ErrorInfo {
  const factory ErrorInfo({
    @JsonKey(name: 'code') required int code,
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'details') Map<String, dynamic>? details,
  }) = _ErrorInfo;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoFromJson(json);
}

/// 通用API响应模型
@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const ApiResponse._();

  const factory ApiResponse({
    @JsonKey(name: 'success') required bool success,
    @JsonKey(name: 'data') T? data,
    @JsonKey(name: 'error') ErrorInfo? error,
    @JsonKey(name: 'timestamp') DateTime? timestamp,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  /// 创建成功响应
  factory ApiResponse.success(T data, {DateTime? timestamp}) {
    return ApiResponse<T>(
      success: true,
      data: data,
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  /// 创建失败响应
  factory ApiResponse.error(String message, {int? code, DateTime? timestamp}) {
    return ApiResponse<T>(
      success: false,
      error: ErrorInfo(code: code ?? -1, message: message),
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  /// 检查响应是否成功
  bool get isSuccess => success && error == null;

  /// 检查响应是否失败
  bool get isFailure => !success || error != null;

  /// 获取错误信息
  String get errorMessage {
    if (error != null) {
      return error!.message;
    }
    return '未知错误';
  }
}

/// 分页API响应模型
@Freezed(genericArgumentFactories: true)
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    @JsonKey(name: 'records') required List<T> records,
    @JsonKey(name: 'total') required int total,
    @JsonKey(name: 'size') required int size,
    @JsonKey(name: 'current') required int current,
    @JsonKey(name: 'pages') required int pages,
  }) = _PaginatedResponse<T>;

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedResponseFromJson(json, fromJsonT);
}
