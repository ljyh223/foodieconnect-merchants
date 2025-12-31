import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_item_model.freezed.dart';
part 'menu_item_model.g.dart';

/// 菜品模型
@freezed
class MenuItemModel with _$MenuItemModel {
  const MenuItemModel._();

  const factory MenuItemModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'restaurantId') required int restaurantId,
    @JsonKey(name: 'categoryId') required int categoryId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'price') required double price,
    @JsonKey(name: 'originalPrice') double? originalPrice,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'isAvailable') required bool isAvailable,
    @JsonKey(name: 'isRecommended') required bool isRecommended,
    @JsonKey(name: 'sortOrder') required int sortOrder,
    @JsonKey(name: 'nutritionInfo') String? nutritionInfo,
    @JsonKey(name: 'allergenInfo') String? allergenInfo,
    @JsonKey(name: 'spiceLevel') String? spiceLevel,
    @JsonKey(name: 'preparationTime') int? preparationTime,
    @JsonKey(name: 'calories') int? calories,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  /// 获取价格显示文本
  String get priceDisplay => '¥${price.toStringAsFixed(2)}';

  /// 获取原价显示文本
  String? get originalPriceDisplay {
    if (originalPrice == null) return null;
    return '¥${originalPrice!.toStringAsFixed(2)}';
  }

  /// 是否有折扣
  bool get hasDiscount => originalPrice != null && originalPrice! > price;

  /// 获取折扣百分比
  double get discountPercentage {
    if (originalPrice == null || originalPrice! <= price) return 0;
    return ((originalPrice! - price) / originalPrice! * 100);
  }

  /// 获取折扣显示文本
  String get discountDisplay {
    if (!hasDiscount) return '';
    return '${discountPercentage.toStringAsFixed(0)}% OFF';
  }

  /// 获取辣度显示文本
  String get spiceLevelDisplay {
    if (spiceLevel == null) return '不辣';
    switch (spiceLevel!.toUpperCase()) {
      case 'NONE':
        return '不辣';
      case 'MILD':
        return '微辣';
      case 'MEDIUM':
        return '中辣';
      case 'HOT':
        return '特辣';
      default:
        return spiceLevel!;
    }
  }

  /// 获取制作时间显示文本
  String get preparationTimeDisplay {
    if (preparationTime == null) return '';
    return '$preparationTime分钟';
  }

  /// 获取卡路里显示文本
  String get caloriesDisplay {
    if (calories == null) return '';
    return '$calories卡';
  }

  /// 获取可用状态显示文本
  String get availabilityDisplay => isAvailable ? '可售' : '售罄';

  /// 获取推荐状态显示文本
  String get recommendationDisplay => isRecommended ? '推荐' : '';

  @override
  String toString() {
    return 'MenuItemModel(id: $id, name: $name, price: $price, isAvailable: $isAvailable)';
  }
}