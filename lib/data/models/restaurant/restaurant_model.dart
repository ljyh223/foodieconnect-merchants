import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'restaurant_model.g.dart';

/// 餐厅模型
@JsonSerializable()
class RestaurantModel extends Equatable {
  @JsonKey(name: 'id')
  final int id;
  
  @JsonKey(name: 'name')
  final String name;
  
  @JsonKey(name: 'type')
  final String type;
  
  @JsonKey(name: 'description')
  final String? description;
  
  @JsonKey(name: 'address')
  final String address;
  
  @JsonKey(name: 'phone')
  final String phone;
  
  @JsonKey(name: 'hours')
  final String? hours;
  
  @JsonKey(name: 'rating')
  final double? rating;
  
  @JsonKey(name: 'reviewCount')
  final int? reviewCount;
  
  @JsonKey(name: 'isOpen')
  final bool? isOpen;
  
  @JsonKey(name: 'avatar')
  final String? avatar;
  
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  
  @JsonKey(name: 'distance')
  final String? distance;
  
  @JsonKey(name: 'createdAt')
  final DateTime? createdAt;
  
  @JsonKey(name: 'updatedAt')
  final DateTime? updatedAt;

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.type,
    this.description,
    required this.address,
    required this.phone,
    this.hours,
    this.rating,
    this.reviewCount,
    this.isOpen,
    this.avatar,
    this.imageUrl,
    this.distance,
    this.createdAt,
    this.updatedAt,
  });

  /// 从JSON创建实例
  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$RestaurantModelToJson(this);

  /// 创建副本
  RestaurantModel copyWith({
    int? id,
    String? name,
    String? type,
    String? description,
    String? address,
    String? phone,
    String? hours,
    double? rating,
    int? reviewCount,
    bool? isOpen,
    String? avatar,
    String? imageUrl,
    String? distance,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      hours: hours ?? this.hours,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isOpen: isOpen ?? this.isOpen,
      avatar: avatar ?? this.avatar,
      imageUrl: imageUrl ?? this.imageUrl,
      distance: distance ?? this.distance,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

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
  List<Object?> get props => [
        id,
        name,
        type,
        description,
        address,
        phone,
        hours,
        rating,
        reviewCount,
        isOpen,
        avatar,
        imageUrl,
        distance,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'RestaurantModel(id: $id, name: $name, type: $type, rating: $rating)';
  }
}