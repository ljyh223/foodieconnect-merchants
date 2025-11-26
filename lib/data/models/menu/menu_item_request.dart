import 'package:json_annotation/json_annotation.dart';

part 'menu_item_request.g.dart';

/// 菜品请求模型
@JsonSerializable()
class MenuItemRequest {
  @JsonKey(name: 'name')
  final String name;
  
  @JsonKey(name: 'description')
  final String? description;
  
  @JsonKey(name: 'price')
  final double price;
  
  @JsonKey(name: 'originalPrice')
  final double? originalPrice;
  
  @JsonKey(name: 'categoryId')
  final int categoryId;
  
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

  const MenuItemRequest({
    required this.name,
    this.description,
    required this.price,
    this.originalPrice,
    required this.categoryId,
    this.imageUrl,
    this.isAvailable = true,
    this.isRecommended = false,
    this.sortOrder = 0,
    this.nutritionInfo,
    this.allergenInfo,
    this.spiceLevel,
    this.preparationTime,
    this.calories,
  });

  /// 从JSON创建实例
  factory MenuItemRequest.fromJson(Map<String, dynamic> json) =>
      _$MenuItemRequestFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$MenuItemRequestToJson(this);

  /// 创建副本
  MenuItemRequest copyWith({
    String? name,
    String? description,
    double? price,
    double? originalPrice,
    int? categoryId,
    String? imageUrl,
    bool? isAvailable,
    bool? isRecommended,
    int? sortOrder,
    String? nutritionInfo,
    String? allergenInfo,
    String? spiceLevel,
    int? preparationTime,
    int? calories,
  }) {
    return MenuItemRequest(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      categoryId: categoryId ?? this.categoryId,
      imageUrl: imageUrl ?? this.imageUrl,
      isAvailable: isAvailable ?? this.isAvailable,
      isRecommended: isRecommended ?? this.isRecommended,
      sortOrder: sortOrder ?? this.sortOrder,
      nutritionInfo: nutritionInfo ?? this.nutritionInfo,
      allergenInfo: allergenInfo ?? this.allergenInfo,
      spiceLevel: spiceLevel ?? this.spiceLevel,
      preparationTime: preparationTime ?? this.preparationTime,
      calories: calories ?? this.calories,
    );
  }

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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MenuItemRequest &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.originalPrice == originalPrice &&
        other.categoryId == categoryId &&
        other.imageUrl == imageUrl &&
        other.isAvailable == isAvailable &&
        other.isRecommended == isRecommended &&
        other.sortOrder == sortOrder &&
        other.nutritionInfo == nutritionInfo &&
        other.allergenInfo == allergenInfo &&
        other.spiceLevel == spiceLevel &&
        other.preparationTime == preparationTime &&
        other.calories == calories;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        originalPrice.hashCode ^
        categoryId.hashCode ^
        imageUrl.hashCode ^
        isAvailable.hashCode ^
        isRecommended.hashCode ^
        sortOrder.hashCode ^
        nutritionInfo.hashCode ^
        allergenInfo.hashCode ^
        spiceLevel.hashCode ^
        preparationTime.hashCode ^
        calories.hashCode;
  }

  @override
  String toString() {
    return 'MenuItemRequest(name: $name, price: $price, categoryId: $categoryId)';
  }
}