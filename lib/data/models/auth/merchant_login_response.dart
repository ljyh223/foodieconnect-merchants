import 'package:json_annotation/json_annotation.dart';

part 'merchant_login_response.g.dart';

/// 商家登录响应模型
@JsonSerializable()
class MerchantLoginResponse {
  @JsonKey(name: 'token')
  final String token;
  
  @JsonKey(name: 'tokenType')
  final String tokenType;
  
  @JsonKey(name: 'merchantId')
  final int merchantId;
  
  @JsonKey(name: 'name')
  final String name;
  
  @JsonKey(name: 'username')
  final String username;
  
  @JsonKey(name: 'email')
  final String email;
  
  @JsonKey(name: 'restaurantId')
  final int restaurantId;
  
  @JsonKey(name: 'role')
  final String role;
  
  @JsonKey(name: 'roleDescription')
  final String roleDescription;
  
  @JsonKey(name: 'phone')
  final String phone;

  const MerchantLoginResponse({
    required this.token,
    required this.tokenType,
    required this.merchantId,
    required this.name,
    required this.username,
    required this.email,
    required this.restaurantId,
    required this.role,
    required this.roleDescription,
    required this.phone,
  });

  /// 从JSON创建实例
  factory MerchantLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$MerchantLoginResponseFromJson(json);

  /// 转换为JSON
  Map<String, dynamic> toJson() => _$MerchantLoginResponseToJson(this);

  /// 创建副本
  MerchantLoginResponse copyWith({
    String? token,
    String? tokenType,
    int? merchantId,
    String? name,
    String? username,
    String? email,
    int? restaurantId,
    String? role,
    String? roleDescription,
    String? phone,
  }) {
    return MerchantLoginResponse(
      token: token ?? this.token,
      tokenType: tokenType ?? this.tokenType,
      merchantId: merchantId ?? this.merchantId,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      restaurantId: restaurantId ?? this.restaurantId,
      role: role ?? this.role,
      roleDescription: roleDescription ?? this.roleDescription,
      phone: phone ?? this.phone,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MerchantLoginResponse &&
        other.token == token &&
        other.tokenType == tokenType &&
        other.merchantId == merchantId &&
        other.name == name &&
        other.username == username &&
        other.email == email &&
        other.restaurantId == restaurantId &&
        other.role == role &&
        other.roleDescription == roleDescription &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return token.hashCode ^
        tokenType.hashCode ^
        merchantId.hashCode ^
        name.hashCode ^
        username.hashCode ^
        email.hashCode ^
        restaurantId.hashCode ^
        role.hashCode ^
        roleDescription.hashCode ^
        phone.hashCode;
  }

  @override
  String toString() {
    return 'MerchantLoginResponse(token: $token, tokenType: $tokenType, merchantId: $merchantId, name: $name, username: $username, email: $email, restaurantId: $restaurantId, role: $role, roleDescription: $roleDescription, phone: $phone)';
  }
}