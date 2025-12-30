import 'package:dio/dio.dart';

/// 员工API接口
class StaffApi {
  final Dio _dio;

  StaffApi(this._dio);

  /// 获取员工列表
  Future<Response<Map<String, dynamic>>> getStaff({
    String? status,
    int page = 0,
    int size = 20,
  }) async {
    final Map<String, dynamic> queryParameters = {
      'page': page,
      'size': size,
    };

    if (status != null) {
      queryParameters['status'] = status;
    }

    return await _dio.get<Map<String, dynamic>>(
      '/merchant/staff',
      queryParameters: queryParameters,
    );
  }

  /// 获取员工详情
  Future<Response<Map<String, dynamic>>> getStaffDetail(int staffId) async {
    return await _dio.get<Map<String, dynamic>>('/merchant/staff/$staffId');
  }

  /// 更新员工状态
  Future<Response<Map<String, dynamic>>> updateStaffStatus(int staffId, String status) async {
    return await _dio.put<Map<String, dynamic>>(
      '/merchant/staff/$staffId/status',
      queryParameters: {
        'status': status,
      },
    );
  }

  /// 更新员工评分
  Future<Response<Map<String, dynamic>>> updateStaffRating(int staffId, double rating) async {
    return await _dio.put<Map<String, dynamic>>(
      '/merchant/staff/$staffId/rating',
      queryParameters: {
        'rating': rating,
      },
    );
  }
}