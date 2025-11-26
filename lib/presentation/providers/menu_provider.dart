import 'package:flutter/foundation.dart';

import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/models/menu/menu_item_model.dart';
import 'package:foodieconnect/data/models/menu/menu_item_request.dart';
import 'package:foodieconnect/data/services/menu_service.dart';

/// 菜单状态管理Provider
class MenuProvider extends ChangeNotifier {
  final MenuService _menuService = MenuService();

  // 状态变量
  bool _isLoading = false;
  bool _isCreating = false;
  bool _isUpdating = false;
  bool _isDeleting = false;
  String? _errorMessage;
  List<MenuItemModel> _menuItems = [];
  List<MenuItemModel> _allMenuItems = [];
  MenuItemModel? _selectedMenuItem;
  String _searchKeyword = '';
  String? _selectedCategoryId;
  bool? _filterAvailable;
  bool? _filterRecommended;

  // 分页相关
  int _currentPage = 0;
  final int _pageSize = 20;
  bool _hasMore = true;
  int _totalCount = 0;

  // Getters
  bool get isLoading => _isLoading;
  bool get isCreating => _isCreating;
  bool get isUpdating => _isUpdating;
  bool get isDeleting => _isDeleting;
  String? get errorMessage => _errorMessage;
  List<MenuItemModel> get menuItems => _menuItems;
  List<MenuItemModel> get allMenuItems => _allMenuItems;
  MenuItemModel? get selectedMenuItem => _selectedMenuItem;
  String get searchKeyword => _searchKeyword;
  String? get selectedCategoryId => _selectedCategoryId;
  bool? get filterAvailable => _filterAvailable;
  bool? get filterRecommended => _filterRecommended;
  int get currentPage => _currentPage;
  int get pageSize => _pageSize;
  bool get hasMore => _hasMore;
  int get totalCount => _totalCount;

