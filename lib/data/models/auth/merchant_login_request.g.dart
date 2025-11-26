// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantLoginRequest _$MerchantLoginRequestFromJson(
  Map<String, dynamic> json,
) => MerchantLoginRequest(
  username: json['username'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$MerchantLoginRequestToJson(
  MerchantLoginRequest instance,
) => <String, dynamic>{
  'username': instance.username,
  'password': instance.password,
};
