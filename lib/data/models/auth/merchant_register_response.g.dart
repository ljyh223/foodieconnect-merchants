// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MerchantRegisterResponseImpl _$$MerchantRegisterResponseImplFromJson(
  Map<String, dynamic> json,
) => _$MerchantRegisterResponseImpl(
  merchantId: (json['merchantId'] as num).toInt(),
  username: json['username'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String?,
  restaurantId: (json['restaurantId'] as num).toInt(),
  role: json['role'] as String,
  roleDescription: json['roleDescription'] as String,
  status: json['status'] as String,
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$$MerchantRegisterResponseImplToJson(
  _$MerchantRegisterResponseImpl instance,
) => <String, dynamic>{
  'merchantId': instance.merchantId,
  'username': instance.username,
  'email': instance.email,
  'name': instance.name,
  'phone': instance.phone,
  'restaurantId': instance.restaurantId,
  'role': instance.role,
  'roleDescription': instance.roleDescription,
  'status': instance.status,
  'createdAt': instance.createdAt,
};
