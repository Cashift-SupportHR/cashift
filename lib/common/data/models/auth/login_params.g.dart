// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParams _$LoginParamsFromJson(Map<String, dynamic> json) => LoginParams(
      phone: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      appId: json['appId'] as String?,
    );

Map<String, dynamic> _$LoginParamsToJson(LoginParams instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phone,
      'password': instance.password,
      'appId': instance.appId,
    };
