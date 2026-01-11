import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:foodieconnectmerchant/core/utils/logger.dart';
import 'package:foodieconnectmerchant/data/api/restaurant_api.dart';
import 'package:foodieconnectmerchant/data/models/restaurant/restaurant_model.dart';
import 'package:foodieconnectmerchant/data/models/restaurant/restaurant_update_request.dart';
import 'package:foodieconnectmerchant/data/repository/restaurant_repository.dart';
import 'package:foodieconnectmerchant/data/services/restaurant_service.dart';

/// 餐厅状态管理Provider
class RestaurantProvider extends ChangeNotifier {
  late final RestaurantService _restaurantService;

  RestaurantProvider() {
    final restaurantApi = RestaurantApi();
    final restaurantRepository = RestaurantRepository(restaurantApi);
    _restaurantService = RestaurantService(restaurantRepository);
  }

  // 状态变量
  bool _isLoading = false;
  bool _isUpdating = false;
  String? _errorMessage;
  RestaurantModel? _restaurant;
  String? _chatRoomVerificationCode;

  // Getters
  bool get isLoading => _isLoading;
  bool get isUpdating => _isUpdating;
  String? get errorMessage => _errorMessage;
  RestaurantModel? get restaurant => _restaurant;
  String? get chatRoomVerificationCode => _chatRoomVerificationCode;

  /// 获取餐厅信息
  Future<void> loadRestaurant() async {
    try {
      _setLoading(true);
      _clearError();

      AppLogger.info('RestaurantProvider: 开始加载餐厅信息');

      final response = await _restaurantService.getRestaurant();

      if (response.isSuccess && response.data != null) {
        _restaurant = response.data;
        AppLogger.info('RestaurantProvider: 餐厅信息加载成功');
      } else {
        _setError(response.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: 餐厅信息加载失败 - ${response.errorMessage}',
        );
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('RestaurantProvider: 加载餐厅信息异常', error: e);
      _setError('加载餐厅信息失败，请稍后重试');
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// 更新餐厅信息
  Future<bool> updateRestaurant(RestaurantUpdateRequest request) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('RestaurantProvider: 开始更新餐厅信息');

      final response = await _restaurantService.updateRestaurant(request);

      if (response.isSuccess && response.data != null) {
        _restaurant = response.data;
        AppLogger.info('RestaurantProvider: 餐厅信息更新成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: 餐厅信息更新失败 - ${response.errorMessage}',
        );
        return false;
      }
    } catch (e) {
      AppLogger.error('RestaurantProvider: 更新餐厅信息异常', error: e);
      _setError('更新餐厅信息失败，请稍后重试');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 更新餐厅营业状态
  Future<bool> updateRestaurantStatus(bool isOpen) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('RestaurantProvider: 开始更新餐厅营业状态');

      final response = await _restaurantService.updateRestaurantStatus(isOpen);

      if (response.isSuccess) {
        // 更新本地状态
        if (_restaurant != null) {
          _restaurant = _restaurant!.copyWith(isOpen: isOpen);
          AppLogger.info('RestaurantProvider: 餐厅营业状态更新成功');
          notifyListeners();
        }
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: 餐厅营业状态更新失败 - ${response.errorMessage}',
        );
        return false;
      }
    } catch (e) {
      AppLogger.error('RestaurantProvider: 更新餐厅营业状态异常', error: e);
      _setError('更新营业状态失败，请稍后重试');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 切换餐厅营业状态
  Future<bool> toggleRestaurantStatus() async {
    if (_restaurant == null) {
      _setError('餐厅信息未加载');
      return false;
    }

    final newStatus = !_restaurant!.isCurrentlyOpen;
    return await updateRestaurantStatus(newStatus);
  }

  /// 更新餐厅图片
  Future<bool> updateRestaurantImage(dynamic imageFile) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('RestaurantProvider: 开始上传餐厅图片');

      // 转换 XFile 为 File
      File? file;
      if (imageFile is XFile) {
        file = File(imageFile.path);
      } else if (imageFile is File) {
        file = imageFile;
      } else {
        _setError('不支持的图片类型');
        AppLogger.error(
          'RestaurantProvider: 不支持的图片类型 - ${imageFile.runtimeType}',
        );
        return false;
      }

      // 第一步：上传图片文件
      final uploadResponse = await _restaurantService.uploadImage(file);

      if (!uploadResponse.isSuccess || uploadResponse.data?.isEmpty != false) {
        final errorMessage = uploadResponse.errorMessage.isNotEmpty == true
            ? uploadResponse.errorMessage
            : '图片上传失败';
        _setError(errorMessage);
        AppLogger.warning('RestaurantProvider: 图片上传失败 - $errorMessage');
        return false;
      }

      final imageUrl = uploadResponse.data!;
      AppLogger.info('RestaurantProvider: 图片上传成功，URL: $imageUrl');

      // 第二步：更新餐厅图片URL
      final updateResponse = await _restaurantService.updateRestaurantImageUrl(
        imageUrl,
      );

      if (updateResponse.isSuccess) {
        // 更新本地状态
        if (_restaurant != null) {
          _restaurant = _restaurant!.copyWith(imageUrl: imageUrl);
          AppLogger.info('RestaurantProvider: 餐厅图片更新成功');
          notifyListeners();
        }
        return true;
      } else {
        _setError(updateResponse.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: 餐厅图片URL更新失败 - ${updateResponse.errorMessage}',
        );
        return false;
      }
    } catch (e) {
      AppLogger.error('RestaurantProvider: 更新餐厅图片异常', error: e);
      _setError('更新餐厅图片失败，请稍后重试');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 刷新餐厅信息
  Future<void> refreshRestaurant() async {
    await loadRestaurant();
  }

  /// 获取餐厅显示名称
  String get restaurantDisplayName {
    if (_restaurant == null) return '未知餐厅';
    return _restaurant!.name.isNotEmpty ? _restaurant!.name : '未命名餐厅';
  }

  /// 获取餐厅类型显示
  String get restaurantTypeDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.type.isNotEmpty ? _restaurant!.type : '未分类';
  }

  /// 获取餐厅地址显示
  String get restaurantAddressDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.address.isNotEmpty ? _restaurant!.address : '地址未设置';
  }

