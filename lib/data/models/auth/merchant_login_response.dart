import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_login_response.freezed.dart';
part 'merchant_login_response.g.dart';

/// 商家登录响应模型
@freezed
class MerchantLoginResponse with _$MerchantLoginResponse {
  const factory MerchantLoginResponse({
    @JsonKey(name: 'token') required String token,
    @JsonKey(name: 'tokenType') required String tokenType,
    @JsonKey(name: 'merchantId') required int merchantId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'restaurantId') required int restaurantId,
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'roleDescription') required String roleDescription,
    @JsonKey(name: 'phone') required String phone,
  }) = _MerchantLoginResponse;

  factory MerchantLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$MerchantLoginResponseFromJson(json);
}