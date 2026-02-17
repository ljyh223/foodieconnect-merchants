import 'dart:convert';

import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';
import 'package:foodieconnectmerchant/data/models/auth/merchant_login_request.dart';
import 'package:foodieconnectmerchant/data/models/auth/merchant_login_response.dart';
import 'package:foodieconnectmerchant/data/models/auth/merchant_register_request.dart';
import 'package:foodieconnectmerchant/data/models/auth/merchant_register_response.dart';
import 'package:foodieconnectmerchant/data/models/auth/user_dto.dart';
import 'package:foodieconnectmerchant/data/models/common/api_response.dart';

import 'package:foodieconnectmerchant/data/repository/auth_repository.dart';
import 'package:foodieconnectmerchant/data/services/api_service.dart';
import 'package:foodieconnectmerchant/data/storage/secure_storage.dart';

/// 认证服务类
class AuthService {
  final AuthRepository _authRepository = AuthRepository();

  /// 商家登录
  Future<ApiResponse<MerchantLoginResponse>> login(
    MerchantLoginRequest request,
  ) async {
    try {
      AppLogger.info('AuthService: Starting merchant login - ${request.username}');

      final responseData = await _authRepository.login(request);

      final apiResponse = ApiResponse<MerchantLoginResponse>.fromJson(
        responseData,
        (json) => MerchantLoginResponse.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess && apiResponse.data != null) {
        // Login successful, save token and user information
        await _saveLoginData(apiResponse.data!);
        AppLogger.info('AuthService: Login successful');
      } else {
        AppLogger.warning('AuthService: Login failed - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: Login error', error: e);
      return ApiResponse.error('Login failed, please try again later');
    }
  }

  /// 商家注册
  Future<ApiResponse<MerchantRegisterResponse>> register(
    MerchantRegisterRequest registerData,
  ) async {
    try {
      AppLogger.info('AuthService: Starting merchant registration');

      final responseData = await _authRepository.register(registerData);

      final apiResponse = ApiResponse<MerchantRegisterResponse>.fromJson(
        responseData,
        (json) => MerchantRegisterResponse.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('AuthService: Registration successful');
      } else {
        AppLogger.warning('AuthService: Registration failed - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: Registration error', error: e);
      return ApiResponse.error('Registration failed, please try again later');
    }
  }

  /// 获取当前商家信息
  Future<ApiResponse<UserDTO>> getCurrentMerchant() async {
    try {
      AppLogger.info('AuthService: Fetching current merchant information');

      final responseData = await _authRepository.getCurrentMerchant();

      final apiResponse = ApiResponse<UserDTO>.fromJson(
        responseData,
        (json) => UserDTO.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('AuthService: Successfully fetched merchant information');
      } else {
        AppLogger.warning(
          'AuthService: Failed to fetch merchant information - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: Error fetching merchant information', error: e);
      return ApiResponse.error('Failed to fetch merchant information, please try again later');
    }
  }

  /// 修改密码
  Future<ApiResponse<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      AppLogger.info('AuthService: Starting password change');

      final responseData = await _authRepository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      final apiResponse = ApiResponse<void>.fromJson(responseData, (json) {});

      if (apiResponse.isSuccess) {
        AppLogger.info('AuthService: Password changed successfully');
      } else {
        AppLogger.warning('AuthService: Failed to change password - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: Error changing password', error: e);
      return ApiResponse.error('Failed to change password, please try again later');
    }
  }

  /// 商家登出
  Future<ApiResponse<void>> logout() async {
    try {
      AppLogger.info('AuthService: Starting merchant logout');

      final responseData = await _authRepository.logout();

      final apiResponse = ApiResponse<void>.fromJson(responseData, (json) {});

      // Clear local data regardless of API call success
      await _clearLoginData();
      AppLogger.info('AuthService: Logout successful');

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: Logout error', error: e);

      // Clear local data even if an error occurs
      await _clearLoginData();

      return ApiResponse.error('Logout failed, but local data has been cleared');
    }
  }

  /// 刷新Token
  Future<ApiResponse<MerchantLoginResponse>> refreshToken() async {
    try {
      AppLogger.info('AuthService: Starting Token refresh');

      // Token refresh feature temporarily disabled as API does not return refreshToken
      // Actual projects need to coordinate with backend to implement token refresh mechanism
      return ApiResponse.error('Token refresh feature not yet implemented, please login again');
    } catch (e) {
      AppLogger.error('AuthService: Error refreshing Token', error: e);
      // Refresh failed, clear login data
      await _clearLoginData();
      return ApiResponse.error('Token refresh failed, please login again');
    }
  }

  /// 检查登录状态
  Future<bool> isLoggedIn() async {
    try {
      final token = await SecureStorage.getString(AppConstants.tokenKey);
      return token != null && token.isNotEmpty;
    } catch (e) {
      AppLogger.error('AuthService: Failed to check login status', error: e);
      return false;
    }
  }

  /// 保存登录数据
  Future<void> _saveLoginData(MerchantLoginResponse loginResponse) async {
    try {
      await SecureStorage.setString(AppConstants.tokenKey, loginResponse.token);

      // 创建用户信息对象
      final userInfo = {
        'id': loginResponse.merchantId,
        'restaurantId': loginResponse.restaurantId,
        'username': loginResponse.username,
        'email': loginResponse.email,
        'name': loginResponse.name,
        'phone': loginResponse.phone,
        'role': loginResponse.role,
        'status': 'ACTIVE', // 默认状态
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      };

      await SecureStorage.setString(
        AppConstants.userInfoKey,
        jsonEncode(userInfo),
      );

      // Set API service access token
      ApiService().setAccessToken(loginResponse.token);

      AppLogger.debug('AuthService: Login data saved successfully');
    } catch (e) {
      AppLogger.error('AuthService: Failed to save login data', error: e);
      rethrow;
    }
  }

  /// Clear login data
  Future<void> _clearLoginData() async {
    try {
      await SecureStorage.remove(AppConstants.tokenKey);
      await SecureStorage.remove(AppConstants.userInfoKey);

      // Clear API service access token
      ApiService().clearAccessToken();

      AppLogger.debug('AuthService: Login data cleared successfully');
    } catch (e) {
      AppLogger.error('AuthService: Failed to clear login data', error: e);
    }
  }
}
