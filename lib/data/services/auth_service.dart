import 'dart:convert';

import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/models/auth/merchant_login_request.dart';
import 'package:foodieconnect/data/models/auth/merchant_login_response.dart';
import 'package:foodieconnect/data/models/auth/user_dto.dart';
import 'package:foodieconnect/data/models/common/api_response.dart';
import 'package:foodieconnect/data/network/dio_client.dart';
import 'package:foodieconnect/data/repository/auth_repository.dart';
import 'package:foodieconnect/data/storage/secure_storage.dart';

/// 认证服务类
class AuthService {
  final AuthRepository _authRepository = AuthRepository();

  /// 商家登录
  Future<ApiResponse<MerchantLoginResponse>> login(
    MerchantLoginRequest request,
  ) async {
    try {
      AppLogger.info('AuthService: 开始商家登录 - ${request.username}');

      final responseData = await _authRepository.login(request);

      final apiResponse = ApiResponse<MerchantLoginResponse>.fromJson(
        responseData,
        (json) => MerchantLoginResponse.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess && apiResponse.data != null) {
        // 登录成功，保存token和用户信息
        await _saveLoginData(apiResponse.data!);
        AppLogger.info('AuthService: 登录成功');
      } else {
        AppLogger.warning('AuthService: 登录失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: 登录错误', error: e);
      return ApiResponse.error('登录失败，请稍后重试');
    }
  }

  /// 商家注册
  Future<ApiResponse<UserDTO>> register(
    Map<String, dynamic> registerData,
  ) async {
    try {
      AppLogger.info('AuthService: 开始商家注册');

      final responseData = await _authRepository.register(registerData);

      final apiResponse = ApiResponse<UserDTO>.fromJson(
        responseData,
        (json) => UserDTO.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('AuthService: 注册成功');
      } else {
        AppLogger.warning('AuthService: 注册失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: 注册错误', error: e);
      return ApiResponse.error('注册失败，请稍后重试');
    }
  }

  /// 获取当前商家信息
  Future<ApiResponse<UserDTO>> getCurrentMerchant() async {
    try {
      AppLogger.info('AuthService: 获取当前商家信息');

      final responseData = await _authRepository.getCurrentMerchant();

      final apiResponse = ApiResponse<UserDTO>.fromJson(
        responseData,
        (json) => UserDTO.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('AuthService: 获取商家信息成功');
      } else {
        AppLogger.warning(
          'AuthService: 获取商家信息失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: 获取商家信息错误', error: e);
      return ApiResponse.error('获取商家信息失败，请稍后重试');
    }
  }

  /// 修改密码
  Future<ApiResponse<void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      AppLogger.info('AuthService: 开始修改密码');

      final responseData = await _authRepository.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      final apiResponse = ApiResponse<void>.fromJson(responseData, (json) {});

      if (apiResponse.isSuccess) {
        AppLogger.info('AuthService: 修改密码成功');
      } else {
        AppLogger.warning('AuthService: 修改密码失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: 修改密码错误', error: e);
      return ApiResponse.error('修改密码失败，请稍后重试');
    }
  }

  /// 商家登出
  Future<ApiResponse<void>> logout() async {
    try {
      AppLogger.info('AuthService: 开始商家登出');

      final responseData = await _authRepository.logout();

      final apiResponse = ApiResponse<void>.fromJson(responseData, (json) {});

      // 无论API调用是否成功，都清除本地数据
      await _clearLoginData();
      AppLogger.info('AuthService: 登出成功');

      return apiResponse;
    } catch (e) {
      AppLogger.error('AuthService: 登出错误', error: e);

      // 即使发生错误，也要清除本地数据
      await _clearLoginData();

      return ApiResponse.error('登出失败，但本地数据已清除');
    }
  }

  /// 刷新Token
  Future<ApiResponse<MerchantLoginResponse>> refreshToken() async {
    try {
      AppLogger.info('AuthService: 开始刷新Token');

      // 由于API不返回refreshToken，暂时禁用此功能
      // 实际项目中需要与后端协商实现token刷新机制
      return ApiResponse.error('Token刷新功能暂未实现，请重新登录');
    } catch (e) {
      AppLogger.error('AuthService: 刷新Token错误', error: e);
      // 刷新失败，清除登录数据
      await _clearLoginData();
      return ApiResponse.error('Token刷新失败，请重新登录');
    }
  }

  /// 检查登录状态
  Future<bool> isLoggedIn() async {
    try {
      final token = await SecureStorage.getString(AppConstants.tokenKey);
      return token != null && token.isNotEmpty;
    } catch (e) {
      AppLogger.error('AuthService: 检查登录状态失败', error: e);
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

      // 设置API服务的访问令牌
      DioClient.setAccessToken(loginResponse.token);

      AppLogger.debug('AuthService: 登录数据保存成功');
    } catch (e) {
      AppLogger.error('AuthService: 保存登录数据失败', error: e);
      rethrow;
    }
  }

  /// 清除登录数据
  Future<void> _clearLoginData() async {
    try {
      await SecureStorage.remove(AppConstants.tokenKey);
      await SecureStorage.remove(AppConstants.userInfoKey);

      // 清除API服务的访问令牌
      DioClient.clearAccessToken();

      AppLogger.debug('AuthService: 登录数据清除成功');
    } catch (e) {
      AppLogger.error('AuthService: 清除登录数据失败', error: e);
    }
  }
}
