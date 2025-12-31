import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_request.freezed.dart';
part 'menu_item_request.g.dart';

/// 菜品请求模型
@freezed
class MenuItemRequest with _$MenuItemRequest {
  const MenuItemRequest._();

  const factory MenuItemRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'originalPrice') double? originalPrice,
    @JsonKey(name: 'categoryId') required int categoryId,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'isAvailable') @Default(true) bool isAvailable,
    @JsonKey(name: 'isRecommended') @Default(false) bool isRecommended,
    @JsonKey(name: 'sortOrder') @Default(0) int sortOrder,
    @JsonKey(name: 'nutritionInfo') String? nutritionInfo,
    @JsonKey(name: 'allergenInfo') String? allergenInfo,
    @JsonKey(name: 'spiceLevel') String? spiceLevel,
    @JsonKey(name: 'preparationTime') int? preparationTime,
    @JsonKey(name: 'calories') int? calories,
  }) = _MenuItemRequest;

  factory MenuItemRequest.fromJson(Map<String, dynamic> json) =>
      _$MenuItemRequestFromJson(json);

  /// 验证请求数据
  bool get isValid {
    if (name.trim().isEmpty) return false;
    if (price <= 0) return false;
    if (categoryId <= 0) return false;
    
    // 验证原价
    if (originalPrice != null && originalPrice! < 0) return false;
    
    // 验证辣度
    if (spiceLevel != null) {
      final validSpiceLevels = ['NONE', 'MILD', 'MEDIUM', 'HOT'];
      if (!validSpiceLevels.contains(spiceLevel!.toUpperCase())) return false;
    }
    
    // 验证制作时间
    if (preparationTime != null && preparationTime! < 0) return false;
    
    // 验证卡路里
    if (calories != null && calories! < 0) return false;
    
    return true;
  }

  /// 获取验证错误信息
  String? get validationError {
    if (name.trim().isEmpty) return '菜品名称不能为空';
    if (price <= 0) return '价格必须大于0';
    if (categoryId <= 0) return '请选择菜品分类';
    
    if (originalPrice != null && originalPrice! < 0) return '原价不能为负数';
    
    if (spiceLevel != null) {
      final validSpiceLevels = ['NONE', 'MILD', 'MEDIUM', 'HOT'];
      if (!validSpiceLevels.contains(spiceLevel!.toUpperCase())) {
        return '请选择有效的辣度等级';
      }
    }
    
    if (preparationTime != null && preparationTime! < 0) return '制作时间不能为负数';
    
    if (calories != null && calories! < 0) return '卡路里不能为负数';
    
    return null;
  }

  @override
  String toString() {
    return 'MenuItemRequest(name: $name, price: $price, categoryId: $categoryId)';
  }
}