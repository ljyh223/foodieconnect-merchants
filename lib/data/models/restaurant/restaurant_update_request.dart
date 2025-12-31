import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/extensions/string_extension.dart';

part 'restaurant_update_request.freezed.dart';
part 'restaurant_update_request.g.dart';

/// 餐厅更新请求模型
@freezed
class RestaurantUpdateRequest with _$RestaurantUpdateRequest {
  const RestaurantUpdateRequest._();

  const factory RestaurantUpdateRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'hours') String? hours,
    @JsonKey(name: 'imageUrl') String? imageUrl,
    @JsonKey(name: 'isOpen') bool? isOpen,
  }) = _RestaurantUpdateRequest;

  factory RestaurantUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$RestaurantUpdateRequestFromJson(json);

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
  String toString() {
    return 'RestaurantUpdateRequest(name: $name, type: $type, address: $address, phone: $phone)';
  }
}