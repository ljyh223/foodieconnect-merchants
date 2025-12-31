import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_category_model.freezed.dart';
part 'menu_category_model.g.dart';

/// 菜单分类模型
@freezed
class MenuCategoryModel with _$MenuCategoryModel {
  const MenuCategoryModel._();

  const factory MenuCategoryModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'restaurantId') required int restaurantId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'sortOrder') required int sortOrder,
    @JsonKey(name: 'isActive') required bool isActive,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _MenuCategoryModel;

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryModelFromJson(json);

  /// 获取状态显示文本
  String get statusDisplay => isActive ? '启用' : '禁用';

  /// 获取状态颜色
  Color get statusColor => isActive ? Colors.green : Colors.grey;

  @override
  String toString() {
    return 'MenuCategoryModel(id: $id, name: $name, isActive: $isActive)';
  }
}