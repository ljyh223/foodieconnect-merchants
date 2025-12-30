import 'package:dio/dio.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/models/staff/staff_model.dart';
import 'package:foodieconnect/data/models/common/api_response.dart';
import 'package:foodieconnect/data/repository/staff_repository.dart';

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
      AppLogger.info('StaffService: 获取员工列表');

      final apiResponse = await _staffRepository.getStaff(
        status: status,
        page: page,
        size: size,
      );

      if (apiResponse.isSuccess) {
        AppLogger.info(
          'StaffService: 获取员工列表成功 - ${apiResponse.data?.length} 项',
        );
      } else {
        AppLogger.warning(
          'StaffService: 获取员工列表失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: 获取员工列表网络错误', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('获取员工列表失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('StaffService: 获取员工列表未知错误', error: e);
      return ApiResponse.error('获取员工列表失败，请稍后重试');
    }
  }

  /// 获取员工详情
  Future<ApiResponse<StaffModel>> getStaffDetail(int staffId) async {
    try {
      AppLogger.info('StaffService: 获取员工详情 - $staffId');

      final apiResponse = await _staffRepository.getStaffDetail(staffId);

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 获取员工详情成功');
      } else {
        AppLogger.warning(
          'StaffService: 获取员工详情失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: 获取员工详情网络错误', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('获取员工详情失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('StaffService: 获取员工详情未知错误', error: e);
      return ApiResponse.error('获取员工详情失败，请稍后重试');
    }
  }

  /// 创建员工
  Future<ApiResponse<StaffModel>> createStaff(
    Map<String, dynamic> staffData,
  ) async {
    try {
      AppLogger.info('StaffService: 创建员工 - ${staffData['name']}');

      final apiResponse = await _staffRepository.createStaff(staffData);

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 创建员工成功 - ${apiResponse.data?.name}');
      } else {
        AppLogger.warning('StaffService: 创建员工失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: 创建员工网络错误', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('创建员工失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('StaffService: 创建员工未知错误', error: e);
      return ApiResponse.error('创建员工失败，请稍后重试');
    }
  }

  /// 更新员工信息
  Future<ApiResponse<StaffModel>> updateStaff(
    int staffId,
    Map<String, dynamic> staffData,
  ) async {
    try {
      AppLogger.info('StaffService: 更新员工信息 - $staffId');

      final apiResponse = await _staffRepository.updateStaff(
        staffId,
        staffData,
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 更新员工信息成功 - ${apiResponse.data?.name}');
      } else {
        AppLogger.warning(
          'StaffService: 更新员工信息失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: 更新员工信息网络错误', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('更新员工信息失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('StaffService: 更新员工信息未知错误', error: e);
      return ApiResponse.error('更新员工信息失败，请稍后重试');
    }
  }

  /// 删除员工
  Future<ApiResponse<void>> deleteStaff(int staffId) async {
    try {
      AppLogger.info('StaffService: 删除员工 - $staffId');

      final apiResponse = await _staffRepository.deleteStaff(staffId);

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 删除员工成功');
      } else {
        AppLogger.warning('StaffService: 删除员工失败 - ${apiResponse.errorMessage}');
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: 删除员工网络错误', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('删除员工失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('StaffService: 删除员工未知错误', error: e);
      return ApiResponse.error('删除员工失败，请稍后重试');
    }
  }

  /// 更新员工状态
  Future<ApiResponse<void>> updateStaffStatus(
    int staffId,
    String status,
  ) async {
    try {
      AppLogger.info('StaffService: 更新员工状态 - $staffId, $status');

      final apiResponse = await _staffRepository.updateStaffStatus(
        staffId,
        status,
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 更新员工状态成功');
      } else {
        AppLogger.warning(
          'StaffService: 更新员工状态失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: 更新员工状态网络错误', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('更新员工状态失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('StaffService: 更新员工状态未知错误', error: e);
      return ApiResponse.error('更新员工状态失败，请稍后重试');
    }
  }

  /// 更新员工评分
  Future<ApiResponse<void>> updateStaffRating(
    int staffId,
    double rating,
  ) async {
    try {
      AppLogger.info('StaffService: 更新员工评分 - $staffId, $rating');

      final apiResponse = await _staffRepository.updateStaffRating(
        staffId,
        rating,
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 更新员工评分成功');
      } else {
        AppLogger.warning(
          'StaffService: 更新员工评分失败 - ${apiResponse.errorMessage}',
        );
      }

      return apiResponse;
    } on DioException catch (e) {
      AppLogger.error('StaffService: 更新员工评分网络错误', error: e);

      if (e.response?.data is Map<String, dynamic>) {
        final errorData = e.response!.data as Map<String, dynamic>;
        return ApiResponse.error(
          _extractErrorMessage(errorData),
          code: e.response?.statusCode,
        );
      }

      return ApiResponse.error('更新员工评分失败，请检查网络连接');
    } catch (e) {
      AppLogger.error('StaffService: 更新员工评分未知错误', error: e);
      return ApiResponse.error('更新员工评分失败，请稍后重试');
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

    return '未知错误';
  }
}
