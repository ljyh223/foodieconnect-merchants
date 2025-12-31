import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_model.freezed.dart';
part 'restaurant_model.g.dart';

/// 餐厅模型
@freezed
class RestaurantModel with _$RestaurantModel {
  const RestaurantModel._();

  const factory RestaurantModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'hours') String? hours,
    @JsonKey(name: 'rating') double? rating,
    @JsonKey(name: 'reviewCount') int? reviewCount,
    @JsonKey(name: 'isOpen') bool? isOpen,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'distance') String? distance,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  /// 获取餐厅图片URL（优先使用imageUrl，其次使用avatar）
  String? get displayImage => imageUrl ?? avatar;

  /// 检查餐厅是否营业
  bool get isCurrentlyOpen => isOpen ?? false;

  /// 获取营业状态显示文本
  String get statusDisplay => isCurrentlyOpen ? '营业中' : '已打烊';

  /// 获取评分显示文本
  String get ratingDisplay {
    if (rating == null) return '暂无评分';
    return '${rating!.toStringAsFixed(1)} ⭐';
  }

  /// 获取评价数量显示文本
  String get reviewCountDisplay {
    if (reviewCount == null || reviewCount == 0) return '暂无评价';
    return '$reviewCount 条评价';
  }

  /// 获取距离显示文本
  String get distanceDisplay {
    if (distance == null || distance!.isEmpty) return '';
    return '距离 $distance';
  }

  @override
  String toString() {
    return 'RestaurantModel(id: $id, name: $name, type: $type, rating: $rating)';
  }
}