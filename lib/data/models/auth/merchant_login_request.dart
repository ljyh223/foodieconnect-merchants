import 'package:freezed_annotation/freezed_annotation.dart';

part 'merchant_login_request.freezed.dart';
part 'merchant_login_request.g.dart';

/// 商家登录请求模型
@freezed
class MerchantLoginRequest with _$MerchantLoginRequest {
  const factory MerchantLoginRequest({
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'password') required String password,
  }) = _MerchantLoginRequest;

  factory MerchantLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$MerchantLoginRequestFromJson(json);

  @override
  String toString() {
    return 'MerchantLoginRequest(username: $username, password: ****)';
  }
}