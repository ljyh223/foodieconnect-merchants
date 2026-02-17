import 'dart:io';
import 'package:dio/dio.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';
import 'package:foodieconnectmerchant/data/models/restaurant/restaurant_model.dart';
import 'package:foodieconnectmerchant/data/models/restaurant/restaurant_update_request.dart';
import 'package:foodieconnectmerchant/data/models/common/api_response.dart';
import 'package:foodieconnectmerchant/data/repository/restaurant_repository.dart';

/// 餐厅服务类
class RestaurantService {
  final RestaurantRepository _restaurantRepository;

  RestaurantService(this._restaurantRepository);

  /// 获取餐厅信息
  Future<ApiResponse<RestaurantModel>> getRestaurant() async {
    try {
      AppLogger.info('RestaurantService: Fetching restaurant information');

      final apiResponse = await _restaurantRepository.getRestaurant();

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: Successfully fetched restaurant information');
      } else {
        AppLogger.warning(
          'RestaurantService: Failed to fetch restaurant information - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: Network error fetching restaurant information', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to fetch restaurant information, please check network connection');
    } catch (e) {
      AppLogger.error('RestaurantService: Unknown error fetching restaurant information', error: e);
      return ApiResponse.error('Failed to fetch restaurant information, please try again later');
    }
  }

  /// 更新餐厅信息
  Future<ApiResponse<RestaurantModel>> updateRestaurant(
    RestaurantUpdateRequest request,
  ) async {
    try {
      AppLogger.info('RestaurantService: Updating restaurant information');

      final apiResponse = await _restaurantRepository.updateRestaurant(request);

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: Successfully updated restaurant information');
      } else {
        AppLogger.warning(
          'RestaurantService: Failed to update restaurant information - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: Network error updating restaurant information', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to update restaurant information, please check network connection');
    } catch (e) {
      AppLogger.error('RestaurantService: Unknown error updating restaurant information', error: e);
      return ApiResponse.error('Failed to update restaurant information, please try again later');
    }
  }

  /// 更新餐厅营业状态
  Future<ApiResponse<void>> updateRestaurantStatus(bool isOpen) async {
    try {
      AppLogger.info('RestaurantService: Updating restaurant business status - $isOpen');

      final apiResponse = await _restaurantRepository.updateRestaurantStatus(
        isOpen,
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: Successfully updated restaurant business status');
      } else {
        AppLogger.warning(
          'RestaurantService: Failed to update restaurant business status - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: Network error updating restaurant business status', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to update business status, please check network connection');
    } catch (e) {
      AppLogger.error('RestaurantService: Unknown error updating restaurant business status', error: e);
      return ApiResponse.error('Failed to update business status, please try again later');
    }
  }

  /// 上传图片文件
  Future<ApiResponse<String>> uploadImage(File imageFile) async {
    try {
      AppLogger.info('RestaurantService: Uploading image file');

      final apiResponse = await _restaurantRepository.uploadImage(imageFile);

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: Image uploaded successfully - URL: ${apiResponse.data}');
      } else {
        AppLogger.warning(
          'RestaurantService: Failed to upload image - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: Network error uploading image', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to upload image, please check network connection');
    } catch (e) {
      AppLogger.error('RestaurantService: Unknown error uploading image', error: e);
      return ApiResponse.error('Failed to upload image, please try again later');
    }
  }

  /// 更新餐厅图片URL
  Future<ApiResponse<String>> updateRestaurantImageUrl(String imageUrl) async {
    try {
      AppLogger.info('RestaurantService: Updating restaurant image URL - $imageUrl');

      final apiResponse = await _restaurantRepository.updateRestaurantImageUrl(
        imageUrl,
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: Successfully updated restaurant image URL');
      } else {
        AppLogger.warning(
          'RestaurantService: Failed to update restaurant image URL - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: Network error updating restaurant image URL', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to update restaurant image, please check network connection');
    } catch (e) {
      AppLogger.error('RestaurantService: Unknown error updating restaurant image URL', error: e);
      return ApiResponse.error('Failed to update restaurant image, please try again later');
    }
  }

  /// 获取餐厅详情（用户视角）
  Future<ApiResponse<RestaurantModel>> getRestaurantDetail() async {
    try {
      AppLogger.info('RestaurantService: Fetching restaurant details (user view)');

      final apiResponse = await _restaurantRepository.getRestaurantDetail();

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: Successfully fetched restaurant details');
      } else {
        AppLogger.warning(
          'RestaurantService: Failed to fetch restaurant details - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: Network error fetching restaurant details', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to fetch restaurant details, please check network connection');
    } catch (e) {
      AppLogger.error('RestaurantService: Unknown error fetching restaurant details', error: e);
      return ApiResponse.error('Failed to fetch restaurant details, please try again later');
    }
  }

  /// 获取聊天室验证码
  Future<ApiResponse<String>> getChatRoomVerificationCode() async {
    try {
      AppLogger.info('RestaurantService: Fetching chat room verification code');

      final apiResponse = await _restaurantRepository
          .getChatRoomVerificationCode();

      if (apiResponse.isSuccess) {
        AppLogger.info('RestaurantService: Successfully fetched chat room verification code');
      } else {
        AppLogger.warning(
          'RestaurantService: Failed to fetch chat room verification code - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('RestaurantService: Network error fetching chat room verification code', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to fetch chat room verification code, please check network connection');
    } catch (e) {
      AppLogger.error('RestaurantService: Unknown error fetching chat room verification code', error: e);
      return ApiResponse.error('Failed to fetch chat room verification code, please try again later');
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

    return 'Unknown error';
  }
}
