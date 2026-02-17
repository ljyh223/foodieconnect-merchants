import 'package:dio/dio.dart';
import 'dart:io';
import 'package:foodieconnectmerchant/core/utils/logger.dart';
import 'package:foodieconnectmerchant/data/models/menu/menu_item_model.dart';
import 'package:foodieconnectmerchant/data/models/menu/menu_item_request.dart';
import 'package:foodieconnectmerchant/data/models/menu/menu_category_model.dart';
import 'package:foodieconnectmerchant/data/models/menu/menu_category_request.dart';
import 'package:foodieconnectmerchant/data/models/common/api_response.dart';
import 'package:foodieconnectmerchant/data/repository/menu_repository.dart';

/// 菜单服务类
class MenuService {
  final MenuRepository _menuRepository = MenuRepository();

  /// 获取菜品列表
  Future<ApiResponse<List<MenuItemModel>>> getMenuItems({
    int page = 0,
    int size = 20,
    String? categoryId,
    String? keyword,
    bool? isAvailable,
    bool? isRecommended,
  }) async {
    try {
      AppLogger.info('MenuService: Fetching menu items');

      final result = await _menuRepository.getMenuItems(
        page: page,
        size: size,
        categoryId: categoryId,
        keyword: keyword,
        isAvailable: isAvailable,
        isRecommended: isRecommended,
      );

      return result.when(
        loading: () {
          return ApiResponse.error('Loading');
        },
        success: (data) {
          AppLogger.info('MenuService: Successfully fetched menu items - ${data.length} items');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to fetch menu items - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error fetching menu items', error: e);
      return ApiResponse.error('Failed to fetch menu items, please try again later');
    }
  }

  /// 创建菜品
  Future<ApiResponse<MenuItemModel>> createMenuItem(
    MenuItemRequest request,
  ) async {
    try {
      AppLogger.info('MenuService: Creating menu item - ${request.name}');

      final result = await _menuRepository.createMenuItem(request);

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (data) {
          AppLogger.info('MenuService: Successfully created menu item');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to create menu item - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error creating menu item', error: e);
      return ApiResponse.error('Failed to create menu item, please try again later');
    }
  }

  /// 更新菜品
  Future<ApiResponse<MenuItemModel>> updateMenuItem(
    int itemId,
    MenuItemRequest request,
  ) async {
    try {
      AppLogger.info('MenuService: Updating menu item - $itemId');

      final result = await _menuRepository.updateMenuItem(itemId, request);

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (data) {
          AppLogger.info('MenuService: Successfully updated menu item');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to update menu item - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error updating menu item', error: e);
      return ApiResponse.error('Failed to update menu item, please try again later');
    }
  }

  /// 删除菜品
  Future<ApiResponse<void>> deleteMenuItem(int itemId) async {
    try {
      AppLogger.info('MenuService: Deleting menu item - $itemId');

      final result = await _menuRepository.deleteMenuItem(itemId);

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (_) {
          AppLogger.info('MenuService: Successfully deleted menu item');
          return ApiResponse.success(null);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to delete menu item - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error deleting menu item', error: e);
      return ApiResponse.error('Failed to delete menu item, please try again later');
    }
  }

  /// 切换菜品状态
  Future<ApiResponse<void>> toggleMenuItemStatus(
    int itemId,
    bool isAvailable,
  ) async {
    try {
      AppLogger.info('MenuService: Toggling menu item status - $itemId, $isAvailable');

      final result = await _menuRepository.toggleMenuItemStatus(
        itemId,
        isAvailable,
      );

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (_) {
          AppLogger.info('MenuService: Successfully toggled menu item status');
          return ApiResponse.success(null);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to toggle menu item status - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error toggling menu item status', error: e);
      return ApiResponse.error('Failed to toggle menu item status, please try again later');
    }
  }

  /// 设置推荐菜品
  Future<ApiResponse<void>> setRecommendedMenuItem(
    int itemId,
    bool isRecommended,
  ) async {
    try {
      AppLogger.info('MenuService: Setting recommended menu item - $itemId, $isRecommended');

      final result = await _menuRepository.setRecommendedMenuItem(
        itemId,
        isRecommended,
      );

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (_) {
          AppLogger.info('MenuService: Successfully set recommended menu item');
          return ApiResponse.success(null);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to set recommended menu item - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error setting recommended menu item', error: e);
      return ApiResponse.error('Failed to set recommended menu item, please try again later');
    }
  }

  /// 搜索菜品
  Future<ApiResponse<List<MenuItemModel>>> searchMenuItems(
    String keyword, {
    int page = 0,
    int size = 20,
  }) async {
    return getMenuItems(page: page, size: size, keyword: keyword);
  }

  /// 获取推荐菜品
  Future<ApiResponse<List<MenuItemModel>>> getRecommendedMenuItems({
    int page = 0,
    int size = 20,
  }) async {
    return getMenuItems(page: page, size: size, isRecommended: true);
  }

  /// 根据分类获取菜品
  Future<ApiResponse<List<MenuItemModel>>> getMenuItemsByCategory(
    String categoryId, {
    int page = 0,
    int size = 20,
  }) async {
    return getMenuItems(page: page, size: size, categoryId: categoryId);
  }

  /// 获取所有菜品
  Future<ApiResponse<List<MenuItemModel>>> getAllMenuItems() async {
    try {
      AppLogger.info('MenuService: Fetching all menu items');

      final result = await _menuRepository.getAllMenuItems();

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (data) {
          AppLogger.info('MenuService: Successfully fetched all menu items - ${data.length} items');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to fetch all menu items - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error fetching all menu items', error: e);
      return ApiResponse.error('Failed to fetch all menu items, please try again later');
    }
  }

  /// 从错误响应中提取错误信息
  String _extractErrorMessage(Map<String, dynamic> errorData) {
    if (errorData.containsKey('error') && errorData['error'] is Map) {
      final error = errorData['error'] as Map;
      if (error.containsKey('message')) {
        return error['message'] as String;
      }
    }

    if (errorData.containsKey('message')) {
      return errorData['message'] as String;
    }

    return 'Unknown error';
  }

  // ==================== 分类管理相关方法 ====================

  /// 获取分类列表
  Future<ApiResponse<List<MenuCategoryModel>>> getCategories() async {
    try {
      AppLogger.info('MenuService: Fetching categories');

      final result = await _menuRepository.getCategories();

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (data) {
          AppLogger.info('MenuService: Successfully fetched categories - ${data.length} items');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to fetch categories - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error fetching categories', error: e);
      return ApiResponse.error('Failed to fetch categories, please try again later');
    }
  }

  // ==================== 图片上传相关方法 ====================

  /// 上传菜品图片并返回图片URL
  Future<ApiResponse<String>> uploadMenuItemImage(File imageFile) async {
    try {
      AppLogger.info(
        'MenuService: Uploading menu item image - File size: ${imageFile.lengthSync()} bytes',
      );

      final result = await _menuRepository.uploadMenuItemImage(imageFile);

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (data) {
          AppLogger.debug('MenuService: Image upload successful response - $data');
          String imageUrl = '';

          // Try to extract image URL from data field
          if (data.containsKey('data') && data['data'] is Map) {
            final responseData = data['data'] as Map<String, dynamic>;
            AppLogger.debug('MenuService: Parsing data field - $responseData');

            // Common field names might be imageUrl, url, path, etc.
            if (responseData.containsKey('imageUrl')) {
              imageUrl = responseData['imageUrl'] as String;
            } else if (responseData.containsKey('url')) {
              imageUrl = responseData['url'] as String;
            } else if (responseData.containsKey('path')) {
              imageUrl = responseData['path'] as String;
            } else if (responseData.isNotEmpty) {
              // If no explicit field found, take the first value
              imageUrl = responseData.values.first as String;
            }
          } else if (data.containsKey('imageUrl')) {
            // Search directly at root level
            imageUrl = data['imageUrl'] as String;
          } else if (data.containsKey('url')) {
            imageUrl = data['url'] as String;
          } else if (data.containsKey('path')) {
            imageUrl = data['path'] as String;
          }

          if (imageUrl.isEmpty) {
            AppLogger.warning('MenuService: Unable to parse image URL, returning empty string');
          } else {
            AppLogger.info('MenuService: Menu item image uploaded successfully - $imageUrl');
          }

          return ApiResponse.success(imageUrl);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to upload menu item image - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } on DioException catch (e) {
      AppLogger.error('MenuService: Network error uploading menu item image', error: e);
      AppLogger.error('MenuService: HTTP status code - ${e.response?.statusCode}');
      AppLogger.error('MenuService: Error response - ${e.response?.data}');

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      return ApiResponse.error('Image upload failed, please check network connection and permissions');
    } catch (e) {
      AppLogger.error('MenuService: Unknown error uploading menu item image', error: e);
      return ApiResponse.error('Image upload failed, please try again later');
    }
  }

  /// 创建分类
  Future<ApiResponse<MenuCategoryModel>> createCategory(
    MenuCategoryRequest request,
  ) async {
    try {
      AppLogger.info('MenuService: Creating category - ${request.name}');

      final result = await _menuRepository.createCategory(request);

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (data) {
          AppLogger.info('MenuService: Successfully created category');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to create category - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error creating category', error: e);
      return ApiResponse.error('Failed to create category, please try again later');
    }
  }

  /// 更新分类
  Future<ApiResponse<MenuCategoryModel>> updateCategory(
    int categoryId,
    MenuCategoryRequest request,
  ) async {
    try {
      AppLogger.info('MenuService: Updating category - $categoryId');

      final result = await _menuRepository.updateCategory(categoryId, request);

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (data) {
          AppLogger.info('MenuService: Successfully updated category');
          return ApiResponse.success(data);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to update category - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error updating category', error: e);
      return ApiResponse.error('Failed to update category, please try again later');
    }
  }

  /// 删除分类
  Future<ApiResponse<void>> deleteCategory(int categoryId) async {
    try {
      AppLogger.info('MenuService: Deleting category - $categoryId');

      final result = await _menuRepository.deleteCategory(categoryId);

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (_) {
          AppLogger.info('MenuService: Successfully deleted category');
          return ApiResponse.success(null);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to delete category - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error deleting category', error: e);
      return ApiResponse.error('Failed to delete category, please try again later');
    }
  }

  /// 切换分类状态
  Future<ApiResponse<void>> toggleCategoryStatus(
    int categoryId,
    bool isActive,
  ) async {
    try {
      AppLogger.info('MenuService: Toggling category status - $categoryId, $isActive');

      final result = await _menuRepository.toggleCategoryStatus(
        categoryId,
        isActive,
      );

      return result.when(
        loading: () => ApiResponse.error('Loading'),
        success: (_) {
          AppLogger.info('MenuService: Successfully toggled category status');
          return ApiResponse.success(null);
        },
        error: (message, code, details) {
          AppLogger.warning('MenuService: Failed to toggle category status - $message');
          return ApiResponse.error(message, code: code);
        },
      );
    } catch (e) {
      AppLogger.error('MenuService: Error toggling category status', error: e);
      return ApiResponse.error('Failed to toggle category status, please try again later');
    }
  }
}
