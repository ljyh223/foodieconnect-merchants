import 'package:json_annotation/json_annotation.dart';
import '../../../core/extensions/string_extension.dart';

part 'restaurant_update_request.g.dart';

/// 餐厅更新请求模型
@JsonSerializable()
class RestaurantUpdateRequest {
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
  
  @JsonKey(name: 'imageUrl')
  final String? imageUrl;
  
  @JsonKey(name: 'isOpen')
  final bool? isOpen;

  const RestaurantUpdateRequest({
    required this.name,
    required this.type,
    this.description,
    required this.address,
    required this.phone,
    this.hours,
    this.imageUrl,
    this.isOpen,
  });

  /// 从JSON创建实例
  factory RestaurantUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$RestaurantUpdateRequestFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$RestaurantUpdateRequestToJson(this);

  /// 创建副本
  RestaurantUpdateRequest copyWith({
    String? name,
    String? type,
    String? description,
    String? address,
    String? phone,
    String? hours,
    String? imageUrl,
    bool? isOpen,
  }) {
    return RestaurantUpdateRequest(
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      hours: hours ?? this.hours,
      imageUrl: imageUrl ?? this.imageUrl,
      isOpen: isOpen ?? this.isOpen,
    );
  }

  /// 验证请求数据
  bool get isValid {
    if (name.trim().isEmpty) return false;
    if (type.trim().isEmpty) return false;
    if (address.trim().isEmpty) return false;
    if (phone.trim().isEmpty) return false;
    
    // 验证手机号格式
    if (!phone.isValidPhoneNumber) return false;
    
    return true;
  }

  /// 获取验证错误信息
  String? get validationError {
    if (name.trim().isEmpty) return '餐厅名称不能为空';
    if (type.trim().isEmpty) return '餐厅类型不能为空';
    if (address.trim().isEmpty) return '地址不能为空';
    if (phone.trim().isEmpty) return '联系电话不能为空';
    if (!phone.isValidPhoneNumber) return '请输入有效的手机号码';
    
    return null;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RestaurantUpdateRequest &&
        other.name == name &&
        other.type == type &&
        other.description == description &&
        other.address == address &&
        other.phone == phone &&
        other.hours == hours &&
        other.imageUrl == imageUrl &&
        other.isOpen == isOpen;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        type.hashCode ^
        description.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        hours.hashCode ^
        imageUrl.hashCode ^
        isOpen.hashCode;
  }

  @override
  String toString() {
    return 'RestaurantUpdateRequest(name: $name, type: $type, address: $address, phone: $phone)';
  }
}