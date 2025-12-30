import 'dart:io';
import 'package:dio/dio.dart';
import 'package:foodieconnect/data/models/restaurant/restaurant_update_request.dart';
import '../services/api_service.dart';

/// 餐厅API接口
class RestaurantApi {
  final ApiService _apiService = ApiService();

  /// 获取餐厅信息
  Future<Response<Map<String, dynamic>>> getRestaurant() async {
    return await _apiService.get<Map<String, dynamic>>('/merchant/restaurants');
  }

  /// 更新餐厅信息
  Future<Response<Map<String, dynamic>>> updateRestaurant(
    RestaurantUpdateRequest request,
  ) async {
    return await _apiService.put<Map<String, dynamic>>(
      '/merchant/restaurants',
      data: request.toJson(),
    );
  }

  /// 更新餐厅营业状态
  Future<Response<Map<String, dynamic>>> updateRestaurantStatus(
    bool isOpen,
  ) async {
    return await _apiService.put<Map<String, dynamic>>(
      '/merchant/restaurants/status',
      data: {'isOpen': isOpen},
    );
  }

  /// 上传图片文件
  Future<Response<Map<String, dynamic>>> uploadImage(File imageFile) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(imageFile.path),
    });
    return await _apiService.post<Map<String, dynamic>>(
      '/merchant/upload/image',
      data: formData,
    );
  }

  /// 更新餐厅图片URL
  Future<Response<Map<String, dynamic>>> updateRestaurantImageUrl(
    String imageUrl,
  ) async {
    return await _apiService.put<Map<String, dynamic>>(
      '/merchant/restaurants/image',
      queryParameters: {'imageUrl': imageUrl},
    );
  }

  /// 获取餐厅详情（用户视角）
  Future<Response<Map<String, dynamic>>> getRestaurantDetail() async {
    return await _apiService.get<Map<String, dynamic>>(
      '/merchant/restaurants/detail',
    );
  }

  /// 获取聊天室验证码
  Future<Response<Map<String, dynamic>>> getChatRoomVerificationCode() async {
    return await _apiService.get<Map<String, dynamic>>(
      '/merchant/restaurants/chat-room/verification-code',
    );
  }

  /// 更新聊天室验证码
  Future<Response<Map<String, dynamic>>> updateChatRoomVerificationCode(
    String verificationCode,
  ) async {
    return await _apiService.put<Map<String, dynamic>>(
      '/merchant/restaurants/chat-room/verification-code',
      queryParameters: {'verificationCode': verificationCode},
    );
  }
}
