import 'package:flutter/foundation.dart';

import 'package:foodieconnectmerchant/core/utils/logger.dart';
import 'package:foodieconnectmerchant/data/api/staff_api.dart';
import 'package:foodieconnectmerchant/data/models/staff/staff_model.dart';
import 'package:foodieconnectmerchant/data/repository/staff_repository.dart';
import 'package:foodieconnectmerchant/data/services/staff_service.dart';
import 'staff_state.dart';

/// 员工状态管理Provider
class StaffProvider extends ChangeNotifier {
  late final StaffService _staffService;

  // 使用Freezed状态模型管理状态
  StaffState _state = const StaffState();

  StaffProvider() {
    final staffApi = StaffApi();
    final staffRepository = StaffRepository(staffApi);
    _staffService = StaffService(staffRepository);
  }

  // Getters
  bool get isLoading => _state.isLoading;
  bool get isUpdating => _state.isUpdating;
  String? get errorMessage => _state.errorMessage;
  List<StaffModel> get staffList => _state.staffList;
  StaffModel? get selectedStaff => _state.selectedStaff;
  String? get filterStatus => _state.filterStatus;
  int get currentPage => _state.currentPage;
  int get pageSize => _state.pageSize;
  bool get hasMore => _state.hasMore;
  int get totalCount => _state.totalCount;
  StaffState get state => _state;

