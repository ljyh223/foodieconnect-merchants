import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_register_request.freezed.dart';
part 'merchant_register_request.g.dart';

/// 商家注册请求模型
@freezed
class MerchantRegisterRequest with _$MerchantRegisterRequest {
  const factory MerchantRegisterRequest({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'password') required String password,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'restaurantName') required String restaurantName,
    @JsonKey(name: 'restaurantType') required String restaurantType,
    @JsonKey(name: 'restaurantAddress') required String restaurantAddress,
    @JsonKey(name: 'restaurantImage') String? restaurantImage,
  }) = _MerchantRegisterRequest;

  factory MerchantRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$MerchantRegisterRequestFromJson(json);

  @override
  String toString() {
    return 'MerchantRegisterRequest(username: $username, email: $email, name: $name, restaurantName: $restaurantName, restaurantType: $restaurantType)';
  }
}