  /// 获取菜品列表
  Future<void> loadMenuItems({
    bool refresh = false,
    String? categoryId,
    String? keyword,
    bool? isAvailable,
    bool? isRecommended,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      if (refresh) {
        _currentPage = 0;
        _menuItems.clear();
        _hasMore = true;
      }

      AppLogger.info('MenuProvider: 开始加载菜品列表 - 页码: $_currentPage');

      final response = await _menuService.getMenuItems(
        page: _currentPage,
        size: _pageSize,
        categoryId: categoryId ?? _selectedCategoryId,
        keyword: keyword ?? _searchKeyword,
        isAvailable: isAvailable ?? _filterAvailable,
        isRecommended: isRecommended ?? _filterRecommended,
      );

      if (response.isSuccess && response.data != null) {
        final newItems = response.data!;
        
        if (refresh) {
          _menuItems = newItems;
        } else {
          _menuItems.addAll(newItems);
        }

        _currentPage++;
        _hasMore = newItems.length >= _pageSize;
        
        AppLogger.info('MenuProvider: 菜品列表加载成功 - ${newItems.length} 项');
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('MenuProvider: 菜品列表加载失败 - ${response.errorMessage}');
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('MenuProvider: 加载菜品列表异常', error: e);
      _setError('加载菜品列表失败，请稍后重试');
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// 获取所有菜品
  Future<void> loadAllMenuItems() async {
    try {
      _setLoading(true);
      _clearError();

      AppLogger.info('MenuProvider: 开始加载所有菜品');

      final response = await _menuService.getAllMenuItems();

      if (response.isSuccess && response.data != null) {
        _allMenuItems = response.data!;
        _menuItems = _allMenuItems;
        _totalCount = _allMenuItems.length;
        
        AppLogger.info('MenuProvider: 所有菜品加载成功 - ${_allMenuItems.length} 项');
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('MenuProvider: 所有菜品加载失败 - ${response.errorMessage}');
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('MenuProvider: 加载所有菜品异常', error: e);
      _setError('加载所有菜品失败，请稍后重试');
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// 创建菜品
  Future<bool> createMenuItem(MenuItemRequest request) async {
    try {
      _setCreating(true);
      _clearError();

      AppLogger.info('MenuProvider: 开始创建菜品 - ${request.name}');

      final response = await _menuService.createMenuItem(request);

      if (response.isSuccess && response.data != null) {
        final newItem = response.data!;
        _menuItems.insert(0, newItem);
        _allMenuItems.add(newItem);
        _totalCount++;
        
        AppLogger.info('MenuProvider: 菜品创建成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('MenuProvider: 菜品创建失败 - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('MenuProvider: 创建菜品异常', error: e);
      _setError('创建菜品失败，请稍后重试');
      return false;
    } finally {
      _setCreating(false);
    }
  }

  /// 更新菜品
  Future<bool> updateMenuItem(int itemId, MenuItemRequest request) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('MenuProvider: 开始更新菜品 - $itemId');

      final response = await _menuService.updateMenuItem(itemId, request);

      if (response.isSuccess && response.data != null) {
        final updatedItem = response.data!;
        
        // 更新列表中的菜品
        final menuIndex = _menuItems.indexWhere((item) => item.id == itemId);
        if (menuIndex != -1) {
          _menuItems[menuIndex] = updatedItem;
        }
        
        final allIndex = _allMenuItems.indexWhere((item) => item.id == itemId);
        if (allIndex != -1) {
          _allMenuItems[allIndex] = updatedItem;
        }
        
        // 更新选中的菜品
        if (_selectedMenuItem?.id == itemId) {
          _selectedMenuItem = updatedItem;
        }
        
        AppLogger.info('MenuProvider: 菜品更新成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('MenuProvider: 菜品更新失败 - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('MenuProvider: 更新菜品异常', error: e);
      _setError('更新菜品失败，请稍后重试');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 删除菜品
  Future<bool> deleteMenuItem(int itemId) async {
    try {
      _setDeleting(true);
      _clearError();

      AppLogger.info('MenuProvider: 开始删除菜品 - $itemId');

      final response = await _menuService.deleteMenuItem(itemId);

      if (response.isSuccess) {
        _menuItems.removeWhere((item) => item.id == itemId);
        _allMenuItems.removeWhere((item) => item.id == itemId);
        _totalCount--;
        
        // 清除选中状态
        if (_selectedMenuItem?.id == itemId) {
          _selectedMenuItem = null;
        }
        
        AppLogger.info('MenuProvider: 菜品删除成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('MenuProvider: 菜品删除失败 - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('MenuProvider: 删除菜品异常', error: e);
      _setError('删除菜品失败，请稍后重试');
      return false;
    } finally {
      _setDeleting(false);
    }
  }

  /// 切换菜品状态
  Future<bool> toggleMenuItemStatus(int itemId, bool isAvailable) async {
    try {
      _clearError();

      AppLogger.info('MenuProvider: 开始切换菜品状态 - $itemId, $isAvailable');

      final response = await _menuService.toggleMenuItemStatus(itemId, isAvailable);

      if (response.isSuccess) {
        // 更新本地状态
        final menuIndex = _menuItems.indexWhere((item) => item.id == itemId);
        if (menuIndex != -1) {
          _menuItems[menuIndex] = _menuItems[menuIndex].copyWith(isAvailable: isAvailable);
        }
        
        final allIndex = _allMenuItems.indexWhere((item) => item.id == itemId);
        if (allIndex != -1) {
          _allMenuItems[allIndex] = _allMenuItems[allIndex].copyWith(isAvailable: isAvailable);
        }
        
        // 更新选中的菜品
        if (_selectedMenuItem?.id == itemId) {
          _selectedMenuItem = _selectedMenuItem!.copyWith(isAvailable: isAvailable);
        }
        
        AppLogger.info('MenuProvider: 菜品状态切换成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('MenuProvider: 菜品状态切换失败 - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('MenuProvider: 切换菜品状态异常', error: e);
      _setError('切换菜品状态失败，请稍后重试');
      return false;
    }
  }

  /// 设置推荐菜品
  Future<bool> setRecommendedMenuItem(int itemId, bool isRecommended) async {
    try {
      _clearError();

      AppLogger.info('MenuProvider: 开始设置推荐菜品 - $itemId, $isRecommended');

      final response = await _menuService.setRecommendedMenuItem(itemId, isRecommended);

      if (response.isSuccess) {
        // 更新本地状态
        final menuIndex = _menuItems.indexWhere((item) => item.id == itemId);
        if (menuIndex != -1) {
          _menuItems[menuIndex] = _menuItems[menuIndex].copyWith(isRecommended: isRecommended);
        }
        
        final allIndex = _allMenuItems.indexWhere((item) => item.id == itemId);
        if (allIndex != -1) {
          _allMenuItems[allIndex] = _allMenuItems[allIndex].copyWith(isRecommended: isRecommended);
        }
        
        // 更新选中的菜品
        if (_selectedMenuItem?.id == itemId) {
          _selectedMenuItem = _selectedMenuItem!.copyWith(isRecommended: isRecommended);
        }
        
        AppLogger.info('MenuProvider: 推荐菜品设置成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('MenuProvider: 推荐菜品设置失败 - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('MenuProvider: 设置推荐菜品异常', error: e);
      _setError('设置推荐菜品失败，请稍后重试');
      return false;
    }
  }

  /// 搜索菜品
  Future<void> searchMenuItems(String keyword) async {
    _searchKeyword = keyword;
    _currentPage = 0;
    await loadMenuItems(refresh: true);
  }

  /// 根据分类筛选菜品
  Future<void> filterByCategory(String? categoryId) async {
    _selectedCategoryId = categoryId;
    _currentPage = 0;
    await loadMenuItems(refresh: true);
  }

  /// 根据可用性筛选菜品
  Future<void> filterByAvailability(bool? isAvailable) async {
    _filterAvailable = isAvailable;
    _currentPage = 0;
    await loadMenuItems(refresh: true);
  }

  /// 根据推荐状态筛选菜品
  Future<void> filterByRecommended(bool? isRecommended) async {
    _filterRecommended = isRecommended;
    _currentPage = 0;
    await loadMenuItems(refresh: true);
  }

  /// 清除所有筛选条件
  Future<void> clearFilters() async {
    _searchKeyword = '';
    _selectedCategoryId = null;
    _filterAvailable = null;
    _filterRecommended = null;
    _currentPage = 0;
    await loadMenuItems(refresh: true);
  }

  /// 选择菜品
  void selectMenuItem(MenuItemModel? menuItem) {
    _selectedMenuItem = menuItem;
    notifyListeners();
    AppLogger.info('MenuProvider: 已选择菜品 - ${menuItem?.name}');
  }

  /// 加载更多菜品
  Future<void> loadMoreMenuItems() async {
    if (!_hasMore || _isLoading) return;
    await loadMenuItems();
  }

  /// 刷新菜品列表
  Future<void> refreshMenuItems() async {
    await loadMenuItems(refresh: true);
  }

  /// 获取可售菜品数量
  int get availableItemsCount {
    return _menuItems.where((item) => item.isAvailable).length;
  }

  /// 获取推荐菜品数量
  int get recommendedItemsCount {
    return _menuItems.where((item) => item.isRecommended).length;
  }

  /// 获取售罄菜品数量
  int get unavailableItemsCount {
    return _menuItems.where((item) => !item.isAvailable).length;
  }

  /// 设置加载状态
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// 设置创建状态
  void _setCreating(bool creating) {
    _isCreating = creating;
    notifyListeners();
  }

  /// 设置更新状态
  void _setUpdating(bool updating) {
    _isUpdating = updating;
    notifyListeners();
  }

  /// 设置删除状态
  void _setDeleting(bool deleting) {
    _isDeleting = deleting;
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

  /// 重置状态
  void reset() {
    _isLoading = false;
    _isCreating = false;
    _isUpdating = false;
    _isDeleting = false;
    _errorMessage = null;
    _menuItems.clear();
    _allMenuItems.clear();
    _selectedMenuItem = null;
    _searchKeyword = '';
    _selectedCategoryId = null;
    _filterAvailable = null;
    _filterRecommended = null;
    _currentPage = 0;
    _hasMore = true;
    _totalCount = 0;
    
    notifyListeners();
    AppLogger.info('MenuProvider: 状态已重置');
  }
}