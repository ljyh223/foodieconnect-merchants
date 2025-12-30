import 'dart:io';
import 'package:dio/dio.dart';
import '../models/menu/menu_item_request.dart';
import '../models/menu/menu_category_request.dart';
import '../network/dio_client.dart';

/// 菜单API服务
class MenuApi {
  /// 获取菜品列表
  static Future<Map<String, dynamic>> getMenuItems({
    int page = 0,
    int size = 20,
    String? categoryId,
    String? keyword,
    bool? isAvailable,
    bool? isRecommended,
  }) async {
    final Map<String, dynamic> queryParameters = {'page': page, 'size': size};

    if (categoryId != null) {
      queryParameters['categoryId'] = categoryId;
    }
    if (keyword != null && keyword.isNotEmpty) {
      queryParameters['keyword'] = keyword;
    }
    if (isAvailable != null) {
      queryParameters['isAvailable'] = isAvailable;
    }
    if (isRecommended != null) {
      queryParameters['isRecommended'] = isRecommended;
    }

    final response = await DioClient.dio.get<Map<String, dynamic>>(
      '/merchant/menu/items',
      queryParameters: queryParameters,
    );
    return response.data!;
  }

  /// 创建菜品
  static Future<Map<String, dynamic>> createMenuItem(
    MenuItemRequest request,
  ) async {
    final response = await DioClient.dio.post<Map<String, dynamic>>(
      '/merchant/menu/items',
      data: request.toJson(),
    );
    return response.data!;
  }

  /// 更新菜品
  static Future<Map<String, dynamic>> updateMenuItem(
    int itemId,
    MenuItemRequest request,
  ) async {
    final response = await DioClient.dio.put<Map<String, dynamic>>(
      '/merchant/menu/items/$itemId',
      data: request.toJson(),
    );
    return response.data!;
  }

  /// 删除菜品
  static Future<Map<String, dynamic>> deleteMenuItem(int itemId) async {
    final response = await DioClient.dio.delete<Map<String, dynamic>>(
      '/merchant/menu/items/$itemId',
    );
    return response.data!;
  }

  /// 切换菜品状态
  static Future<Map<String, dynamic>> toggleMenuItemStatus(
    int itemId,
    bool isAvailable,
  ) async {
    final response = await DioClient.dio.put<Map<String, dynamic>>(
      '/merchant/menu/items/$itemId/status',
      queryParameters: {'isAvailable': isAvailable},
    );
    return response.data!;
  }

  /// 设置推荐菜品
  static Future<Map<String, dynamic>> setRecommendedMenuItem(
    int itemId,
    bool isRecommended,
  ) async {
    final response = await DioClient.dio.put<Map<String, dynamic>>(
      '/merchant/menu/items/$itemId/recommended',
      queryParameters: {'isRecommended': isRecommended},
    );
    return response.data!;
  }

  /// 获取所有菜品
  static Future<Map<String, dynamic>> getAllMenuItems() async {
    final response = await DioClient.dio.get<Map<String, dynamic>>(
      '/merchant/menu/items/all',
    );
    return response.data!;
  }

  /// 获取分类列表
  static Future<Map<String, dynamic>> getCategories() async {
    final response = await DioClient.dio.get<Map<String, dynamic>>(
      '/merchant/menu/categories',
    );
    return response.data!;
  }

  /// 创建分类
  static Future<Map<String, dynamic>> createCategory(
    MenuCategoryRequest request,
  ) async {
    final response = await DioClient.dio.post<Map<String, dynamic>>(
      '/merchant/menu/categories',
      data: request.toJson(),
    );
    return response.data!;
  }

  /// 更新分类
  static Future<Map<String, dynamic>> updateCategory(
    int categoryId,
    MenuCategoryRequest request,
  ) async {
    final response = await DioClient.dio.put<Map<String, dynamic>>(
      '/merchant/menu/categories/$categoryId',
      data: request.toJson(),
    );
    return response.data!;
  }

  /// 删除分类
  static Future<Map<String, dynamic>> deleteCategory(int categoryId) async {
    final response = await DioClient.dio.delete<Map<String, dynamic>>(
      '/merchant/menu/categories/$categoryId',
    );
    return response.data!;
  }

  /// 切换分类状态
  static Future<Map<String, dynamic>> toggleCategoryStatus(
    int categoryId,
    bool isActive,
  ) async {
    final response = await DioClient.dio.put<Map<String, dynamic>>(
      '/merchant/menu/categories/$categoryId/status',
      data: {'isActive': isActive},
    );
    return response.data!;
  }

  /// 上传菜品图片
  static Future<Map<String, dynamic>> uploadMenuItemImage(
    File imageFile,
  ) async {
    final response = await DioClient.dio.post<Map<String, dynamic>>(
      '/merchant/upload/image',
      data: FormData.fromMap({
        'file': await MultipartFile.fromFile(imageFile.path),
      }),
    );
    return response.data!;
  }
}
