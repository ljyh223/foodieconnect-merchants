import 'dart:io';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/api/restaurant_api.dart';
import 'package:foodieconnect/data/models/common/api_response.dart';
import 'package:foodieconnect/data/models/restaurant/restaurant_model.dart';
import 'package:foodieconnect/data/models/restaurant/restaurant_update_request.dart';

/// 餐厅Repository层
class RestaurantRepository {
  final RestaurantApi _restaurantApi;

  RestaurantRepository(this._restaurantApi);

  /// 获取餐厅信息
  Future<ApiResponse<RestaurantModel>> getRestaurant() async {
    try {
      final response = await _restaurantApi.getRestaurant();
      return ApiResponse<RestaurantModel>.fromJson(
        response.data!,
        (json) => RestaurantModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      AppLogger.error('RestaurantRepository: 获取餐厅信息失败', error: e);
      rethrow;
    }
  }

  /// 更新餐厅信息
  Future<ApiResponse<RestaurantModel>> updateRestaurant(
    RestaurantUpdateRequest request,
  ) async {
    try {
      final response = await _restaurantApi.updateRestaurant(request);
      return ApiResponse<RestaurantModel>.fromJson(
        response.data!,
        (json) => RestaurantModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      AppLogger.error('RestaurantRepository: 更新餐厅信息失败', error: e);
      rethrow;
    }
  }

  /// 更新餐厅营业状态
  Future<ApiResponse<void>> updateRestaurantStatus(bool isOpen) async {
    try {
      final response = await _restaurantApi.updateRestaurantStatus(isOpen);
      return ApiResponse<void>.fromJson(response.data!, (json) {});
    } catch (e) {
      AppLogger.error('RestaurantRepository: 更新餐厅营业状态失败', error: e);
      rethrow;
    }
  }

  /// 上传图片文件
  Future<ApiResponse<String>> uploadImage(File imageFile) async {
    try {
      final response = await _restaurantApi.uploadImage(imageFile);
      return ApiResponse<String>.fromJson(response.data!, (json) {
        if (json is Map<String, dynamic>) {
          if (json.containsKey('url')) {
            return json['url'] as String;
          }
          if (json.containsKey('data') &&
              json['data'] is Map<String, dynamic>) {
            final data = json['data'] as Map<String, dynamic>;
            if (data.containsKey('url')) {
              return data['url'] as String;
            }
            if (data.containsKey('imageUrl')) {
              return data['imageUrl'] as String;
            }
            if (data.isNotEmpty) {
              return data.values.first as String;
            }
          }
        }
        return '';
      });
    } catch (e) {
      AppLogger.error('RestaurantRepository: 上传图片失败', error: e);
      rethrow;
    }
  }

  /// 更新餐厅图片URL
  Future<ApiResponse<String>> updateRestaurantImageUrl(String imageUrl) async {
    try {
      final response = await _restaurantApi.updateRestaurantImageUrl(imageUrl);
      return ApiResponse<String>.fromJson(response.data!, (json) => imageUrl);
    } catch (e) {
      AppLogger.error('RestaurantRepository: 更新餐厅图片URL失败', error: e);
      rethrow;
    }
  }

  /// 获取餐厅详情（用户视角）
  Future<ApiResponse<RestaurantModel>> getRestaurantDetail() async {
    try {
      final response = await _restaurantApi.getRestaurantDetail();
      return ApiResponse<RestaurantModel>.fromJson(
        response.data!,
        (json) => RestaurantModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      AppLogger.error('RestaurantRepository: 获取餐厅详情失败', error: e);
      rethrow;
    }
  }

  /// 获取聊天室验证码
  Future<ApiResponse<String>> getChatRoomVerificationCode() async {
    try {
      final response = await _restaurantApi.getChatRoomVerificationCode();
      return ApiResponse<String>.fromJson(response.data!, (json) {
        if (json is Map<String, dynamic>) {
          if (json.containsKey('data') &&
              json['data'] is Map<String, dynamic>) {
            final data = json['data'] as Map<String, dynamic>;
            if (data.containsKey('verificationCode')) {
              return data['verificationCode'] as String;
            }
          }
          if (json.containsKey('verificationCode')) {
            return json['verificationCode'] as String;
          }
        }
        return '';
      });
    } catch (e) {
      AppLogger.error('RestaurantRepository: 获取聊天室验证码失败', error: e);
      rethrow;
    }
  }

  /// 更新聊天室验证码
  Future<ApiResponse<String>> updateChatRoomVerificationCode(
    String verificationCode,
  ) async {
    try {
      final response = await _restaurantApi.updateChatRoomVerificationCode(
        verificationCode,
      );
      return ApiResponse<String>.fromJson(response.data!, (json) {
        if (json is Map<String, dynamic>) {
          if (json.containsKey('data') &&
              json['data'] is Map<String, dynamic>) {
            final data = json['data'] as Map<String, dynamic>;
            if (data.containsKey('verificationCode')) {
              return data['verificationCode'] as String;
            }
          }
          if (json.containsKey('verificationCode')) {
            return json['verificationCode'] as String;
          }
        }
        return verificationCode;
      });
    } catch (e) {
      AppLogger.error('RestaurantRepository: 更新聊天室验证码失败', error: e);
      rethrow;
    }
  }
}
