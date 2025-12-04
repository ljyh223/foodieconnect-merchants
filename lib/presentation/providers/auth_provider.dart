import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:foodieconnect/core/constants/app_constants.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/models/auth/merchant_login_request.dart';
import 'package:foodieconnect/data/models/auth/merchant_login_response.dart';
import 'package:foodieconnect/data/models/auth/user_dto.dart';
import 'package:foodieconnect/data/services/auth_service.dart';
import 'package:foodieconnect/data/storage/secure_storage.dart';

import '../../data/services/api_service.dart';

/// 认证状态管理Provider
class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final ApiService _apiService = ApiService();

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
      AppLogger.info('AuthProvider: 初始化认证状态');
      
      // 注册API服务的认证错误回调
      _apiService.onAuthError = handleTokenExpired;
      
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
      AppLogger.info('AuthProvider: 初始化完成 - 登录状态: $_isLoggedIn');
    } catch (e) {
      AppLogger.error('AuthProvider: 初始化失败', error: e);
      _setError('初始化失败');
    }
  }
  
  /// 处理Token过期
  Future<void> handleTokenExpired() async {
    AppLogger.info('AuthProvider: 处理Token过期');
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

      AppLogger.info('AuthProvider: 开始登录 - $username');

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
        
        AppLogger.info('AuthProvider: 登录成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('AuthProvider: 登录失败 - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('AuthProvider: 登录异常', error: e);
      _setError('登录失败，请稍后重试');
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

      AppLogger.info('AuthProvider: 开始登出');

      final response = await _authService.logout();
      
      // 无论API调用是否成功，都清除本地状态
      _clearAuthState();
      
      if (response.isSuccess) {
        AppLogger.info('AuthProvider: 登出成功');
      } else {
        AppLogger.warning('AuthProvider: 登出API失败 - ${response.errorMessage}');
      }
      
      notifyListeners();
    } catch (e) {
      AppLogger.error('AuthProvider: 登出异常', error: e);
      // 即使发生异常，也要清除本地状态
      _clearAuthState();
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

      AppLogger.info('AuthProvider: 开始修改密码');

      final response = await _authService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      if (response.isSuccess) {
        AppLogger.info('AuthProvider: 修改密码成功');
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('AuthProvider: 修改密码失败 - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('AuthProvider: 修改密码异常', error: e);
      _setError('修改密码失败，请稍后重试');
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

      AppLogger.info('AuthProvider: 开始刷新Token');

      final response = await _authService.refreshToken();

      if (response.isSuccess && response.data != null) {
        _loginResponse = response.data!;
        AppLogger.info('AuthProvider: 刷新Token成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('AuthProvider: 刷新Token失败 - ${response.errorMessage}');
        
        // 刷新失败，清除认证状态
        _clearAuthState();
        notifyListeners();
        return false;
      }
    } catch (e) {
      AppLogger.error('AuthProvider: 刷新Token异常', error: e);
      _setError('Token刷新失败');
      
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
    
    AppLogger.info('AuthProvider: 用户信息已更新');
    notifyListeners();
  }

  /// 加载用户信息
  Future<void> _loadUserInfo() async {
    try {
      // 先尝试从本地存储加载用户信息
      final userInfoString = await SecureStorage.getString(AppConstants.userInfoKey);
      if (userInfoString != null && userInfoString.isNotEmpty) {
        try {
          final userInfoMap = jsonDecode(userInfoString) as Map<String, dynamic>;
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
          AppLogger.info('AuthProvider: 用户信息从本地加载成功');
          return;
        } catch (e) {
          AppLogger.warning('AuthProvider: 本地用户信息解析失败', error: e);
        }
      }
      
      // 如果本地没有或解析失败，尝试从API获取
      final response = await _authService.getCurrentMerchant();
      
      if (response.isSuccess && response.data != null) {
        _currentUser = response.data;
        AppLogger.info('AuthProvider: 用户信息从API加载成功');
      } else {
        AppLogger.warning('AuthProvider: 用户信息加载失败 - ${response.errorMessage}');
        // 加载失败，可能token已过期，清除认证状态
        _clearAuthState();
      }
    } catch (e) {
      AppLogger.error('AuthProvider: 加载用户信息异常', error: e);
      _clearAuthState();
    }
  }

  /// 加载token到ApiService
  Future<void> _loadTokenToApiService() async {
    try {
      final token = await SecureStorage.getString(AppConstants.tokenKey);
      if (token != null && token.isNotEmpty) {
        // 设置API服务的访问令牌
        _apiService.setAccessToken(token);
        AppLogger.info('AuthProvider: Token已加载到ApiService');
      }
    } catch (e) {
      AppLogger.error('AuthProvider: 加载Token到ApiService失败', error: e);
    }
  }

  /// 清除认证状态
  void _clearAuthState() {
    _isLoggedIn = false;
    _currentUser = null;
    _loginResponse = null;
    _clearError();
    AppLogger.info('AuthProvider: 认证状态已清除');
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
    if (_currentUser == null) return '未知用户';
    return _currentUser!.displayName.isNotEmpty 
        ? _currentUser!.displayName 
        : _currentUser!.email.split('@').first;
  }

  /// 检查用户是否活跃
  bool get isUserActive {
    return _currentUser?.isActive ?? false;
  }
}