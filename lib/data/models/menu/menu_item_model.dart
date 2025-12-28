import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'menu_item_model.g.dart';

/// 菜品模型
@JsonSerializable()
class MenuItemModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  
  @JsonKey(name: 'restaurantId')
  final int restaurantId;
  
  @JsonKey(name: 'categoryId')
  final int categoryId;
  
  @JsonKey(name: 'name')
  final String name;
  
  @JsonKey(name: 'description')
  final String? description;
  
  @JsonKey(name: 'price')
  final double price;
  
  @JsonKey(name: 'originalPrice')
  final double? originalPrice;
  
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  
  @JsonKey(name: 'isAvailable')
  final bool isAvailable;
  
  @JsonKey(name: 'isRecommended')
  final bool isRecommended;
  
  @JsonKey(name: 'sortOrder')
  final int sortOrder;
  
  @JsonKey(name: 'nutritionInfo')
  final String? nutritionInfo;
  
  @JsonKey(name: 'allergenInfo')
  final String? allergenInfo;
  
  @JsonKey(name: 'spiceLevel')
  final String? spiceLevel;
  
  @JsonKey(name: 'preparationTime')
  final int? preparationTime;
  
  @JsonKey(name: 'calories')
  final int? calories;
  
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  const MenuItemModel({
    required this.id,
    required this.restaurantId,
    required this.categoryId,
    required this.name,
    this.description,
    required this.price,
    this.originalPrice,
    this.imageUrl,
    required this.isAvailable,
    required this.isRecommended,
    required this.sortOrder,
    this.nutritionInfo,
    this.allergenInfo,
    this.spiceLevel,
    this.preparationTime,
    this.calories,
    this.createdAt,
    this.updatedAt,
  });

  /// 从JSON创建实例
  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$MenuItemModelToJson(this);

  /// 创建副本
  MenuItemModel copyWith({
    int? id,
    int? restaurantId,
    int? categoryId,
    String? name,
    String? description,
    double? price,
    double? originalPrice,
    String? imageUrl,
    bool? isAvailable,
    bool? isRecommended,
    int? sortOrder,
    String? nutritionInfo,
    String? allergenInfo,
    String? spiceLevel,
    int? preparationTime,
    int? calories,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MenuItemModel(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      isAvailable: isAvailable ?? this.isAvailable,
      isRecommended: isRecommended ?? this.isRecommended,
      sortOrder: sortOrder ?? this.sortOrder,
      nutritionInfo: nutritionInfo ?? this.nutritionInfo,
      allergenInfo: allergenInfo ?? this.allergenInfo,
      spiceLevel: spiceLevel ?? this.spiceLevel,
      preparationTime: preparationTime ?? this.preparationTime,
      calories: calories ?? this.calories,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

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
  List<Object?> get props => [
        id,
        restaurantId,
        categoryId,
        name,
        description,
        price,
        originalPrice,
        imageUrl,
        isAvailable,
        isRecommended,
        sortOrder,
        nutritionInfo,
        allergenInfo,
        spiceLevel,
        preparationTime,
        calories,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'MenuItemModel(id: $id, name: $name, price: $price, isAvailable: $isAvailable)';
  }
}