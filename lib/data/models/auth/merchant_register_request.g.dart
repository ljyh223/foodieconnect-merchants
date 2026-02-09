// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MerchantRegisterRequestImpl _$$MerchantRegisterRequestImplFromJson(
  Map<String, dynamic> json,
) => _$MerchantRegisterRequestImpl(
  username: json['username'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  name: json['name'] as String,
  phone: json['phone'] as String?,
  restaurantName: json['restaurantName'] as String,
  restaurantType: json['restaurantType'] as String,
  restaurantAddress: json['restaurantAddress'] as String,
  restaurantImage: json['restaurantImage'] as String?,
);

Map<String, dynamic> _$$MerchantRegisterRequestImplToJson(
  _$MerchantRegisterRequestImpl instance,
) => <String, dynamic>{
  'username': instance.username,
  'email': instance.email,
  'password': instance.password,
  'name': instance.name,
  'phone': instance.phone,
  'restaurantName': instance.restaurantName,
  'restaurantType': instance.restaurantType,
  'restaurantAddress': instance.restaurantAddress,
  'restaurantImage': instance.restaurantImage,
};
