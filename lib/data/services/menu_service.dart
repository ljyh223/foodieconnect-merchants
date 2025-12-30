import 'package:dio/dio.dart';
import 'dart:io';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/models/menu/menu_item_model.dart';
import 'package:foodieconnect/data/models/menu/menu_item_request.dart';
import 'package:foodieconnect/data/models/menu/menu_category_model.dart';
import 'package:foodieconnect/data/models/menu/menu_category_request.dart';
import 'package:foodieconnect/data/models/common/api_response.dart';
import 'package:foodieconnect/data/repository/menu_repository.dart';

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
      AppLogger.info('MenuService: 获取菜品列表');

      final responseData = await _menuRepository.getMenuItems(
        page: page,
        size: size,
        categoryId: categoryId,
        keyword: keyword,
        isAvailable: isAvailable,
        isRecommended: isRecommended,
      );

      AppLogger.debug('MenuService: API响应数据 - $responseData');

      final apiResponse = ApiResponse<List<MenuItemModel>>.fromJson(
        responseData,
        (json) {
          if (json is List) {
            AppLogger.debug('MenuService: 解析菜品列表 - ${json.length} 项');
            if (json.isNotEmpty) {
              AppLogger.debug('MenuService: 第一项数据 - ${json.first}');
            }
            return (json)
                .map(
                  (item) =>
                      MenuItemModel.fromJson(item as Map<String, dynamic>),
                )
                .toList();
          }
          AppLogger.debug('MenuService: 返回数据不是列表格式');
          return <MenuItemModel>[];
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 获取菜品列表成功 - ${apiResponse.data?.length} 项');
      } else {
        AppLogger.warning(
          'MenuService: 获取菜品列表失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 获取菜品列表错误', error: e);
      return ApiResponse.error('获取菜品列表失败，请稍后重试');
    }
  }

  /// 创建菜品
  Future<ApiResponse<MenuItemModel>> createMenuItem(
    MenuItemRequest request,
  ) async {
    try {
      AppLogger.info('MenuService: 创建菜品 - ${request.name}');

      final responseData = await _menuRepository.createMenuItem(request);

      final apiResponse = ApiResponse<MenuItemModel>.fromJson(
        responseData,
        (json) => MenuItemModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 创建菜品成功');
      } else {
        AppLogger.warning('MenuService: 创建菜品失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 创建菜品错误', error: e);
      return ApiResponse.error('创建菜品失败，请稍后重试');
    }
  }

  /// 更新菜品
  Future<ApiResponse<MenuItemModel>> updateMenuItem(
    int itemId,
    MenuItemRequest request,
  ) async {
    try {
      AppLogger.info('MenuService: 更新菜品 - $itemId');

      final responseData = await _menuRepository.updateMenuItem(
        itemId,
        request,
      );

      final apiResponse = ApiResponse<MenuItemModel>.fromJson(
        responseData,
        (json) => MenuItemModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 更新菜品成功');
      } else {
        AppLogger.warning('MenuService: 更新菜品失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 更新菜品错误', error: e);
      return ApiResponse.error('更新菜品失败，请稍后重试');
    }
  }

  /// 删除菜品
  Future<ApiResponse<void>> deleteMenuItem(int itemId) async {
    try {
      AppLogger.info('MenuService: 删除菜品 - $itemId');

      final responseData = await _menuRepository.deleteMenuItem(itemId);

      final apiResponse = ApiResponse<void>.fromJson(responseData, (json) {});

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 删除菜品成功');
      } else {
        AppLogger.warning('MenuService: 删除菜品失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 删除菜品错误', error: e);
      return ApiResponse.error('删除菜品失败，请稍后重试');
    }
  }

  /// 切换菜品状态
  Future<ApiResponse<void>> toggleMenuItemStatus(
    int itemId,
    bool isAvailable,
  ) async {
    try {
      AppLogger.info('MenuService: 切换菜品状态 - $itemId, $isAvailable');

      final responseData = await _menuRepository.toggleMenuItemStatus(
        itemId,
        isAvailable,
      );

      final apiResponse = ApiResponse<void>.fromJson(responseData, (json) {});

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 切换菜品状态成功');
      } else {
        AppLogger.warning(
          'MenuService: 切换菜品状态失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 切换菜品状态错误', error: e);
      return ApiResponse.error('切换菜品状态失败，请稍后重试');
    }
  }

  /// 设置推荐菜品
  Future<ApiResponse<void>> setRecommendedMenuItem(
    int itemId,
    bool isRecommended,
  ) async {
    try {
      AppLogger.info('MenuService: 设置推荐菜品 - $itemId, $isRecommended');

      final responseData = await _menuRepository.setRecommendedMenuItem(
        itemId,
        isRecommended,
      );

      final apiResponse = ApiResponse<void>.fromJson(responseData, (json) {});

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 设置推荐菜品成功');
      } else {
        AppLogger.warning(
          'MenuService: 设置推荐菜品失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 设置推荐菜品错误', error: e);
      return ApiResponse.error('设置推荐菜品失败，请稍后重试');
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
      AppLogger.info('MenuService: 获取所有菜品');

      final responseData = await _menuRepository.getAllMenuItems();

      final apiResponse = ApiResponse<List<MenuItemModel>>.fromJson(
        responseData,
        (json) {
          if (json is List) {
            return (json)
                .map(
                  (item) =>
                      MenuItemModel.fromJson(item as Map<String, dynamic>),
                )
                .toList();
          }
          return <MenuItemModel>[];
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 获取所有菜品成功 - ${apiResponse.data?.length} 项');
      } else {
        AppLogger.warning(
          'MenuService: 获取所有菜品失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 获取所有菜品错误', error: e);
      return ApiResponse.error('获取所有菜品失败，请稍后重试');
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

    return '未知错误';
  }

  // ==================== 分类管理相关方法 ====================

  /// 获取分类列表
  Future<ApiResponse<List<MenuCategoryModel>>> getCategories() async {
    try {
      AppLogger.info('MenuService: 获取分类列表');

      final responseData = await _menuRepository.getCategories();

      final apiResponse = ApiResponse<List<MenuCategoryModel>>.fromJson(
        responseData,
        (json) {
          if (json is List) {
            return (json)
                .map(
                  (item) =>
                      MenuCategoryModel.fromJson(item as Map<String, dynamic>),
                )
                .toList();
          }
          return <MenuCategoryModel>[];
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 获取分类列表成功 - ${apiResponse.data?.length} 项');
      } else {
        AppLogger.warning(
          'MenuService: 获取分类列表失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 获取分类列表错误', error: e);
      return ApiResponse.error('获取分类列表失败，请稍后重试');
    }
  }

  // ==================== 图片上传相关方法 ====================

  /// 上传菜品图片并返回图片URL
  Future<ApiResponse<String>> uploadMenuItemImage(File imageFile) async {
    try {
      AppLogger.info(
        'MenuService: 上传菜品图片 - 文件大小: ${imageFile.lengthSync()} bytes',
      );

      final responseData = await _menuRepository.uploadMenuItemImage(imageFile);

      AppLogger.debug('MenuService: 图片上传响应 - $responseData');

      final apiResponse = ApiResponse<String>.fromJson(responseData, (json) {
        AppLogger.debug('MenuService: 解析图片上传响应 - $json');

        // 根据API契约，/upload/image返回ApiResponseMapStringString格式
        if (json is Map<String, dynamic>) {
          // 尝试从data字段中获取图片URL
          if (json.containsKey('data') && json['data'] is Map) {
            final data = json['data'] as Map<String, dynamic>;
            AppLogger.debug('MenuService: 解析data字段 - $data');

            // 常见的字段名可能是imageUrl、url、path等
            if (data.containsKey('imageUrl')) {
              final url = data['imageUrl'] as String;
              AppLogger.info('MenuService: 从imageUrl字段获取URL - $url');
              return url;
            } else if (data.containsKey('url')) {
              final url = data['url'] as String;
              AppLogger.info('MenuService: 从url字段获取URL - $url');
              return url;
            } else if (data.containsKey('path')) {
              final url = data['path'] as String;
              AppLogger.info('MenuService: 从path字段获取URL - $url');
              return url;
            }
            // 如果没有找到明确的字段，取第一个值
            if (data.isNotEmpty) {
              final url = data.values.first as String;
              AppLogger.info('MenuService: 从第一个值获取URL - $url');
              return url;
            }
          }

          // 直接在根级别查找
          if (json.containsKey('imageUrl')) {
            final url = json['imageUrl'] as String;
            AppLogger.info('MenuService: 从根级别imageUrl字段获取URL - $url');
            return url;
          } else if (json.containsKey('url')) {
            final url = json['url'] as String;
            AppLogger.info('MenuService: 从根级别url字段获取URL - $url');
            return url;
          } else if (json.containsKey('path')) {
            final url = json['path'] as String;
            AppLogger.info('MenuService: 从根级别path字段获取URL - $url');
            return url;
          }
        }

        AppLogger.warning('MenuService: 无法解析图片URL，返回原始响应');
        return json.toString();
      });

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 菜品图片上传成功 - ${apiResponse.data}');
      } else {
        AppLogger.warning(
          'MenuService: 菜品图片上传失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 菜品图片上传网络错误', error: e);
      AppLogger.error('MenuService: HTTP状态码 - ${e.response?.statusCode}');
      AppLogger.error('MenuService: 错误响应 - ${e.response?.data}');

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      return ApiResponse.error('图片上传失败，请检查网络连接和权限');
    } catch (e) {
      AppLogger.error('MenuService: 菜品图片上传未知错误', error: e);
      return ApiResponse.error('图片上传失败，请稍后重试');
    }
  }

  /// 创建分类
  Future<ApiResponse<MenuCategoryModel>> createCategory(
    MenuCategoryRequest request,
  ) async {
    try {
      AppLogger.info('MenuService: 创建分类 - ${request.name}');

      final responseData = await _menuRepository.createCategory(request);

      final apiResponse = ApiResponse<MenuCategoryModel>.fromJson(
        responseData,
        (json) => MenuCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 创建分类成功');
      } else {
        AppLogger.warning('MenuService: 创建分类失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 创建分类错误', error: e);
      return ApiResponse.error('创建分类失败，请稍后重试');
    }
  }

  /// 更新分类
  Future<ApiResponse<MenuCategoryModel>> updateCategory(
    int categoryId,
    MenuCategoryRequest request,
  ) async {
    try {
      AppLogger.info('MenuService: 更新分类 - $categoryId');

      final responseData = await _menuRepository.updateCategory(
        categoryId,
        request,
      );

      final apiResponse = ApiResponse<MenuCategoryModel>.fromJson(
        responseData,
        (json) => MenuCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 更新分类成功');
      } else {
        AppLogger.warning('MenuService: 更新分类失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 更新分类错误', error: e);
      return ApiResponse.error('更新分类失败，请稍后重试');
    }
  }

  /// 删除分类
  Future<ApiResponse<void>> deleteCategory(int categoryId) async {
    try {
      AppLogger.info('MenuService: 删除分类 - $categoryId');

      final responseData = await _menuRepository.deleteCategory(categoryId);

      final apiResponse = ApiResponse<void>.fromJson(responseData, (json) {});

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 删除分类成功');
      } else {
        AppLogger.warning('MenuService: 删除分类失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 删除分类错误', error: e);
      return ApiResponse.error('删除分类失败，请稍后重试');
    }
  }

  /// 切换分类状态
  Future<ApiResponse<void>> toggleCategoryStatus(
    int categoryId,
    bool isActive,
  ) async {
    try {
      AppLogger.info('MenuService: 切换分类状态 - $categoryId, $isActive');

      final responseData = await _menuRepository.toggleCategoryStatus(
        categoryId,
        isActive,
      );

      final apiResponse = ApiResponse<void>.fromJson(responseData, (json) {});

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 切换分类状态成功');
      } else {
        AppLogger.warning(
          'MenuService: 切换分类状态失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } catch (e) {
      AppLogger.error('MenuService: 切换分类状态错误', error: e);
      return ApiResponse.error('切换分类状态失败，请稍后重试');
    }
  }
}
