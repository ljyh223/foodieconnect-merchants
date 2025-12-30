import 'package:foodieconnect/core/utils/logger.dart';
import 'package:foodieconnect/data/api/staff_api.dart';
import 'package:foodieconnect/data/models/common/api_response.dart';
import 'package:foodieconnect/data/models/staff/staff_model.dart';

/// 员工Repository层
class StaffRepository {
  final StaffApi _staffApi;

  StaffRepository(this._staffApi);

  /// 获取员工列表
  Future<ApiResponse<List<StaffModel>>> getStaff({
    String? status,
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _staffApi.getStaff(
        status: status,
        page: page,
        size: size,
      );
      return ApiResponse<List<StaffModel>>.fromJson(
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
    } catch (e) {
      AppLogger.error('StaffRepository: 获取员工列表失败', error: e);
      rethrow;
    }
  }

  /// 获取员工详情
  Future<ApiResponse<StaffModel>> getStaffDetail(int staffId) async {
    try {
      final response = await _staffApi.getStaffDetail(staffId);
      return ApiResponse<StaffModel>.fromJson(
        response.data!,
        (json) => StaffModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      AppLogger.error('StaffRepository: 获取员工详情失败', error: e);
      rethrow;
    }
  }

  /// 更新员工状态
  Future<ApiResponse<void>> updateStaffStatus(int staffId, String status) async {
    try {
      final response = await _staffApi.updateStaffStatus(staffId, status);
      return ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );
    } catch (e) {
      AppLogger.error('StaffRepository: 更新员工状态失败', error: e);
      rethrow;
    }
  }

  /// 更新员工评分
  Future<ApiResponse<void>> updateStaffRating(int staffId, double rating) async {
    try {
      final response = await _staffApi.updateStaffRating(staffId, rating);
      return ApiResponse<void>.fromJson(
        response.data!,
        (json) {},
      );
    } catch (e) {
      AppLogger.error('StaffRepository: 更新员工评分失败', error: e);
      rethrow;
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
}