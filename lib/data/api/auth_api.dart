import '../models/auth/merchant_login_request.dart';
import '../services/api_service.dart';

/// 认证API服务
class AuthApi {
  /// 商家登录
  static Future<Map<String, dynamic>> login(
    MerchantLoginRequest request,
  ) async {
    final response = await ApiService().post<Map<String, dynamic>>(
      '/merchant/auth/login',
      data: request.toJson(),
    );
    return response.data!;
  }

  /// 商家注册
  static Future<Map<String, dynamic>> register(
    Map<String, dynamic> registerData,
  ) async {
    final response = await ApiService().post<Map<String, dynamic>>(
      '/merchant/auth/register',
      data: registerData,
    );
    return response.data!;
  }

  /// 获取当前商家信息
  static Future<Map<String, dynamic>> getCurrentMerchant() async {
    final response = await ApiService().get<Map<String, dynamic>>(
      '/merchant/auth/profile',
    );
    return response.data!;
  }

  /// 修改密码
  static Future<Map<String, dynamic>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final response = await ApiService().put<Map<String, dynamic>>(
      '/merchant/auth/change-password',
      data: {'currentPassword': currentPassword, 'newPassword': newPassword},
    );
    return response.data!;
  }

  /// 商家登出
  static Future<Map<String, dynamic>> logout() async {
    final response = await ApiService().post<Map<String, dynamic>>(
      '/merchant/auth/logout',
    );
    return response.data!;
  }
}
