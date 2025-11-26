import 'package:dio/dio.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/models/menu/menu_item_model.dart';
import 'package:foodieconnect/data/models/menu/menu_item_request.dart';
import 'package:foodieconnect/data/models/menu/menu_category_model.dart';
import 'package:foodieconnect/data/models/menu/menu_category_request.dart';
import 'package:foodieconnect/data/models/common/api_response.dart';
import 'package:foodieconnect/data/services/api_service.dart';

/// 菜单服务类
class MenuService {
  final ApiService _apiService = ApiService();

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

      final Map<String, dynamic> queryParameters = {
        'page': page,
        'size': size,
      };

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

      final response = await _apiService.get<Map<String, dynamic>>(
        '/api/v1/merchant/menu/items',
        queryParameters: queryParameters,
      );

      AppLogger.debug('MenuService: API响应数据 - ${response.data}');

      final apiResponse = ApiResponse<List<MenuItemModel>>.fromJson(
        response.data!,
        (json) {
          if (json is List) {
            AppLogger.debug('MenuService: 解析菜品列表 - ${json.length} 项');
            if (json.isNotEmpty) {
              AppLogger.debug('MenuService: 第一项数据 - ${json.first}');
            }
            return (json)
                .map((item) => MenuItemModel.fromJson(item as Map<String, dynamic>))
                .toList();
          }
          AppLogger.debug('MenuService: 返回数据不是列表格式');
          return <MenuItemModel>[];
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 获取菜品列表成功 - ${apiResponse.data?.length} 项');
      } else {
        AppLogger.warning('MenuService: 获取菜品列表失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 获取菜品列表网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('获取菜品列表失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 获取菜品列表未知错误', error: e);
      return ApiResponse.error('获取菜品列表失败，请稍后重试');
    }
  }

  /// 创建菜品
  Future<ApiResponse<MenuItemModel>> createMenuItem(MenuItemRequest request) async {
    try {
      AppLogger.info('MenuService: 创建菜品 - ${request.name}');

      final response = await _apiService.post<Map<String, dynamic>>(
        '/api/v1/merchant/menu/items',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<MenuItemModel>.fromJson(
        response.data!,
        (json) => MenuItemModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 创建菜品成功');
      } else {
        AppLogger.warning('MenuService: 创建菜品失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 创建菜品网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('创建菜品失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 创建菜品未知错误', error: e);
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

      final response = await _apiService.put<Map<String, dynamic>>(
        '/api/v1/merchant/menu/items/$itemId',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<MenuItemModel>.fromJson(
        response.data!,
        (json) => MenuItemModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 更新菜品成功');
      } else {
        AppLogger.warning('MenuService: 更新菜品失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 更新菜品网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('更新菜品失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 更新菜品未知错误', error: e);
      return ApiResponse.error('更新菜品失败，请稍后重试');
    }
  }

  /// 删除菜品
  Future<ApiResponse<void>> deleteMenuItem(int itemId) async {
    try {
      AppLogger.info('MenuService: 删除菜品 - $itemId');

      final response = await _apiService.delete<Map<String, dynamic>>(
        '/api/v1/merchant/menu/items/$itemId',
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 删除菜品成功');
      } else {
        AppLogger.warning('MenuService: 删除菜品失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 删除菜品网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('删除菜品失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 删除菜品未知错误', error: e);
      return ApiResponse.error('删除菜品失败，请稍后重试');
    }
  }

  /// 切换菜品状态
  Future<ApiResponse<void>> toggleMenuItemStatus(int itemId, bool isAvailable) async {
    try {
      AppLogger.info('MenuService: 切换菜品状态 - $itemId, $isAvailable');

      final response = await _apiService.put<Map<String, dynamic>>(
        '/api/v1/merchant/menu/items/$itemId/status',
        data: {
          'isAvailable': isAvailable,
        },
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 切换菜品状态成功');
      } else {
        AppLogger.warning('MenuService: 切换菜品状态失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 切换菜品状态网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('切换菜品状态失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 切换菜品状态未知错误', error: e);
      return ApiResponse.error('切换菜品状态失败，请稍后重试');
    }
  }

  /// 设置推荐菜品
  Future<ApiResponse<void>> setRecommendedMenuItem(int itemId, bool isRecommended) async {
    try {
      AppLogger.info('MenuService: 设置推荐菜品 - $itemId, $isRecommended');

      final response = await _apiService.put<Map<String, dynamic>>(
        '/api/v1/merchant/menu/items/$itemId/recommended',
        data: {
          'isRecommended': isRecommended,
        },
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 设置推荐菜品成功');
      } else {
        AppLogger.warning('MenuService: 设置推荐菜品失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 设置推荐菜品网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('设置推荐菜品失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 设置推荐菜品未知错误', error: e);
      return ApiResponse.error('设置推荐菜品失败，请稍后重试');
    }
  }

  /// 搜索菜品
  Future<ApiResponse<List<MenuItemModel>>> searchMenuItems(
    String keyword, {
    int page = 0,
    int size = 20,
  }) async {
    return getMenuItems(
      page: page,
      size: size,
      keyword: keyword,
    );
  }

  /// 获取推荐菜品
  Future<ApiResponse<List<MenuItemModel>>> getRecommendedMenuItems({
    int page = 0,
    int size = 20,
  }) async {
    return getMenuItems(
      page: page,
      size: size,
      isRecommended: true,
    );
  }

  /// 根据分类获取菜品
  Future<ApiResponse<List<MenuItemModel>>> getMenuItemsByCategory(
    String categoryId, {
    int page = 0,
    int size = 20,
  }) async {
    return getMenuItems(
      page: page,
      size: size,
      categoryId: categoryId,
    );
  }

  /// 获取所有菜品
  Future<ApiResponse<List<MenuItemModel>>> getAllMenuItems() async {
    try {
      AppLogger.info('MenuService: 获取所有菜品');

      final response = await _apiService.get<Map<String, dynamic>>(
        '/api/v1/merchant/menu/items/all',
      );

      final apiResponse = ApiResponse<List<MenuItemModel>>.fromJson(
        response.data!,
        (json) {
          if (json is List) {
            return (json)
                .map((item) => MenuItemModel.fromJson(item as Map<String, dynamic>))
                .toList();
          }
          return <MenuItemModel>[];
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 获取所有菜品成功 - ${apiResponse.data?.length} 项');
      } else {
        AppLogger.warning('MenuService: 获取所有菜品失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 获取所有菜品网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('获取所有菜品失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 获取所有菜品未知错误', error: e);
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

      final response = await _apiService.get<Map<String, dynamic>>(
        '/api/v1/merchant/menu/categories',
      );

      final apiResponse = ApiResponse<List<MenuCategoryModel>>.fromJson(
        response.data!,
        (json) {
          if (json is List) {
            return (json)
                .map((item) => MenuCategoryModel.fromJson(item as Map<String, dynamic>))
                .toList();
          }
          return <MenuCategoryModel>[];
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 获取分类列表成功 - ${apiResponse.data?.length} 项');
      } else {
        AppLogger.warning('MenuService: 获取分类列表失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 获取分类列表网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('获取分类列表失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 获取分类列表未知错误', error: e);
      return ApiResponse.error('获取分类列表失败，请稍后重试');
    }
  }

  /// 创建分类
  Future<ApiResponse<MenuCategoryModel>> createCategory(MenuCategoryRequest request) async {
    try {
      AppLogger.info('MenuService: 创建分类 - ${request.name}');

      final response = await _apiService.post<Map<String, dynamic>>(
        '/api/v1/merchant/menu/categories',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<MenuCategoryModel>.fromJson(
        response.data!,
        (json) => MenuCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 创建分类成功');
      } else {
        AppLogger.warning('MenuService: 创建分类失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 创建分类网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('创建分类失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 创建分类未知错误', error: e);
      return ApiResponse.error('创建分类失败，请稍后重试');
    }
  }

  /// 更新分类
  Future<ApiResponse<MenuCategoryModel>> updateCategory(int categoryId, MenuCategoryRequest request) async {
    try {
      AppLogger.info('MenuService: 更新分类 - $categoryId');

      final response = await _apiService.put<Map<String, dynamic>>(
        '/api/v1/merchant/menu/categories/$categoryId',
        data: request.toJson(),
      );

      final apiResponse = ApiResponse<MenuCategoryModel>.fromJson(
        response.data!,
        (json) => MenuCategoryModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 更新分类成功');
      } else {
        AppLogger.warning('MenuService: 更新分类失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 更新分类网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('更新分类失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 更新分类未知错误', error: e);
      return ApiResponse.error('更新分类失败，请稍后重试');
    }
  }

  /// 删除分类
  Future<ApiResponse<void>> deleteCategory(int categoryId) async {
    try {
      AppLogger.info('MenuService: 删除分类 - $categoryId');

      final response = await _apiService.delete<Map<String, dynamic>>(
        '/api/v1/merchant/menu/categories/$categoryId',
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 删除分类成功');
      } else {
        AppLogger.warning('MenuService: 删除分类失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 删除分类网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('删除分类失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 删除分类未知错误', error: e);
      return ApiResponse.error('删除分类失败，请稍后重试');
    }
  }

  /// 切换分类状态
  Future<ApiResponse<void>> toggleCategoryStatus(int categoryId, bool isActive) async {
    try {
      AppLogger.info('MenuService: 切换分类状态 - $categoryId, $isActive');

      final response = await _apiService.put<Map<String, dynamic>>(
        '/api/v1/merchant/menu/categories/$categoryId/status',
        data: {
          'isActive': isActive,
        },
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('MenuService: 切换分类状态成功');
      } else {
        AppLogger.warning('MenuService: 切换分类状态失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('MenuService: 切换分类状态网络错误', error: e);
      
      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }
      
      return ApiResponse.error('切换分类状态失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('MenuService: 切换分类状态未知错误', error: e);
      return ApiResponse.error('切换分类状态失败，请稍后重试');
    }
  }
}
