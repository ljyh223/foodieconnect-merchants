import 'package:json_annotation/json_annotation.dart';

part 'merchant_login_request.g.dart';

/// 商家登录请求模型
@JsonSerializable()
class MerchantLoginRequest {
  @JsonKey(name: 'username')
  final String username;
  
  @JsonKey(name: 'password')
  final String password;

  const MerchantLoginRequest({
    required this.username,
    required this.password,
  });

  /// 从JSON创建实例
  factory MerchantLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$MerchantLoginRequestFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$MerchantLoginRequestToJson(this);

  /// 创建副本
  MerchantLoginRequest copyWith({
    String? username,
    String? password,
  }) {
    return MerchantLoginRequest(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MerchantLoginRequest &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'MerchantLoginRequest(username: $username, password: ****)';
  }
}