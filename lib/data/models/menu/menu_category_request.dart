import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_category_request.freezed.dart';
part 'menu_category_request.g.dart';

/// 菜单分类请求模型
@freezed
class MenuCategoryRequest with _$MenuCategoryRequest {
  const MenuCategoryRequest._();

  const factory MenuCategoryRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'sortOrder') @Default(0) int sortOrder,
    @JsonKey(name: 'isActive') @Default(true) bool isActive,
  }) = _MenuCategoryRequest;

  factory MenuCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryRequestFromJson(json);

  /// 验证请求数据
  bool get isValid {
    if (name.trim().isEmpty) return false;
    if (sortOrder < 0) return false;
    return true;
  }

  /// 获取验证错误信息
  String? get validationError {
    if (name.trim().isEmpty) return '分类名称不能为空';
    if (sortOrder < 0) return '排序顺序不能为负数';
    return null;
  }

  @override
  String toString() {
    return 'MenuCategoryRequest(name: $name, sortOrder: $sortOrder, isActive: $isActive)';
  }
}