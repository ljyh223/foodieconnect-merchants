import 'package:dio/dio.dart';
import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/utils/logger.dart';

/// 全局Dio客户端配置
class DioClient {
  static final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: AppConstants.baseUrl,
            connectTimeout: AppConstants.apiTimeout,
            receiveTimeout: AppConstants.apiTimeout,
            sendTimeout: AppConstants.apiTimeout,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        )
        // 添加请求拦截器
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: _onRequest,
            onResponse: _onResponse,
            onError: _onError,
          ),
        );

  static Dio get dio => _dio;
  static String? _accessToken;

  /// 设置访问令牌
  static void setAccessToken(String token) {
    _accessToken = token;
    _dio.options.headers['Authorization'] = 'Bearer $token';
    AppLogger.debug('DioClient: 设置访问令牌成功');
  }

  /// 清除访问令牌
  static void clearAccessToken() {
    _accessToken = null;
    _dio.options.headers.remove('Authorization');
    AppLogger.debug('DioClient: 清除访问令牌成功');
  }

  /// 获取当前访问令牌
  static String? get accessToken => _accessToken;

  /// 请求拦截器
  static void _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 如果有访问令牌，添加到请求头
    if (_accessToken != null) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }
    // 记录请求日志
    AppLogger.debug('API请求: ${options.method} ${options.uri}');
    handler.next(options);
  }

  /// 响应拦截器
  static void _onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    // 记录响应日志
    AppLogger.debug(
      'API响应: ${response.statusCode} ${response.requestOptions.uri}',
    );
    handler.next(response);
  }

  /// 错误拦截器
  static void _onError(DioException error, ErrorInterceptorHandler handler) {
    // 记录错误日志
    AppLogger.error('API错误: ${error.message}', error: error);
    handler.next(error);
  }
}
