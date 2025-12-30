import 'dart:io';
import '../api/menu_api.dart';
import '../models/menu/menu_item_request.dart';
import '../models/menu/menu_category_request.dart';
import '../models/common/api_error.dart';
import 'package:dio/dio.dart';

/// 菜单Repository
class MenuRepository {
  /// 获取菜品列表
  Future<Map<String, dynamic>> getMenuItems({
    int page = 0,
    int size = 20,
    String? categoryId,
    String? keyword,
    bool? isAvailable,
    bool? isRecommended,
  }) async {
    try {
      return await MenuApi.getMenuItems(
        page: page,
        size: size,
        categoryId: categoryId,
        keyword: keyword,
        isAvailable: isAvailable,
        isRecommended: isRecommended,
      );
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 创建菜品
  Future<Map<String, dynamic>> createMenuItem(MenuItemRequest request) async {
    try {
      return await MenuApi.createMenuItem(request);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 更新菜品
  Future<Map<String, dynamic>> updateMenuItem(
    int itemId,
    MenuItemRequest request,
  ) async {
    try {
      return await MenuApi.updateMenuItem(itemId, request);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 删除菜品
  Future<Map<String, dynamic>> deleteMenuItem(int itemId) async {
    try {
      return await MenuApi.deleteMenuItem(itemId);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 切换菜品状态
  Future<Map<String, dynamic>> toggleMenuItemStatus(
    int itemId,
    bool isAvailable,
  ) async {
    try {
      return await MenuApi.toggleMenuItemStatus(itemId, isAvailable);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 设置推荐菜品
  Future<Map<String, dynamic>> setRecommendedMenuItem(
    int itemId,
    bool isRecommended,
  ) async {
    try {
      return await MenuApi.setRecommendedMenuItem(itemId, isRecommended);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 获取所有菜品
  Future<Map<String, dynamic>> getAllMenuItems() async {
    try {
      return await MenuApi.getAllMenuItems();
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 获取分类列表
  Future<Map<String, dynamic>> getCategories() async {
    try {
      return await MenuApi.getCategories();
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 创建分类
  Future<Map<String, dynamic>> createCategory(
    MenuCategoryRequest request,
  ) async {
    try {
      return await MenuApi.createCategory(request);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 更新分类
  Future<Map<String, dynamic>> updateCategory(
    int categoryId,
    MenuCategoryRequest request,
  ) async {
    try {
      return await MenuApi.updateCategory(categoryId, request);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 删除分类
  Future<Map<String, dynamic>> deleteCategory(int categoryId) async {
    try {
      return await MenuApi.deleteCategory(categoryId);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 切换分类状态
  Future<Map<String, dynamic>> toggleCategoryStatus(
    int categoryId,
    bool isActive,
  ) async {
    try {
      return await MenuApi.toggleCategoryStatus(categoryId, isActive);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }

  /// 上传菜品图片
  Future<Map<String, dynamic>> uploadMenuItemImage(File imageFile) async {
    try {
      return await MenuApi.uploadMenuItemImage(imageFile);
    } on DioException catch (e) {
      throw ApiError.fromDio(e);
    }
  }
}
