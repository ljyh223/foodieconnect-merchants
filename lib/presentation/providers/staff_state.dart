import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/staff/staff_model.dart';

part 'staff_state.freezed.dart';

/// 员工状态管理模型
@freezed
class StaffState with _$StaffState {
  const factory StaffState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    String? errorMessage,
    @Default([]) List<StaffModel> staffList,
    StaffModel? selectedStaff,
    String? filterStatus,
    @Default(0) int currentPage,
    @Default(20) int pageSize,
    @Default(true) bool hasMore,
    @Default(0) int totalCount,
  }) = _StaffState;
}
