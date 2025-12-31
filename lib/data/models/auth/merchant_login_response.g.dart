// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MerchantLoginResponseImpl _$$MerchantLoginResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MerchantLoginResponseImpl(
  token: json['token'] as String,
  tokenType: json['tokenType'] as String,
  merchantId: (json['merchantId'] as num).toInt(),
  name: json['name'] as String,
  username: json['username'] as String,
  email: json['email'] as String,
  restaurantId: (json['restaurantId'] as num).toInt(),
  role: json['role'] as String,
  roleDescription: json['roleDescription'] as String,
  phone: json['phone'] as String,
);

Map<String, dynamic> _$$MerchantLoginResponseImplToJson(
  _$MerchantLoginResponseImpl instance,
) => <String, dynamic>{
  'token': instance.token,
  'tokenType': instance.tokenType,
  'merchantId': instance.merchantId,
  'name': instance.name,
  'username': instance.username,
  'email': instance.email,
  'restaurantId': instance.restaurantId,
  'role': instance.role,
  'roleDescription': instance.roleDescription,
  'phone': instance.phone,
};
