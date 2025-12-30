import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

/// API调用结果状态
@freezed
class ApiResult<T> with _$ApiResult {
  /// 加载状态
  const factory ApiResult.loading() = _Loading<T>;
  
  /// 成功状态，包含数据
  const factory ApiResult.success(T data) = _Success<T>;
  
  /// 错误状态，包含错误信息
  const factory ApiResult.error(String message, {int? code, dynamic details}) = _Error<T>;
}
