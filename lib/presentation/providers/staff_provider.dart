import 'package:flutter/foundation.dart';

import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/models/staff/staff_model.dart';
import 'package:foodieconnect/data/services/staff_service.dart';

/// 员工状态管理Provider
class StaffProvider extends ChangeNotifier {
  final StaffService _staffService = StaffService();

  // 状态变量
  bool _isLoading = false;
  bool _isUpdating = false;
  String? _errorMessage;
  List<StaffModel> _staffList = [];
  StaffModel? _selectedStaff;
  String? _filterStatus;

  // 分页相关
  int _currentPage = 0;
  final int _pageSize = 20;
  bool _hasMore = true;
  int _totalCount = 0;

  // Getters
  bool get isLoading => _isLoading;
  bool get isUpdating => _isUpdating;
  String? get errorMessage => _errorMessage;
  List<StaffModel> get staffList => _staffList;
  StaffModel? get selectedStaff => _selectedStaff;
  String? get filterStatus => _filterStatus;
  int get currentPage => _currentPage;
  int get pageSize => _pageSize;
  bool get hasMore => _hasMore;
  int get totalCount => _totalCount;

  /// 获取员工列表
  Future<void> loadStaffList({
    bool refresh = false,
    String? status,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      if (refresh) {
        _currentPage = 0;
        _staffList.clear();
        _hasMore = true;
      }

      AppLogger.info('StaffProvider: 开始加载员工列表 - 页码: $_currentPage');

      final response = await _staffService.getStaff(
        page: _currentPage,
        size: _pageSize,
        status: status ?? _filterStatus,
      );

      if (response.isSuccess && response.data != null) {
        final newStaff = response.data!;
        
        if (refresh) {
          _staffList = newStaff;
        } else {
          _staffList.addAll(newStaff);
        }

        _currentPage++;
        _hasMore = newStaff.length >= _pageSize;
        
        AppLogger.info('StaffProvider: 员工列表加载成功 - ${newStaff.length} 项');
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: 员工列表加载失败 - ${response.errorMessage}');
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('StaffProvider: 加载员工列表异常', error: e);
      _setError('加载员工列表失败，请稍后重试');
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// 获取员工详情
  Future<void> loadStaffDetail(int staffId) async {
    try {
      _setLoading(true);
      _clearError();

      AppLogger.info('StaffProvider: 开始加载员工详情 - $staffId');

      final response = await _staffService.getStaffDetail(staffId);

      if (response.isSuccess && response.data != null) {
        _selectedStaff = response.data!;
        AppLogger.info('StaffProvider: 员工详情加载成功');
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: 员工详情加载失败 - ${response.errorMessage}');
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('StaffProvider: 加载员工详情异常', error: e);
      _setError('加载员工详情失败，请稍后重试');
      notifyListeners();
    } finally {
      _setLoading(false);
    }
  }

  /// 更新员工状态
  Future<bool> updateStaffStatus(int staffId, String status) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('StaffProvider: 开始更新员工状态 - $staffId, $status');

      final response = await _staffService.updateStaffStatus(staffId, status);

      if (response.isSuccess) {
        // 更新本地状态
        final staffIndex = _staffList.indexWhere((staff) => staff.id == staffId);
        if (staffIndex != -1) {
          _staffList[staffIndex] = _staffList[staffIndex].copyWith(status: status);
        }
        
        // 更新选中的员工
        if (_selectedStaff?.id == staffId) {
          _selectedStaff = _selectedStaff!.copyWith(status: status);
        }
        
        AppLogger.info('StaffProvider: 员工状态更新成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: 员工状态更新失败 - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('StaffProvider: 更新员工状态异常', error: e);
      _setError('更新员工状态失败，请稍后重试');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 更新员工评分
  Future<bool> updateStaffRating(int staffId, double rating) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('StaffProvider: 开始更新员工评分 - $staffId, $rating');

      final response = await _staffService.updateStaffRating(staffId, rating);

      if (response.isSuccess) {
        // 更新本地状态
        final staffIndex = _staffList.indexWhere((staff) => staff.id == staffId);
        if (staffIndex != -1) {
          _staffList[staffIndex] = _staffList[staffIndex].copyWith(rating: rating);
        }
        
        // 更新选中的员工
        if (_selectedStaff?.id == staffId) {
          _selectedStaff = _selectedStaff!.copyWith(rating: rating);
        }
        
        AppLogger.info('StaffProvider: 员工评分更新成功');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: 员工评分更新失败 - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('StaffProvider: 更新员工评分异常', error: e);
      _setError('更新员工评分失败，请稍后重试');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 根据状态筛选员工
  Future<void> filterByStatus(String? status) async {
    _filterStatus = status;
    _currentPage = 0;
    await loadStaffList(refresh: true);
  }

  /// 获取在线员工
  Future<void> loadOnlineStaff() async {
    await filterByStatus('ONLINE');
  }

  /// 获取离线员工
  Future<void> loadOfflineStaff() async {
    await filterByStatus('OFFLINE');
  }

  /// 获取忙碌员工
  Future<void> loadBusyStaff() async {
    await filterByStatus('BUSY');
  }

  /// 清除筛选条件
  Future<void> clearFilters() async {
    _filterStatus = null;
    _currentPage = 0;
    await loadStaffList(refresh: true);
  }

  /// 选择员工
  void selectStaff(StaffModel? staff) {
    _selectedStaff = staff;
    notifyListeners();
    AppLogger.info('StaffProvider: 已选择员工 - ${staff?.name}');
  }

  /// 加载更多员工
  Future<void> loadMoreStaff() async {
    if (!_hasMore || _isLoading) return;
    await loadStaffList();
  }

  /// 刷新员工列表
  Future<void> refreshStaffList() async {
    await loadStaffList(refresh: true);
  }

  /// 获取在线员工数量
  int get onlineStaffCount {
    return _staffList.where((staff) => staff.isOnline).length;
  }

  /// 获取离线员工数量
  int get offlineStaffCount {
    return _staffList.where((staff) => staff.isOffline).length;
  }

  /// 获取忙碌员工数量
  int get busyStaffCount {
    return _staffList.where((staff) => staff.isBusy).length;
  }

  /// 获取有评分员工数量
  int get ratedStaffCount {
    return _staffList.where((staff) => staff.rating != null).length;
  }

  /// 获取平均评分
  double get averageRating {
    final ratedStaff = _staffList.where((staff) => staff.rating != null);
    if (ratedStaff.isEmpty) return 0.0;
    
    final totalRating = ratedStaff
        .map((staff) => staff.rating!)
        .reduce((a, b) => a + b);
    
    return totalRating / ratedStaff.length;
  }

  /// 设置员工在线状态
  Future<bool> setStaffOnline(int staffId) async {
    return await updateStaffStatus(staffId, 'ONLINE');
  }

  /// 设置员工离线状态
  Future<bool> setStaffOffline(int staffId) async {
    return await updateStaffStatus(staffId, 'OFFLINE');
  }

  /// 设置员工忙碌状态
  Future<bool> setStaffBusy(int staffId) async {
    return await updateStaffStatus(staffId, 'BUSY');
  }

  /// 获取员工显示名称
  String getStaffDisplayName(StaffModel staff) {
    return staff.name.isNotEmpty ? staff.name : '未知员工';
  }

  /// 获取员工职位显示
  String getStaffPositionDisplay(StaffModel staff) {
    return staff.positionDisplay;
  }

  /// 获取员工状态显示
  String getStaffStatusDisplay(StaffModel staff) {
    return staff.statusDisplay;
  }

  /// 获取员工评分显示
  String getStaffRatingDisplay(StaffModel staff) {
    return staff.ratingDisplay;
  }

  /// 设置加载状态
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// 设置更新状态
  void _setUpdating(bool updating) {
    _isUpdating = updating;
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
    _isUpdating = false;
    _errorMessage = null;
    _staffList.clear();
    _selectedStaff = null;
    _filterStatus = null;
    _currentPage = 0;
    _hasMore = true;
    _totalCount = 0;
    
    notifyListeners();
    AppLogger.info('StaffProvider: 状态已重置');
  }
}