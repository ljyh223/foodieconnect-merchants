import 'dart:io';
import 'package:dio/dio.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/models/restaurant/restaurant_model.dart';
import 'package:foodieconnect/data/models/restaurant/restaurant_update_request.dart';
import 'package:foodieconnect/data/models/common/api_response.dart';
import 'package:foodieconnect/data/services/api_service.dart';

/// 餐厅服务类
class RestaurantService {
  final ApiService _apiService = ApiService();

  /// 获取餐厅信息
  Future<ApiResponse<RestaurantModel>> getRestaurant() async {
    try {
      AppLogger.info('RestaurantService: 获取餐厅信息');

      final response = await _apiService.get<Map<String, dynamic>>(
        '/api/v1/merchant/restaurants',
      );

      final apiResponse = ApiResponse<RestaurantModel>.fromJson(
        response.data!,
        (json) => RestaurantModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: 获取餐厅信息成功');
      } else {
        AppLogger.warning('RestaurantService: 获取餐厅信息失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: 获取餐厅信息网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('获取餐厅信息失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('RestaurantService: 获取餐厅信息未知错误', error: e);
      return ApiResponse.error('获取餐厅信息失败，请稍后重试');
    }
  }

  /// 更新餐厅信息
  Future<ApiResponse<RestaurantModel>> updateRestaurant(RestaurantUpdateRequest request) async {
    try {
      AppLogger.info('RestaurantService: 更新餐厅信息');

      final response = await _apiService.put<Map<String, dynamic>>(
        '/api/v1/merchant/restaurants',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<RestaurantModel>.fromJson(
        response.data!,
        (json) => RestaurantModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: 更新餐厅信息成功');
      } else {
        AppLogger.warning('RestaurantService: 更新餐厅信息失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: 更新餐厅信息网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('更新餐厅信息失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('RestaurantService: 更新餐厅信息未知错误', error: e);
      return ApiResponse.error('更新餐厅信息失败，请稍后重试');
    }
  }

  /// 更新餐厅营业状态
  Future<ApiResponse<void>> updateRestaurantStatus(bool isOpen) async {
    try {
      AppLogger.info('RestaurantService: 更新餐厅营业状态 - $isOpen');

      final response = await _apiService.put<Map<String, dynamic>>(
        '/api/v1/merchant/restaurants/status',
        data: {
          'isOpen': isOpen,
        },
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: 更新餐厅营业状态成功');
      } else {
        AppLogger.warning('RestaurantService: 更新餐厅营业状态失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: 更新餐厅营业状态网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('更新营业状态失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('RestaurantService: 更新餐厅营业状态未知错误', error: e);
      return ApiResponse.error('更新营业状态失败，请稍后重试');
    }
  }

  /// 更新餐厅图片
  Future<ApiResponse<String>> updateRestaurantImage(File imageFile) async {
    try {
      AppLogger.info('RestaurantService: 更新餐厅图片');

      final response = await _apiService.uploadFile<Map<String, dynamic>>(
        '/api/v1/merchant/restaurants/image',
        imageFile,
      );

      final apiResponse = ApiResponse<String>.fromJson(
        response.data!,
        (json) {
          // 假设返回的数据中包含图片URL
          if (json is Map<String, dynamic> && json.containsKey('imageUrl')) {
            return json['imageUrl'] as String;
          }
          return json.toString();
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: 更新餐厅图片成功');
      } else {
        AppLogger.warning('RestaurantService: 更新餐厅图片失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: 更新餐厅图片网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('更新餐厅图片失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('RestaurantService: 更新餐厅图片未知错误', error: e);
      return ApiResponse.error('更新餐厅图片失败，请稍后重试');
    }
  }

  /// 获取餐厅详情（用户视角）
  Future<ApiResponse<RestaurantModel>> getRestaurantDetail() async {
    try {
      AppLogger.info('RestaurantService: 获取餐厅详情（用户视角）');

      final response = await _apiService.get<Map<String, dynamic>>(
        '/api/v1/merchant/restaurants/detail',
      );

      final apiResponse = ApiResponse<RestaurantModel>.fromJson(
        response.data!,
        (json) => RestaurantModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: 获取餐厅详情成功');
      } else {
        AppLogger.warning('RestaurantService: 获取餐厅详情失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: 获取餐厅详情网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('获取餐厅详情失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('RestaurantService: 获取餐厅详情未知错误', error: e);
      return ApiResponse.error('获取餐厅详情失败，请稍后重试');
    }
  }

  /// 从错误响应中提取错误信息
  String _extractErrorMessage(Map<String, dynamic> errorData) {
    if (errorData.containsKey('error') && errorData['error'] is Map) {
      final error = errorData['error'] as Map;
      if (error.containsKey('message')) {
        return error['message'] as String;
      }
    }
    
    if (errorData.containsKey('message')) {
      return errorData['message'] as String;
    }
    
    return '未知错误';
  }
}