import 'dart:io';
import '../api/menu_api.dart';
import '../models/menu/menu_item_request.dart';
import '../models/menu/menu_category_request.dart';
import '../models/menu/menu_item_model.dart';
import '../models/menu/menu_category_model.dart';
import '../models/common/api_result.dart';
import 'base_repository.dart';

/// 菜单Repository
class MenuRepository extends BaseRepository {
  /// 获取菜品列表
  Future<ApiResult<List<MenuItemModel>>> getMenuItems({
    int page = 0,
    int size = 20,
    String? categoryId,
    String? keyword,
    bool? isAvailable,
    bool? isRecommended,
  }) async {
    return safeListApiCall(
      () => MenuApi.getMenuItems(
        page: page,
        size: size,
        categoryId: categoryId,
        keyword: keyword,
        isAvailable: isAvailable,
        isRecommended: isRecommended,
      ),
      (data) => MenuItemModel.fromJson(data),
    );
  }

  /// 创建菜品
  Future<ApiResult<MenuItemModel>> createMenuItem(
    MenuItemRequest request,
  ) async {
    return safeApiCall(
      () => MenuApi.createMenuItem(request),
      (data) => MenuItemModel.fromJson(data),
    );
  }

  /// 更新菜品
  Future<ApiResult<MenuItemModel>> updateMenuItem(
    int itemId,
    MenuItemRequest request,
  ) async {
    return safeApiCall(
      () => MenuApi.updateMenuItem(itemId, request),
      (data) => MenuItemModel.fromJson(data),
    );
  }

  /// 删除菜品
  Future<ApiResult<void>> deleteMenuItem(int itemId) async {
    return safeApiCall(() => MenuApi.deleteMenuItem(itemId), (_) => null);
  }

  /// 切换菜品状态
  Future<ApiResult<void>> toggleMenuItemStatus(
    int itemId,
    bool isAvailable,
  ) async {
    return safeApiCall(
      () => MenuApi.toggleMenuItemStatus(itemId, isAvailable),
      (_) => null,
    );
  }

  /// 设置推荐菜品
  Future<ApiResult<void>> setRecommendedMenuItem(
    int itemId,
    bool isRecommended,
  ) async {
    return safeApiCall(
      () => MenuApi.setRecommendedMenuItem(itemId, isRecommended),
      (_) => null,
    );
  }

  /// 获取所有菜品
  Future<ApiResult<List<MenuItemModel>>> getAllMenuItems() async {
    return safeListApiCall(
      () => MenuApi.getAllMenuItems(),
      (data) => MenuItemModel.fromJson(data),
    );
  }

  /// 获取分类列表
  Future<ApiResult<List<MenuCategoryModel>>> getCategories() async {
    return safeListApiCall(
      () => MenuApi.getCategories(),
      (data) => MenuCategoryModel.fromJson(data),
    );
  }

  /// 创建分类
  Future<ApiResult<MenuCategoryModel>> createCategory(
    MenuCategoryRequest request,
  ) async {
    return safeApiCall(
      () => MenuApi.createCategory(request),
      (data) => MenuCategoryModel.fromJson(data),
    );
  }

  /// 更新分类
  Future<ApiResult<MenuCategoryModel>> updateCategory(
    int categoryId,
    MenuCategoryRequest request,
  ) async {
    return safeApiCall(
      () => MenuApi.updateCategory(categoryId, request),
      (data) => MenuCategoryModel.fromJson(data),
    );
  }

  /// 删除分类
  Future<ApiResult<void>> deleteCategory(int categoryId) async {
    return safeApiCall(() => MenuApi.deleteCategory(categoryId), (_) => null);
  }

  /// 切换分类状态
  Future<ApiResult<void>> toggleCategoryStatus(
    int categoryId,
    bool isActive,
  ) async {
    return safeApiCall(
      () => MenuApi.toggleCategoryStatus(categoryId, isActive),
      (_) => null,
    );
  }

  /// 上传菜品图片
  Future<ApiResult<Map<String, dynamic>>> uploadMenuItemImage(
    File imageFile,
  ) async {
    return safeApiCall(
      () => MenuApi.uploadMenuItemImage(imageFile),
      (data) => data,
    );
  }
}
