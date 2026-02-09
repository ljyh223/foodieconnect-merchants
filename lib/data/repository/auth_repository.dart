import '../api/auth_api.dart';
import '../models/auth/merchant_login_request.dart';
import '../models/auth/merchant_register_request.dart';
import '../models/common/api_error.dart';
import 'package:dio/dio.dart';

/// 认证Repository
class AuthRepository {
  /// 商家登录
  Future<Map<String, dynamic>> login(MerchantLoginRequest request) async {
    try {
      return await AuthApi.login(request);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 商家注册
  Future<Map<String, dynamic>> register(
    MerchantRegisterRequest registerData,
  ) async {
    try {
      return await AuthApi.register(registerData);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 获取当前商家信息
  Future<Map<String, dynamic>> getCurrentMerchant() async {
    try {
      return await AuthApi.getCurrentMerchant();
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 修改密码
  Future<Map<String, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      return await AuthApi.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 商家登出
  Future<Map<String, dynamic>> logout() async {
    try {
      return await AuthApi.logout();
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }
}
