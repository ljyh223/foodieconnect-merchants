import 'dart:io';

import 'package:dio/dio.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/logger.dart';
import '../models/common/api_response.dart';

/// 基础API服务类
class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  late Dio _dio;
  String? _accessToken;

  // 认证错误回调函数
  Function()? onAuthError;

  /// 初始化API服务
  Future<void> init() async {
    _dio = Dio(
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
    );

    // 添加重试拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          // 只对特定错误类型进行重试
          final shouldRetry =
              error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.sendTimeout ||
              error.type == DioExceptionType.connectionError;

          if (shouldRetry) {
            // 重试次数
            const maxRetries = 3;
            int retryCount = 0;

            while (retryCount < maxRetries) {
              retryCount++;
              AppLogger.debug(
                'ApiService: 重试请求 ($retryCount/$maxRetries): ${error.requestOptions.uri}',
              );

              try {
                // 重试请求
                final response = await _dio.fetch(
                  error.requestOptions.copyWith(),
                );
                // 重试成功，返回响应
                return handler.resolve(response);
              } catch (e) {
                // 重试失败，继续重试
                if (retryCount == maxRetries) {
                  // 达到最大重试次数，返回错误
                  return handler.next(error);
                }
                // 等待一段时间后重试
                await Future.delayed(Duration(seconds: retryCount));
              }
            }
          }

          // 不需要重试或重试失败，继续处理错误
          return handler.next(error);
        },
      ),
    );

    // 添加请求、响应、错误拦截器
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );

    AppLogger.info('ApiService: 初始化完成');
  }

  /// 设置访问令牌
  void setAccessToken(String? token) {
    _accessToken = token;
    AppLogger.debug('ApiService: 设置访问令牌');
  }

  /// 获取访问令牌
  String? get accessToken => _accessToken;

  /// 清除访问令牌
  void clearAccessToken() {
    _accessToken = null;
    AppLogger.debug('ApiService: 清除访问令牌');
  }

  /// 请求拦截器
  void _onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    AppLogger.debug('token: $_accessToken');
    // 添加认证头
    if (_accessToken != null) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }

    // 添加商家API前缀
    if (options.path.startsWith('/merchant')) {
      // 商家API不需要额外处理，直接使用
    }

    AppLogger.debug('API请求: ${options.method} ${options.uri}');
    handler.next(options);
  }

  /// 响应拦截器
  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.debug(
      'API响应: ${response.statusCode} ${response.requestOptions.uri}',
    );

    // 尝试解析通用响应格式
    if (response.data is Map<String, dynamic>) {
      final data = response.data as Map<String, dynamic>;

      // 检查是否为标准API响应格式
      if (data.containsKey('success')) {
        // 这里可以添加统一的响应处理逻辑
        if (data['success'] == false && data.containsKey('error')) {
          AppLogger.warning('API返回错误: ${data['error']}');
        }
      }
    }

    handler.next(response);
  }

  /// 错误拦截器
  void _onError(DioException error, ErrorInterceptorHandler handler) {
    AppLogger.error('API错误: ${error.message}', error: error);

    // 处理不同类型的错误
    String errorMessage = '网络请求失败';

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = '连接超时';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = '请求超时';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = '响应超时';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleHttpError(error.response);

        // 检测401和403错误，可能是token过期
        if (error.response?.statusCode == 401 ||
            error.response?.statusCode == 403) {
          AppLogger.warning(
            'API错误: ${error.response?.statusCode} - Token过期或权限不足',
          );
          // 调用认证错误回调
          onAuthError?.call();
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = '请求已取消';
        break;
      case DioExceptionType.connectionError:
        errorMessage = '网络连接失败';
        break;
      case DioExceptionType.badCertificate:
        errorMessage = '证书验证失败';
        break;
      case DioExceptionType.unknown:
        errorMessage = '未知网络错误';
        break;
    }

    // 创建自定义错误响应
    final errorResponse = ApiResponse<dynamic>.error(errorMessage);

    // 将DioException转换为自定义错误
    final customError = DioException(
      requestOptions: error.requestOptions,
      response: Response(
        data: errorResponse.toJson((dynamic x) => x),
        statusCode: error.response?.statusCode ?? 500,
        requestOptions: error.requestOptions,
      ),
      type: error.type,
      error: errorMessage,
    );

    handler.reject(customError);
  }

  /// 处理HTTP错误
  String _handleHttpError(Response? response) {
    if (response == null) return '服务器响应错误';

    switch (response.statusCode) {
      case 400:
        return '请求参数错误';
      case 401:
        return '未授权访问，请重新登录';
      case 403:
        return '访问被拒绝';
      case 404:
        return '请求的资源不存在';
      case 405:
        return '请求方法不被允许';
      case 408:
        return '请求超时';
      case 409:
        return '请求冲突';
      case 429:
        return '请求过于频繁，请稍后再试';
      case 500:
        return '服务器内部错误';
      case 502:
        return '网关错误';
      case 503:
        return '服务暂时不可用';
      case 504:
        return '网关超时';
      default:
        return 'HTTP错误: ${response.statusCode}';
    }
  }

  /// GET请求
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// POST请求
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// PUT请求
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE请求
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// 上传文件
  Future<Response<T>> uploadFile<T>(
    String path,
    File file, {
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
    Options? options,
  }) async {
    try {
      final fileName = file.path.split('/').last;

      // 为图片上传创建特殊的请求选项
      final uploadOptions = Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          // 如果有访问令牌，添加认证头
          if (_accessToken != null) 'Authorization': 'Bearer $_accessToken',
        },
        // 增加超时时间，上传可能需要更长时间
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      );

      final formData = FormData.fromMap({
        ...?data,
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });

      return await _dio.post<T>(
        path,
        data: formData,
        onSendProgress: onSendProgress,
        options: uploadOptions,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// 批量上传文件
  Future<Response<T>> uploadFiles<T>(
    String path,
    List<File> files, {
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
    Options? options,
  }) async {
    try {
      final Map<String, dynamic> formDataMap = {...?data};

      for (int i = 0; i < files.length; i++) {
        final file = files[i];
        final fileName = file.path.split('/').last;
        formDataMap['files[$i]'] = await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        );
      }

      final formData = FormData.fromMap(formDataMap);

      return await _dio.post<T>(
        path,
        data: formData,
        onSendProgress: onSendProgress,
        options: options,
      );
    } catch (e) {
      rethrow;
    }
  }
}
