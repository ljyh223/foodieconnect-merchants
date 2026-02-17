import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:foodieconnectmerchant/core/constants/app_constants.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';
import 'package:foodieconnectmerchant/data/models/auth/merchant_login_request.dart';
import 'package:foodieconnectmerchant/data/models/auth/merchant_login_response.dart';
import 'package:foodieconnectmerchant/data/models/auth/merchant_register_request.dart';
import 'package:foodieconnectmerchant/data/models/auth/user_dto.dart';

import 'package:foodieconnectmerchant/data/services/auth_service.dart';
import 'package:foodieconnectmerchant/data/services/api_service.dart';
import 'package:foodieconnectmerchant/data/storage/secure_storage.dart';

/// 认证状态管理Provider
class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  // 认证状态
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _errorMessage;
  UserDTO? _currentUser;
  MerchantLoginResponse? _loginResponse;

  // Getters
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  UserDTO? get currentUser => _currentUser;
  MerchantLoginResponse? get loginResponse => _loginResponse;
  String? get accessToken => _loginResponse?.token;

  /// 初始化认证状态
  Future<void> init() async {
    try {
      AppLogger.info('AuthProvider: Initializing authentication status');

      // 检查本地存储的登录状态
      final isLoggedIn = await _authService.isLoggedIn();
      _isLoggedIn = isLoggedIn;

      if (isLoggedIn) {
        // 加载token到ApiService
        await _loadTokenToApiService();
        // 获取用户信息
        await _loadUserInfo();
      }

      notifyListeners();
      AppLogger.info('AuthProvider: Initialization complete - Login status: $_isLoggedIn');
    } catch (e) {
      AppLogger.error('AuthProvider: Initialization failed', error: e);
      _setError('Initialization failed');
    }
  }

  /// 处理Token过期
  Future<void> handleTokenExpired() async {
    AppLogger.info('AuthProvider: Handling token expiration');
    await logout();
  }

  /// 用户登录
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      AppLogger.info('AuthProvider: Starting login - $username');

      final loginRequest = MerchantLoginRequest(
        username: username,
        password: password,
      );

      final response = await _authService.login(loginRequest);

      if (response.isSuccess && response.data != null) {
        _loginResponse = response.data!;

        // 创建用户信息对象
        _currentUser = UserDTO(
          id: response.data!.merchantId,
          restaurantId: response.data!.restaurantId,
          username: response.data!.username,
          email: response.data!.email,
          name: response.data!.name,
          phone: response.data!.phone,
          role: response.data!.role,
          status: 'ACTIVE', // 默认状态
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        _isLoggedIn = true;

        // 设置ApiService的访问令牌
        ApiService().setAccessToken(response.data!.token);

        AppLogger.info('AuthProvider: Login successful');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('AuthProvider: Login failed - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('AuthProvider: Login exception', error: e);
      _setError('Login failed, please try again later');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// 商家注册
  Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String name,
    String? phone,
    required String restaurantName,
    required String restaurantType,
    required String restaurantAddress,
    String? restaurantImage,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      final request = MerchantRegisterRequest(
        username: username,
        email: email,
        password: password,
        name: name,
        phone: phone,
        restaurantName: restaurantName,
        restaurantType: restaurantType,
        restaurantAddress: restaurantAddress,
        restaurantImage: restaurantImage,
      );

      final response = await _authService.register(request);

      if (response.isSuccess) {
        AppLogger.info('AuthProvider: Registration successful');
        return true;
      } else {
        _setError(response.errorMessage);
        return false;
      }
    } catch (e) {
      AppLogger.error('AuthProvider: Registration exception', error: e);
      _setError('Registration failed, please try again later');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// 用户登出
  Future<void> logout() async {
    try {
      _setLoading(true);
      _clearError();

      AppLogger.info('AuthProvider: Starting logout');

      final response = await _authService.logout();

      // 无论API调用是否成功，都清除本地状态
      _clearAuthState();
      // 清除ApiService的访问令牌
      ApiService().clearAccessToken();

      if (response.isSuccess) {
        AppLogger.info('AuthProvider: Logout successful');
      } else {
        AppLogger.warning('AuthProvider: Logout API failed - ${response.errorMessage}');
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('AuthProvider: Logout exception', error: e);
      // 即使发生异常，也要清除本地状态
      _clearAuthState();
      // 清除ApiService的访问令牌
      ApiService().clearAccessToken();
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// 修改密码
  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      AppLogger.info('AuthProvider: Starting to change password');

      final response = await _authService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      if (response.isSuccess) {
        AppLogger.info('AuthProvider: Password changed successfully');
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('AuthProvider: Failed to change password - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('AuthProvider: Password change exception', error: e);
      _setError('Failed to change password, please try again later');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// 刷新Token
  Future<bool> refreshToken() async {
    try {
      _setLoading(true);
      _clearError();

      AppLogger.info('AuthProvider: Starting to refresh token');

      final response = await _authService.refreshToken();

      if (response.isSuccess && response.data != null) {
        _loginResponse = response.data!;
        AppLogger.info('AuthProvider: Token refreshed successfully');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('AuthProvider: Failed to refresh token - ${response.errorMessage}');

        // 刷新失败，清除认证状态
        _clearAuthState();
        notifyListeners();
        return false;
      }
    } catch (e) {
      AppLogger.error('AuthProvider: Token refresh exception', error: e);
      _setError('Token refresh failed');

      // 发生异常，清除认证状态
      _clearAuthState();
      notifyListeners();
      return false;
    } finally {
      _setLoading(false);
    }
  }

  /// 更新用户信息
  void updateUserInfo(UserDTO userInfo) {
    _currentUser = userInfo;

    // 更新本地存储
    final storedUserInfo = {
      'id': userInfo.id,
      'restaurantId': userInfo.restaurantId,
      'username': userInfo.username,
      'email': userInfo.email,
      'name': userInfo.name,
      'phone': userInfo.phone,
      'role': userInfo.role,
      'status': userInfo.status,
      'createdAt': userInfo.createdAt.toIso8601String(),
      'updatedAt': userInfo.updatedAt.toIso8601String(),
      'lastLoginAt': userInfo.lastLoginAt?.toIso8601String(),
    };

    SecureStorage.setString(
      AppConstants.userInfoKey,
      jsonEncode(storedUserInfo),
    );

    AppLogger.info('AuthProvider: User information updated');
    notifyListeners();
  }

  /// 加载用户信息
  Future<void> _loadUserInfo() async {
    try {
      // 先尝试从本地存储加载用户信息
      final userInfoString = await SecureStorage.getString(
        AppConstants.userInfoKey,
      );
      if (userInfoString != null && userInfoString.isNotEmpty) {
        try {
          final userInfoMap =
              jsonDecode(userInfoString) as Map<String, dynamic>;
          _currentUser = UserDTO(
            id: userInfoMap['id'] as int? ?? 0,
            restaurantId: userInfoMap['restaurantId'] as int? ?? 0,
            username: userInfoMap['username'] as String? ?? '',
            email: userInfoMap['email'] as String? ?? '',
            name: userInfoMap['name'] as String? ?? '',
            phone: userInfoMap['phone'] as String?,
            role: userInfoMap['role'] as String? ?? 'ADMIN',
            status: userInfoMap['status'] as String? ?? 'ACTIVE',
            createdAt: userInfoMap['createdAt'] != null
                ? DateTime.parse(userInfoMap['createdAt'] as String)
                : DateTime.now(),
            updatedAt: userInfoMap['updatedAt'] != null
                ? DateTime.parse(userInfoMap['updatedAt'] as String)
                : DateTime.now(),
            lastLoginAt: userInfoMap['lastLoginAt'] != null
                ? DateTime.parse(userInfoMap['lastLoginAt'] as String)
                : null,
          );
          AppLogger.info('AuthProvider: User information loaded from local storage successfully');
          return;
        } catch (e) {
          AppLogger.warning('AuthProvider: Failed to parse local user information', error: e);
        }
      }

      // 如果本地没有或解析失败，尝试从API获取
      final response = await _authService.getCurrentMerchant();

      if (response.isSuccess && response.data != null) {
        _currentUser = response.data;
        AppLogger.info('AuthProvider: User information loaded from API successfully');
      } else {
        AppLogger.warning('AuthProvider: Failed to load user information - ${response.errorMessage}');
        // 加载失败，可能token已过期，清除认证状态
        _clearAuthState();
      }
    } catch (e) {
      AppLogger.error('AuthProvider: Exception loading user information', error: e);
      _clearAuthState();
    }
  }

  /// 加载token到ApiService
  Future<void> _loadTokenToApiService() async {
    try {
      final token = await SecureStorage.getString(AppConstants.tokenKey);
      if (token != null && token.isNotEmpty) {
        // 设置ApiService的访问令牌
        ApiService().setAccessToken(token);
        AppLogger.info('AuthProvider: Token loaded to ApiService');
      }
    } catch (e) {
      AppLogger.error('AuthProvider: Failed to load token to ApiService', error: e);
    }
  }

  /// 清除认证状态
  void _clearAuthState() {
    _isLoggedIn = false;
    _currentUser = null;
    _loginResponse = null;
    _clearError();
    AppLogger.info('AuthProvider: Authentication status cleared');
  }

  /// 设置加载状态
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// 设置错误信息
  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  /// 清除错误信息
  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  /// 清除错误信息（公共方法）
  void clearError() {
    _clearError();
  }

  /// 检查是否需要刷新Token
  bool shouldRefreshToken() {
    if (_loginResponse == null) return false;

    // 这里可以根据实际需求添加Token过期检查逻辑
    // 暂时返回false
    return false;
  }

  /// 获取用户显示名称
  String get userDisplayName {
    if (_currentUser == null) return 'Unknown User';
    return _currentUser!.displayName.isNotEmpty
        ? _currentUser!.displayName
        : _currentUser!.email.split('@').first;
  }

  /// 检查用户是否活跃
  bool get isUserActive {
    return _currentUser?.isActive ?? false;
  }
}
