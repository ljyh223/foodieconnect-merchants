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
        '/merchant/restaurants',
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
        '/merchant/restaurants',
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
        '/merchant/restaurants/status',
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

  /// 上传图片文件
  Future<ApiResponse<String>> uploadImage(File imageFile) async {
    try {
      AppLogger.info('RestaurantService: 上传图片文件');
      
      final response = await _apiService.uploadFile<Map<String, dynamic>>(
        '/merchant/upload/image',
        imageFile,
      );
      
      final apiResponse = ApiResponse<String>.fromJson(
        response.data!,
        (json) {
          // 根据API契约，上传图片返回 ApiResponseMapStringString
          // data 字段是 Map<String, String>，需要从中提取URL
          if (json is Map<String, dynamic>) {
            // 如果直接包含URL字段
            if (json.containsKey('url')) {
              return json['url'] as String;
            }
            // 如果包含data字段且data是Map
            if (json.containsKey('data') && json['data'] is Map<String, dynamic>) {
              final data = json['data'] as Map<String, dynamic>;
              // 从data中提取URL
              if (data.containsKey('url')) {
                return data['url'] as String;
              }
              if (data.containsKey('imageUrl')) {
                return data['imageUrl'] as String;
              }
              // 如果data是Map<String, String>，尝试获取第一个值
              if (data.isNotEmpty) {
                return data.values.first as String;
              }
            }
          }
          return '';
        },
      );
      
      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: 图片上传成功 - URL: ${apiResponse.data}');
      } else {
        AppLogger.warning('RestaurantService: 图片上传失败 - ${apiResponse.errorMessage}');
      }
      
      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: 上传图片网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('上传图片失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('RestaurantService: 上传图片未知错误', error: e);
      return ApiResponse.error('上传图片失败，请稍后重试');
    }
  }

  /// 更新餐厅图片URL
  Future<ApiResponse<String>> updateRestaurantImageUrl(String imageUrl) async {
    try {
      AppLogger.info('RestaurantService: 更新餐厅图片URL - $imageUrl');
      
      final response = await _apiService.put<Map<String, dynamic>>(
        '/merchant/restaurants/image',
        queryParameters: {
          'imageUrl': imageUrl,
        },
      );
      
      final apiResponse = ApiResponse<String>.fromJson(
        response.data!,
        (json) => imageUrl,
      );
      
      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: 餐厅图片URL更新成功');
      } else {
        AppLogger.warning('RestaurantService: 餐厅图片URL更新失败 - ${apiResponse.errorMessage}');
      }
      
      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: 更新餐厅图片URL网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('更新餐厅图片失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('RestaurantService: 更新餐厅图片URL未知错误', error: e);
      return ApiResponse.error('更新餐厅图片失败，请稍后重试');
    }
  }

  /// 获取餐厅详情（用户视角）
  Future<ApiResponse<RestaurantModel>> getRestaurantDetail() async {
    try {
      AppLogger.info('RestaurantService: 获取餐厅详情（用户视角）');

      final response = await _apiService.get<Map<String, dynamic>>(
        '/merchant/restaurants/detail',
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

  /// 获取聊天室验证码
  Future<ApiResponse<String>> getChatRoomVerificationCode() async {
    try {
      AppLogger.info('RestaurantService: 获取聊天室验证码');

      final response = await _apiService.get<Map<String, dynamic>>(
        '/merchant/restaurants/chat-room/verification-code',
      );

      final apiResponse = ApiResponse<String>.fromJson(
        response.data!,
        (json) {
          if (json is Map<String, dynamic>) {
            // 根据API契约，data字段是包含verificationCode的对象
            if (json.containsKey('data') && json['data'] is Map<String, dynamic>) {
              final data = json['data'] as Map<String, dynamic>;
              if (data.containsKey('verificationCode')) {
                return data['verificationCode'] as String;
              }
            }
            // 直接从json中提取verificationCode
            if (json.containsKey('verificationCode')) {
              return json['verificationCode'] as String;
            }
          }
          return '';
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: 获取聊天室验证码成功');
      } else {
        AppLogger.warning('RestaurantService: 获取聊天室验证码失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: 获取聊天室验证码网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('获取聊天室验证码失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('RestaurantService: 获取聊天室验证码未知错误', error: e);
      return ApiResponse.error('获取聊天室验证码失败，请稍后重试');
    }
  }

  /// 更新聊天室验证码
  Future<ApiResponse<String>> updateChatRoomVerificationCode(String verificationCode) async {
    try {
      AppLogger.info('RestaurantService: 更新聊天室验证码 - $verificationCode');

      final response = await _apiService.put<Map<String, dynamic>>(
        '/merchant/restaurants/chat-room/verification-code',
        queryParameters: {
          'verificationCode': verificationCode,
        },
      );

      final apiResponse = ApiResponse<String>.fromJson(
        response.data!,
        (json) {
          if (json is Map<String, dynamic>) {
            // 根据API契约，data字段是包含verificationCode的对象
            if (json.containsKey('data') && json['data'] is Map<String, dynamic>) {
              final data = json['data'] as Map<String, dynamic>;
              if (data.containsKey('verificationCode')) {
                return data['verificationCode'] as String;
              }
            }
            // 直接从json中提取verificationCode
            if (json.containsKey('verificationCode')) {
              return json['verificationCode'] as String;
            }
          }
          return verificationCode;
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: 更新聊天室验证码成功');
      } else {
        AppLogger.warning('RestaurantService: 更新聊天室验证码失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: 更新聊天室验证码网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('更新聊天室验证码失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('RestaurantService: 更新聊天室验证码未知错误', error: e);
      return ApiResponse.error('更新聊天室验证码失败，请稍后重试');
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