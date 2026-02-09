import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_register_response.freezed.dart';
part 'merchant_register_response.g.dart';

/// 商家注册响应模型
@freezed
class MerchantRegisterResponse with _$MerchantRegisterResponse {
  const factory MerchantRegisterResponse({
    @JsonKey(name: 'merchantId') required int merchantId,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'restaurantId') required int restaurantId,
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'roleDescription') required String roleDescription,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'createdAt') required String createdAt,
  }) = _MerchantRegisterResponse;

  factory MerchantRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$MerchantRegisterResponseFromJson(json);

  @override
  String toString() {
    return 'MerchantRegisterResponse(merchantId: $merchantId, username: $username, email: $email, name: $name, role: $role, status: $status)';
  }
}
