import 'package:json_annotation/json_annotation.dart';

part 'menu_category_request.g.dart';

/// 菜单分类请求模型
@JsonSerializable()
class MenuCategoryRequest {
  @JsonKey(name: 'name')
  final String name;
  
  @JsonKey(name: 'description')
  final String? description;
  
  @JsonKey(name: 'sortOrder')
  final int sortOrder;
  
  @JsonKey(name: 'isActive')
  final bool isActive;

  const MenuCategoryRequest({
    required this.name,
    this.description,
    this.sortOrder = 0,
    this.isActive = true,
  });

  /// 从JSON创建实例
  factory MenuCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryRequestFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$MenuCategoryRequestToJson(this);

  /// 创建副本
  MenuCategoryRequest copyWith({
    String? name,
    String? description,
    int? sortOrder,
    bool? isActive,
  }) {
    return MenuCategoryRequest(
      name: name ?? this.name,
      description: description ?? this.description,
      sortOrder: sortOrder ?? this.sortOrder,
      isActive: isActive ?? this.isActive,
    );
  }

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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MenuCategoryRequest &&
        other.name == name &&
        other.description == description &&
        other.sortOrder == sortOrder &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        sortOrder.hashCode ^
        isActive.hashCode;
  }

  @override
  String toString() {
    return 'MenuCategoryRequest(name: $name, sortOrder: $sortOrder, isActive: $isActive)';
  }
}