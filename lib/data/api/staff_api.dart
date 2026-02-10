import 'package:dio/dio.dart';
import '../services/api_service.dart';

/// 员工API接口
class StaffApi {
  final ApiService _apiService = ApiService();

  /// 获取员工列表
  Future<Response<Map<String, dynamic>>> getStaff({
    String? status,
    int page = 0,
    int size = 20,
  }) async {
    final Map<String, dynamic> queryParameters = {'page': page, 'size': size};

    if (status != null) {
      queryParameters['status'] = status;
    }

    return await _apiService.get<Map<String, dynamic>>(
      '/merchant/staff',
      queryParameters: queryParameters,
    );
  }

  /// 获取员工详情
  Future<Response<Map<String, dynamic>>> getStaffDetail(int staffId) async {
    return await _apiService.get<Map<String, dynamic>>(
      '/merchant/staff/$staffId',
    );
  }

  /// 创建员工
  Future<Response<Map<String, dynamic>>> createStaff(
    Map<String, dynamic> staffData,
  ) async {
    return await _apiService.post<Map<String, dynamic>>(
      '/merchant/staff',
      data: staffData,
    );
  }

  /// 更新员工信息
  Future<Response<Map<String, dynamic>>> updateStaff(
    int staffId,
    Map<String, dynamic> staffData,
  ) async {
    return await _apiService.put<Map<String, dynamic>>(
      '/merchant/staff/$staffId',
      data: staffData,
    );
  }

  /// 删除员工
  Future<Response<Map<String, dynamic>>> deleteStaff(int staffId) async {
    return await _apiService.delete<Map<String, dynamic>>(
      '/merchant/staff/$staffId',
    );
  }

  /// 更新员工状态
  Future<Response<Map<String, dynamic>>> updateStaffStatus(
    int staffId,
    String status,
  ) async {
    return await _apiService.put<Map<String, dynamic>>(
      '/merchant/staff/$staffId/status',
      queryParameters: {'status': status},
    );
  }
}
