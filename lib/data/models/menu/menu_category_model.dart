import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'menu_category_model.g.dart';

/// 菜单分类模型
@JsonSerializable()
class MenuCategoryModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  
  @JsonKey(name: 'restaurantId')
  final int restaurantId;
  
  @JsonKey(name: 'name')
  final String name;
  
  @JsonKey(name: 'description')
  final String? description;
  
  @JsonKey(name: 'sortOrder')
  final int sortOrder;
  
  @JsonKey(name: 'isActive')
  final bool isActive;
  
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  const MenuCategoryModel({
    required this.id,
    required this.restaurantId,
    required this.name,
    this.description,
    required this.sortOrder,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  /// 从JSON创建实例
  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryModelFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$MenuCategoryModelToJson(this);

  /// 创建副本
  MenuCategoryModel copyWith({
    int? id,
    int? restaurantId,
    String? name,
    String? description,
    int? sortOrder,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MenuCategoryModel(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      name: name ?? this.name,
      description: description ?? this.description,
      sortOrder: sortOrder ?? this.sortOrder,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// 获取状态显示文本
  String get statusDisplay => isActive ? '启用' : '禁用';

  /// 获取状态颜色
  Color get statusColor => isActive ? Colors.green : Colors.grey;

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        name,
        description,
        sortOrder,
        isActive,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'MenuCategoryModel(id: $id, name: $name, isActive: $isActive)';
  }
}