  /// 获取餐厅电话显示
  String get restaurantPhoneDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.phone.isNotEmpty ? _restaurant!.phone : '电话未设置';
  }

  /// 获取餐厅营业时间显示
  String get restaurantHoursDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.hours?.isNotEmpty == true
        ? _restaurant!.hours!
        : '营业时间未设置';
  }

  /// 获取餐厅描述显示
  String get restaurantDescriptionDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.description?.isNotEmpty == true
        ? _restaurant!.description!
        : '暂无描述';
  }

  /// 获取餐厅状态显示
  String get restaurantStatusDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.isCurrentlyOpen ? '营业中' : '已打烊';
  }

  /// 获取餐厅评分显示
  String get restaurantRatingDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.ratingDisplay;
  }

  /// 获取餐厅评价数量显示
  String get restaurantReviewCountDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.reviewCountDisplay;
  }

  /// 检查餐厅是否营业
  bool get isRestaurantOpen {
    return _restaurant?.isCurrentlyOpen ?? false;
  }

  /// 检查是否有餐厅信息
  bool get hasRestaurantInfo {
    return _restaurant != null;
  }

  /// 检查是否有餐厅图片
  bool get hasRestaurantImage {
    return _restaurant?.displayImage?.isNotEmpty == true;
  }

  /// 获取餐厅图片URL
  String? get restaurantImageUrl {
    return _restaurant?.displayImage;
  }

  /// 设置加载状态
  void _setLoading(bool loading) {
    if (_isLoading != loading) {
      _isLoading = loading;
      _scheduleNotifyListeners();
    }
  }

  /// 设置更新状态
  void _setUpdating(bool updating) {
    if (_isUpdating != updating) {
      _isUpdating = updating;
      _scheduleNotifyListeners();
    }
  }

  /// 设置错误信息
  void _setError(String error) {
    if (_errorMessage != error) {
      _errorMessage = error;
      _scheduleNotifyListeners();
    }
  }

  /// 清除错误信息
  void _clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      _scheduleNotifyListeners();
    }
  }

  /// 延迟通知监听器，避免在build阶段调用
  void _scheduleNotifyListeners() {
    Future.microtask(() {
      if (hasListeners) {
        notifyListeners();
      }
    });
  }

  /// 清除错误信息（公共方法）
  void clearError() {
    _clearError();
  }

  /// 获取聊天室验证码
  Future<void> loadChatRoomVerificationCode() async {
    try {
      _setLoading(true);
      _clearError();

      AppLogger.info('RestaurantProvider: 开始加载聊天室验证码');

      final response = await _restaurantService.getChatRoomVerificationCode();

      if (response.isSuccess && response.data?.isNotEmpty == true) {
        _chatRoomVerificationCode = response.data;
        AppLogger.info('RestaurantProvider: 聊天室验证码加载成功');
      } else {
        _setError(response.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: 聊天室验证码加载失败 - ${response.errorMessage}',
        );
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('RestaurantProvider: 加载聊天室验证码异常', error: e);
      _setError('加载聊天室验证码失败，请稍后重试');
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// 更新聊天室验证码
  Future<bool> updateChatRoomVerificationCode(String verificationCode) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('RestaurantProvider: 开始更新聊天室验证码');

      final response = await _restaurantService.updateChatRoomVerificationCode(
        verificationCode,
      );

      if (response.isSuccess) {
        _chatRoomVerificationCode = verificationCode;
        AppLogger.info('RestaurantProvider: 聊天室验证码更新成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: 聊天室验证码更新失败 - ${response.errorMessage}',
        );
        return false;
      }
    } catch (e) {
      AppLogger.error('RestaurantProvider: 更新聊天室验证码异常', error: e);
      _setError('更新聊天室验证码失败，请稍后重试');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 重置状态
  void reset() {
    _isLoading = false;
    _isUpdating = false;
    _errorMessage = null;
    _restaurant = null;
    _chatRoomVerificationCode = null;
    notifyListeners();
    AppLogger.info('RestaurantProvider: 状态已重置');
  }
}
