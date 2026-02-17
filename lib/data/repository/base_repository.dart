import 'package:dio/dio.dart';
import '../models/common/api_result.dart';
import '../models/common/api_error.dart';
import '../services/cache_service.dart';

/// 基础Repository类，提供统一的错误处理和返回格式
abstract class BaseRepository {
  final CacheService _cacheService = CacheService();

  /// 安全执行API调用，统一处理错误
  Future<ApiResult<T>> safeApiCall<T>(
    Future<Map<String, dynamic>> Function() apiCall,
    T Function(Map<String, dynamic>) dataParser, {
    String? cacheKey,
    Duration? cacheDuration,
  }) async {
    // 如果有缓存键，先从缓存获取
    if (cacheKey != null && _cacheService.containsKey(cacheKey)) {
      final cachedData = _cacheService.get<T>(cacheKey, (data) {
        if (data is Map<String, dynamic>) {
          return dataParser(data);
        }
        throw Exception('Cache data format error');
      });

      if (cachedData != null) {
        return ApiResult.success(cachedData);
      }
    }

    try {
      // 调用API
      final response = await apiCall();

      // 检查响应是否成功
      final success = response['success'] as bool;

      if (success) {
        // 成功响应，解析数据
        final data = response['data'] as Map<String, dynamic>;
        final parsedData = dataParser(data);

        // 如果有缓存键，保存到缓存
        if (cacheKey != null) {
          await _cacheService.save(cacheKey, data, cacheDuration);
        }

        return ApiResult.success(parsedData);
      } else {
        // 失败响应，获取错误信息
        final error = response['error'] as Map<String, dynamic>;
        final message = error['message'] as String;
        final code = error['code'] as int?;

        return ApiResult.error(message, code: code, details: error);
      }
    } on DioException catch (e) {
      // 处理Dio错误
      final apiError = ApiError.fromDio(e);
      return apiError.when(
        network: () => ApiResult.error('Network connection failed', code: -1, details: e),
        server: (code, message) =>
            ApiResult.error(message, code: code, details: e),
        unknown: (message) => ApiResult.error(message, code: -1, details: e),
      );
    } catch (e) {
      // 处理其他错误
      return ApiResult.error(e.toString(), code: -1, details: e);
    }
  }

  /// 安全执行列表API调用
  Future<ApiResult<List<T>>> safeListApiCall<T>(
    Future<Map<String, dynamic>> Function() apiCall,
    T Function(Map<String, dynamic>) itemParser, {
    String? cacheKey,
    Duration? cacheDuration,
  }) async {
    // 如果有缓存键，先从缓存获取
    if (cacheKey != null && _cacheService.containsKey(cacheKey)) {
      final cachedData = _cacheService.get<List<T>>(cacheKey, (data) {
        if (data is List) {
          return data
              .map((item) => itemParser(item as Map<String, dynamic>))
              .toList();
        } else if (data is Map<String, dynamic> &&
            data.containsKey('records')) {
          final records = data['records'] as List;
          return records
              .map((item) => itemParser(item as Map<String, dynamic>))
              .toList();
        }
        throw Exception('Cache data format error');
      });

      if (cachedData != null) {
        return ApiResult.success(cachedData);
      }
    }

    try {
      // 调用API
      final response = await apiCall();

      // 检查响应是否成功
      final success = response['success'] as bool;

      if (success) {
        // 成功响应，解析数据
        List<dynamic> items;
        Map<String, dynamic>? rawData;

        // 检查数据格式，可能是直接列表或包含records字段的Map
        if (response['data'] is List) {
          items = response['data'] as List;
        } else if (response['data'] is Map<String, dynamic>) {
          rawData = response['data'] as Map<String, dynamic>;
          if (rawData.containsKey('records') && rawData['records'] is List) {
            items = rawData['records'] as List;
          } else {
            items = [];
          }
        } else {
          items = [];
        }

        // 解析列表项
        final parsedItems = items
            .whereType<Map<String, dynamic>>()
            .map(itemParser)
            .toList();

        // 如果有缓存键，保存到缓存
        if (cacheKey != null) {
          // 保存原始数据以便正确反序列化
          final dataToCache = rawData ?? response['data'];
          await _cacheService.save(cacheKey, dataToCache, cacheDuration);
        }

        return ApiResult.success(parsedItems);
      } else {
        // 失败响应，获取错误信息
        final error = response['error'] as Map<String, dynamic>;
        final message = error['message'] as String;
        final code = error['code'] as int?;

        return ApiResult.error(message, code: code, details: error);
      }
    } on DioException catch (e) {
      // 处理Dio错误
      final apiError = ApiError.fromDio(e);
      return apiError.when(
        network: () => ApiResult.error('Network connection failed', code: -1, details: e),
        server: (code, message) =>
            ApiResult.error(message, code: code, details: e),
        unknown: (message) => ApiResult.error(message, code: -1, details: e),
      );
    } catch (e) {
      // 处理其他错误
      return ApiResult.error(e.toString(), code: -1, details: e);
    }
  }

  /// 清除指定缓存
  Future<bool> clearCache(String cacheKey) async {
    return await _cacheService.remove(cacheKey);
  }

  /// 清除所有缓存
  Future<bool> clearAllCache() async {
    return await _cacheService.clear();
  }
}