  /// 获取员工列表
  Future<void> loadStaffList({bool refresh = false, String? status}) async {
    try {
      _setLoading(true);
      _clearError();

      int currentPage = _state.currentPage;
      List<StaffModel> staffList = List.from(_state.staffList);
      bool hasMore = _state.hasMore;

      if (refresh) {
        currentPage = 0;
        staffList.clear();
        hasMore = true;
      }

      AppLogger.info('StaffProvider: Starting to load staff list - Page: $currentPage');

      final response = await _staffService.getStaff(
        page: currentPage,
        size: _state.pageSize,
        status: status ?? _state.filterStatus,
      );

      if (response.isSuccess && response.data != null) {
        final newStaff = response.data!;

        if (refresh) {
          staffList = newStaff;
        } else {
          staffList.addAll(newStaff);
        }

        currentPage++;
        hasMore = newStaff.length >= _state.pageSize;

        AppLogger.info('StaffProvider: Staff list loaded successfully - ${newStaff.length} items');

        // 更新状态
        _state = _state.copyWith(
          currentPage: currentPage,
          staffList: staffList,
          hasMore: hasMore,
          filterStatus: status,
        );
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: Failed to load staff list - ${response.errorMessage}');
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('StaffProvider: Exception loading staff list', error: e);
      _setError('Failed to load staff list, please try again later');
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

      AppLogger.info('StaffProvider: Starting to load staff details - $staffId');

      final response = await _staffService.getStaffDetail(staffId);

      if (response.isSuccess && response.data != null) {
        _state = _state.copyWith(selectedStaff: response.data!);
        AppLogger.info('StaffProvider: Staff details loaded successfully');
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: Failed to load staff details - ${response.errorMessage}');
      }

      notifyListeners();
    } catch (e) {
      AppLogger.error('StaffProvider: Exception loading staff details', error: e);
      _setError('Failed to load staff details, please try again later');
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

      AppLogger.info('StaffProvider: Starting to update staff status - $staffId, $status');

      final response = await _staffService.updateStaffStatus(staffId, status);

      if (response.isSuccess) {
        // 更新本地状态
        final staffList = List<StaffModel>.from(_state.staffList);
        final staffIndex = staffList.indexWhere((staff) => staff.id == staffId);
        if (staffIndex != -1) {
          staffList[staffIndex] = staffList[staffIndex].copyWith(
            status: status,
          );
        }

        // 更新选中的员工
        StaffModel? selectedStaff = _state.selectedStaff;
        if (selectedStaff?.id == staffId) {
          selectedStaff = selectedStaff!.copyWith(status: status);
        }

        // 更新状态
        _state = _state.copyWith(
          staffList: staffList,
          selectedStaff: selectedStaff,
        );

        AppLogger.info('StaffProvider: Staff status updated successfully');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: Failed to update staff status - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('StaffProvider: Exception updating staff status', error: e);
      _setError('Failed to update staff status, please try again later');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 根据状态筛选员工
  Future<void> filterByStatus(String? status) async {
    // 更新筛选状态和页码
    _state = _state.copyWith(filterStatus: status, currentPage: 0);
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
    // 清除筛选状态和重置页码
    _state = _state.copyWith(filterStatus: null, currentPage: 0);
    await loadStaffList(refresh: true);
  }

  /// 选择员工
  void selectStaff(StaffModel? staff) {
    _state = _state.copyWith(selectedStaff: staff);
    notifyListeners();
    AppLogger.info('StaffProvider: Selected staff - ${staff?.name}');
  }

  /// 加载更多员工
  Future<void> loadMoreStaff() async {
    if (!_state.hasMore || _state.isLoading) return;
    await loadStaffList();
  }

  /// 刷新员工列表
  Future<void> refreshStaffList() async {
    await loadStaffList(refresh: true);
  }

  /// 获取在线员工数量
  int get onlineStaffCount {
    return _state.staffList.where((staff) => staff.isOnline).length;
  }

  /// 获取离线员工数量
  int get offlineStaffCount {
    return _state.staffList.where((staff) => staff.isOffline).length;
  }

  /// 获取忙碌员工数量
  int get busyStaffCount {
    return _state.staffList.where((staff) => staff.isBusy).length;
  }

  /// 获取有评分员工数量
  int get ratedStaffCount {
    return _state.staffList.where((staff) => staff.rating != null).length;
  }

  /// 获取平均评分
  double get averageRating {
    final ratedStaff = _state.staffList.where((staff) => staff.rating != null);
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

  /// 创建员工
  Future<bool> createStaff(Map<String, dynamic> staffData) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('StaffProvider: Starting to create staff - ${staffData['name']}');

      final response = await _staffService.createStaff(staffData);

      if (response.isSuccess && response.data != null) {
        // 添加到本地列表
        final staffList = List<StaffModel>.from(_state.staffList);
        staffList.add(response.data!);

        // 更新状态
        _state = _state.copyWith(
          staffList: staffList,
          totalCount: _state.totalCount + 1,
        );

        AppLogger.info('StaffProvider: Staff created successfully - ${response.data!.name}');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: Failed to create staff - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('StaffProvider: Exception creating staff', error: e);
      _setError('Failed to create staff, please try again later');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 更新员工信息
  Future<bool> updateStaff(int staffId, Map<String, dynamic> staffData) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('StaffProvider: Starting to update staff information - $staffId');

      final response = await _staffService.updateStaff(staffId, staffData);

      if (response.isSuccess && response.data != null) {
        // 更新本地列表
        final staffList = List<StaffModel>.from(_state.staffList);
        final staffIndex = staffList.indexWhere((staff) => staff.id == staffId);
        if (staffIndex != -1) {
          staffList[staffIndex] = response.data!;
        }

        // 更新选中的员工
        StaffModel? selectedStaff = _state.selectedStaff;
        if (selectedStaff?.id == staffId) {
          selectedStaff = response.data!;
        }

        // 更新状态
        _state = _state.copyWith(
          staffList: staffList,
          selectedStaff: selectedStaff,
        );

        AppLogger.info('StaffProvider: Staff information updated successfully - ${response.data!.name}');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: Failed to update staff information - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('StaffProvider: Exception updating staff information', error: e);
      _setError('Failed to update staff information, please try again later');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 删除员工
  Future<bool> deleteStaff(int staffId) async {
    try {
      _setUpdating(true);
      _clearError();

      AppLogger.info('StaffProvider: Starting to delete staff - $staffId');

      final response = await _staffService.deleteStaff(staffId);

      if (response.isSuccess) {
        // 从本地列表中删除
        final staffList = List<StaffModel>.from(_state.staffList)
          ..removeWhere((staff) => staff.id == staffId);

        // 更新选中的员工
        StaffModel? selectedStaff = _state.selectedStaff;
        if (selectedStaff?.id == staffId) {
          selectedStaff = null;
        }

        // 更新状态
        _state = _state.copyWith(
          staffList: staffList,
          totalCount: _state.totalCount - 1,
          selectedStaff: selectedStaff,
        );

        AppLogger.info('StaffProvider: Staff deleted successfully');
        notifyListeners();
        return true;
      } else {
        _setError(response.errorMessage);
        AppLogger.warning('StaffProvider: Failed to delete staff - ${response.errorMessage}');
        return false;
      }
    } catch (e) {
      AppLogger.error('StaffProvider: Exception deleting staff', error: e);
      _setError('Failed to delete staff, please try again later');
      return false;
    } finally {
      _setUpdating(false);
    }
  }

  /// 获取员工显示名称
  String getStaffDisplayName(StaffModel staff) {
    return staff.name.isNotEmpty ? staff.name : 'Unknown Staff';
  }

  /// 获取员工职位显示
  String getStaffPositionDisplay(StaffModel staff) {
    if (staff.position == null || staff.position!.isEmpty) {
      return 'Staff';
    }
    return staff.position!;
  }

  /// 获取员工状态显示
  String getStaffStatusDisplay(StaffModel staff) {
    switch (staff.status.toUpperCase()) {
      case 'ONLINE':
        return 'Online';
      case 'OFFLINE':
        return 'Offline';
      case 'BUSY':
        return 'Busy';
      default:
        return 'Unknown';
    }
  }

  /// 获取员工评分显示
  String getStaffRatingDisplay(StaffModel staff) {
    if (staff.rating == null) {
      return 'No rating yet';
    }
    return '${staff.rating!.toStringAsFixed(1)} ⭐';
  }

  /// 设置加载状态
  void _setLoading(bool loading) {
    _state = _state.copyWith(isLoading: loading);
    notifyListeners();
  }

  /// 设置更新状态
  void _setUpdating(bool updating) {
    _state = _state.copyWith(isUpdating: updating);
    notifyListeners();
  }

  /// 设置错误信息
  void _setError(String error) {
    _state = _state.copyWith(errorMessage: error);
    notifyListeners();
  }

  /// 清除错误信息
  void _clearError() {
    _state = _state.copyWith(errorMessage: null);
    notifyListeners();
  }

  /// 清除错误信息（公共方法）
  void clearError() {
    _clearError();
  }

  /// 重置状态
  void reset() {
    _state = const StaffState();
    notifyListeners();
    AppLogger.info('StaffProvider: State has been reset');
  }
}
