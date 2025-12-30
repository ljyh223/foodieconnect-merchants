import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'api_response.g.dart';

/// 通用API响应模型
@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> extends Equatable {
  @JsonKey(name: 'success')
  final bool success;
  
  @JsonKey(name: 'data')
  final T? data;
  
  @JsonKey(name: 'error')
  final ErrorInfo? error;
  
  @JsonKey(name: 'timestamp')
  final DateTime? timestamp;

  const ApiResponse({
    required this.success,
    this.data,
    this.error,
    this.timestamp,
  });

  /// 从JSON创建实例
  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  /// 转换为JSON
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  /// 创建成功响应
  factory ApiResponse.success(T data, {DateTime? timestamp}) {
    return ApiResponse<T>(
      success: true,
      data: data,
      timestamp: timestamp ?? DateTime.now(),
    );
  }

  /// 创建失败响应
  factory ApiResponse.error(
    String message, {
    int? code,
    DateTime? timestamp,
  }) {
    return ApiResponse<T>(
      success: false,
      error: ErrorInfo(
        code: code ?? -1,
        message: message,
      ),
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

  @override
  List<Object?> get props => [success, data, error, timestamp];

  @override
  String toString() {
    return 'ApiResponse(success: $success, data: $data, error: $error, timestamp: $timestamp)';
  }
}

/// 错误信息模型
@JsonSerializable()
class ErrorInfo extends Equatable {
  @JsonKey(name: 'code')
  final int code;
  
  @JsonKey(name: 'message')
  final String message;
  
  @JsonKey(name: 'details')
  final Map<String, dynamic>? details;

  const ErrorInfo({
    required this.code,
    required this.message,
    this.details,
  });

  /// 从JSON创建实例
  factory ErrorInfo.fromJson(Map<String, dynamic> json) =>
      _$ErrorInfoFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$ErrorInfoToJson(this);

  @override
  List<Object?> get props => [code, message, details];

  @override
  String toString() {
    return 'ErrorInfo(code: $code, message: $message, details: $details)';
  }
}

/// 分页API响应模型
@JsonSerializable(genericArgumentFactories: true)
class PaginatedResponse<T> extends Equatable {
  @JsonKey(name: 'records')
  final List<T> records;
  
  @JsonKey(name: 'total')
  final int total;
  
  @JsonKey(name: 'size')
  final int size;
  
  @JsonKey(name: 'current')
  final int current;
  
  @JsonKey(name: 'pages')
  final int pages;

  const PaginatedResponse({
    required this.records,
    required this.total,
    required this.size,
    required this.current,
    required this.pages,
  });

  /// 从JSON创建实例
  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);

  /// 转换为JSON
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PaginatedResponseToJson(this, toJsonT);

  @override
  List<Object?> get props => [records, total, size, current, pages];

  @override
  String toString() {
    return 'PaginatedResponse(records: $records, total: $total, size: $size, current: $current, pages: $pages)';
  }
}