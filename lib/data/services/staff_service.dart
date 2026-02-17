import 'package:dio/dio.dart';
import 'package:foodieconnectmerchant/core/utils/logger.dart';
import 'package:foodieconnectmerchant/data/models/staff/staff_model.dart';
import 'package:foodieconnectmerchant/data/models/common/api_response.dart';
import 'package:foodieconnectmerchant/data/repository/staff_repository.dart';

/// 员工服务类
class StaffService {
  final StaffRepository _staffRepository;

  StaffService(this._staffRepository);

  /// 获取员工列表
  Future<ApiResponse<List<StaffModel>>> getStaff({
    String? status,
    int page = 0,
    int size = 20,
  }) async {
    try {
      AppLogger.info('StaffService: Fetching staff list');

      final apiResponse = await _staffRepository.getStaff(
        status: status,
        page: page,
        size: size,
      );

      if (apiResponse.isSuccess) {
        AppLogger.info(
          'StaffService: Successfully fetched staff list - ${apiResponse.data?.length} items',
        );
      } else {
        AppLogger.warning(
          'StaffService: Failed to fetch staff list - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: Network error fetching staff list', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to fetch staff list, please check network connection');
    } catch (e) {
      AppLogger.error('StaffService: Unknown error fetching staff list', error: e);
      return ApiResponse.error('Failed to fetch staff list, please try again later');
    }
  }

  /// 获取员工详情
  Future<ApiResponse<StaffModel>> getStaffDetail(int staffId) async {
    try {
      AppLogger.info('StaffService: Fetching staff detail - $staffId');

      final apiResponse = await _staffRepository.getStaffDetail(staffId);

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: Successfully fetched staff detail');
      } else {
        AppLogger.warning(
          'StaffService: Failed to fetch staff detail - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: Network error fetching staff detail', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to fetch staff detail, please check network connection');
    } catch (e) {
      AppLogger.error('StaffService: Unknown error fetching staff detail', error: e);
      return ApiResponse.error('Failed to fetch staff detail, please try again later');
    }
  }

  /// 创建员工
  Future<ApiResponse<StaffModel>> createStaff(
    Map<String, dynamic> staffData,
  ) async {
    try {
      AppLogger.info('StaffService: Creating staff - ${staffData['name']}');

      final apiResponse = await _staffRepository.createStaff(staffData);

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: Successfully created staff - ${apiResponse.data?.name}');
      } else {
        AppLogger.warning('StaffService: Failed to create staff - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: Network error creating staff', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to create staff, please check network connection');
    } catch (e) {
      AppLogger.error('StaffService: Unknown error creating staff', error: e);
      return ApiResponse.error('Failed to create staff, please try again later');
    }
  }

  /// 更新员工信息
  Future<ApiResponse<StaffModel>> updateStaff(
    int staffId,
    Map<String, dynamic> staffData,
  ) async {
    try {
      AppLogger.info('StaffService: Updating staff information - $staffId');

      final apiResponse = await _staffRepository.updateStaff(
        staffId,
        staffData,
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: Successfully updated staff information - ${apiResponse.data?.name}');
      } else {
        AppLogger.warning(
          'StaffService: Failed to update staff information - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: Network error updating staff information', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to update staff information, please check network connection');
    } catch (e) {
      AppLogger.error('StaffService: Unknown error updating staff information', error: e);
      return ApiResponse.error('Failed to update staff information, please try again later');
    }
  }

  /// 删除员工
  Future<ApiResponse<void>> deleteStaff(int staffId) async {
    try {
      AppLogger.info('StaffService: Deleting staff - $staffId');

      final apiResponse = await _staffRepository.deleteStaff(staffId);

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: Successfully deleted staff');
      } else {
        AppLogger.warning('StaffService: Failed to delete staff - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: Network error deleting staff', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to delete staff, please check network connection');
    } catch (e) {
      AppLogger.error('StaffService: Unknown error deleting staff', error: e);
      return ApiResponse.error('Failed to delete staff, please try again later');
    }
  }

  /// 更新员工状态
  Future<ApiResponse<void>> updateStaffStatus(
    int staffId,
    String status,
  ) async {
    try {
      AppLogger.info('StaffService: Updating staff status - $staffId, $status');

      final apiResponse = await _staffRepository.updateStaffStatus(
        staffId,
        status,
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: Successfully updated staff status');
      } else {
        AppLogger.warning(
          'StaffService: Failed to update staff status - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: Network error updating staff status', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('Failed to update staff status, please check network connection');
    } catch (e) {
      AppLogger.error('StaffService: Unknown error updating staff status', error: e);
      return ApiResponse.error('Failed to update staff status, please try again later');
    }
  }

  /// 根据状态获取员工
  Future<ApiResponse<List<StaffModel>>> getStaffByStatus(String status) async {
    return getStaff(status: status);
  }

  /// 获取在线员工
  Future<ApiResponse<List<StaffModel>>> getOnlineStaff() async {
    return getStaff(status: 'ONLINE');
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
}
