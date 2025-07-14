// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_password_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestPasswordParams _$RestPasswordParamsFromJson(Map<String, dynamic> json) =>
    RestPasswordParams(
      phoneNumber: json['phoneNumber'] as String?,
      code: json['code'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RestPasswordParamsToJson(RestPasswordParams instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'code': instance.code,
      'password': instance.password,
    };
