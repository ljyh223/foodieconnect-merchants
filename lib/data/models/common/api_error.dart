import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

/// API错误模型 - 使用Freezed的sealed class
@freezed
class ApiError with _$ApiError {
  /// 网络连接错误
  const factory ApiError.network() = _Network;

  /// 服务器错误
  const factory ApiError.server(int code, String message) = _Server;

  /// 未知错误
  const factory ApiError.unknown(String message) = _Unknown;

  /// 从DioException创建ApiError
  factory ApiError.fromDio(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const ApiError.network();
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode ?? 500;
        final errorMessage =
            e.response?.data?['error']?['message'] ??
            e.response?.data?['message'] ??
            '服务器错误';
        return ApiError.server(statusCode, errorMessage);
      case DioExceptionType.cancel:
        return ApiError.unknown('请求已取消');
      case DioExceptionType.badCertificate:
        return ApiError.unknown('证书验证失败');
      case DioExceptionType.unknown:
        return ApiError.unknown(e.message ?? '未知错误');
    }
  }
}
