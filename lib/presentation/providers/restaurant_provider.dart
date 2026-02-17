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

      AppLogger.info('RestaurantProvider: Starting to load restaurant information');

      final response = await _restaurantService.getRestaurant();

      if (response.isSuccess && response.data != null) {
        _restaurant = response.data;
        AppLogger.info('RestaurantProvider: Restaurant information loaded successfully');
      } else {
        _setError(response.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: Failed to load restaurant information - ${response.errorMessage}',
        );
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('RestaurantProvider: Error loading restaurant information', error: e);
      _setError('Failed to load restaurant information, please try again later');
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Update restaurant information
  Future<bool> updateRestaurant(RestaurantUpdateRequest request) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('RestaurantProvider: Starting to update restaurant information');

      final response = await _restaurantService.updateRestaurant(request);

      if (response.isSuccess && response.data != null) {
        _restaurant = response.data;
        AppLogger.info('RestaurantProvider: Restaurant information updated successfully');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: Failed to update restaurant information - ${response.errorMessage}',
        );
        return false;
      }
    } catch (e) {
      AppLogger.error('RestaurantProvider: Exception updating restaurant information', error: e);
      _setError('Failed to update restaurant information, please try again later');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Update restaurant business status
  Future<bool> updateRestaurantStatus(bool isOpen) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('RestaurantProvider: Starting to update restaurant business status');

      final response = await _restaurantService.updateRestaurantStatus(isOpen);

      if (response.isSuccess) {
        // Update local state
        if (_restaurant != null) {
          _restaurant = _restaurant!.copyWith(isOpen: isOpen);
          AppLogger.info('RestaurantProvider: Restaurant business status updated successfully');
          notifyListeners();
        }
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: Failed to update restaurant business status - ${response.errorMessage}',
        );
        return false;
      }
    } catch (e) {
      AppLogger.error('RestaurantProvider: Exception updating restaurant business status', error: e);
      _setError('Failed to update business status, please try again later');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Toggle restaurant business status
  Future<bool> toggleRestaurantStatus() async {
    if (_restaurant == null) {
      _setError('Restaurant information not loaded');
      return false;
    }

    final newStatus = !_restaurant!.isCurrentlyOpen;
    return await updateRestaurantStatus(newStatus);
  }

  /// Update restaurant image
  Future<bool> updateRestaurantImage(dynamic imageFile) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('RestaurantProvider: Starting to upload restaurant image');

      // Convert XFile to File
      File? file;
      if (imageFile is XFile) {
        file = File(imageFile.path);
      } else if (imageFile is File) {
        file = imageFile;
      } else {
        _setError('Unsupported image type');
        AppLogger.error(
          'RestaurantProvider: Unsupported image type - ${imageFile.runtimeType}',
        );
        return false;
      }

      // Step 1: Upload image file
      final uploadResponse = await _restaurantService.uploadImage(file);

      if (!uploadResponse.isSuccess || uploadResponse.data?.isEmpty != false) {
        final errorMessage = uploadResponse.errorMessage.isNotEmpty == true
            ? uploadResponse.errorMessage
            : 'Image upload failed';
        _setError(errorMessage);
        AppLogger.warning('RestaurantProvider: Image upload failed - $errorMessage');
        return false;
      }

      final imageUrl = uploadResponse.data!;
      AppLogger.info('RestaurantProvider: Image uploaded successfully, URL: $imageUrl');

      // Step 2: Update restaurant image URL
      final updateResponse = await _restaurantService.updateRestaurantImageUrl(
        imageUrl,
      );

      if (updateResponse.isSuccess) {
        // Update local state
        if (_restaurant != null) {
          _restaurant = _restaurant!.copyWith(imageUrl: imageUrl);
          AppLogger.info('RestaurantProvider: Restaurant image updated successfully');
          notifyListeners();
        }
        return true;
      } else {
        _setError(updateResponse.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: Failed to update restaurant image URL - ${updateResponse.errorMessage}',
        );
        return false;
      }
    } catch (e) {
      AppLogger.error('RestaurantProvider: Exception updating restaurant image', error: e);
      _setError('Failed to update restaurant image, please try again later');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// Refresh restaurant information
  Future<void> refreshRestaurant() async {
    await loadRestaurant();
  }

  /// Get restaurant display name
  String get restaurantDisplayName {
    if (_restaurant == null) return 'Unknown restaurant';
    return _restaurant!.name.isNotEmpty ? _restaurant!.name : 'Unnamed restaurant';
  }

  /// Get restaurant type display
  String get restaurantTypeDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.type.isNotEmpty ? _restaurant!.type : 'Uncategorized';
  }

  /// Get restaurant address display
  String get restaurantAddressDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.address.isNotEmpty ? _restaurant!.address : 'Address not set';
  }

  /// Get restaurant phone display
  String get restaurantPhoneDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.phone.isNotEmpty ? _restaurant!.phone : 'Phone not set';
  }

  /// Get restaurant business hours display
  String get restaurantHoursDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.hours?.isNotEmpty == true
        ? _restaurant!.hours!
        : 'Business hours not set';
  }

  /// Get restaurant description display
  String get restaurantDescriptionDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.description?.isNotEmpty == true
        ? _restaurant!.description!
        : 'No description';
  }

  /// Get restaurant status display
  String get restaurantStatusDisplay {
    if (_restaurant == null) return '';
    return _restaurant!.isCurrentlyOpen ? 'Open' : 'Closed';
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

  /// Load chat room verification code
  Future<void> loadChatRoomVerificationCode() async {
    try {
      _setLoading(true);
      _clearError();

      AppLogger.info('RestaurantProvider: Starting to load chat room verification code');

      final response = await _restaurantService.getChatRoomVerificationCode();

      if (response.isSuccess && response.data?.isNotEmpty == true) {
        _chatRoomVerificationCode = response.data;
        AppLogger.info('RestaurantProvider: Chat room verification code loaded successfully');
      } else {
        _setError(response.errorMessage);
        AppLogger.warning(
          'RestaurantProvider: Failed to load chat room verification code - ${response.errorMessage}',
        );
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('RestaurantProvider: Exception loading chat room verification code', error: e);
      _setError('Failed to load chat room verification code, please try again later');
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// Reset state
  void reset() {
    _isLoading = false;
    _isUpdating = false;
    _errorMessage = null;
    _restaurant = null;
    _chatRoomVerificationCode = null;
    notifyListeners();
    AppLogger.info('RestaurantProvider: State has been reset');
  }
}
