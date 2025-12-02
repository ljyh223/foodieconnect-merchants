import 'package:dio/dio.dart';
import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/models/staff/staff_model.dart';
import 'package:foodieconnect/data/models/common/api_response.dart';
import 'package:foodieconnect/data/services/api_service.dart';

/// 员工服务类
class StaffService {
  final ApiService _apiService = ApiService();

  /// 获取员工列表
  Future<ApiResponse<List<StaffModel>>> getStaff({
    String? status,
    int page = 0,
    int size = 20,
  }) async {
    try {
      AppLogger.info('StaffService: 获取员工列表');

      final Map<String, dynamic> queryParameters = {
        'page': page,
        'size': size,
      };

      if (status != null) {
        queryParameters['status'] = status;
      }

      final response = await _apiService.get<Map<String, dynamic>>(
        '/merchant/staff',
        queryParameters: queryParameters,
      );

      final apiResponse = ApiResponse<List<StaffModel>>.fromJson(
        response.data!,
        (json) {
          if (json is List) {
            return (json)
                .map((item) => StaffModel.fromJson(item as Map<String, dynamic>))
                .toList();
          }
          return <StaffModel>[];
        },
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 获取员工列表成功 - ${apiResponse.data?.length} 项');
      } else {
        AppLogger.warning('StaffService: 获取员工列表失败 - ${apiResponse.errorMessage}');
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

      final response = await _apiService.get<Map<String, dynamic>>(
        '/merchant/staff/$staffId',
      );

      final apiResponse = ApiResponse<StaffModel>.fromJson(
        response.data!,
        (json) => StaffModel.fromJson(json as Map<String, dynamic>),
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 获取员工详情成功');
      } else {
        AppLogger.warning('StaffService: 获取员工详情失败 - ${apiResponse.errorMessage}');
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

  /// 更新员工状态
  Future<ApiResponse<void>> updateStaffStatus(int staffId, String status) async {
    try {
      AppLogger.info('StaffService: 更新员工状态 - $staffId, $status');

      final response = await _apiService.put<Map<String, dynamic>>(
        '/merchant/staff/$staffId/status',
        queryParameters: {
          'status': status,
        },
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 更新员工状态成功');
      } else {
        AppLogger.warning('StaffService: 更新员工状态失败 - ${apiResponse.errorMessage}');
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
  Future<ApiResponse<void>> updateStaffRating(int staffId, double rating) async {
    try {
      AppLogger.info('StaffService: 更新员工评分 - $staffId, $rating');

      final response = await _apiService.put<Map<String, dynamic>>(
        '/merchant/staff/$staffId/rating',
        queryParameters: {
          'rating': rating,
        },
      );

      final apiResponse = ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );

      if (apiResponse.isSuccess) {
        AppLogger.info('StaffService: 更新员工评分成功');
      } else {
        AppLogger.warning('StaffService: 更新员工评分失败 - ${apiResponse.errorMessage}');
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