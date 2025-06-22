// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_phone_code_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckPhoneCodeParams _$CheckPhoneCodeParamsFromJson(
        Map<String, dynamic> json) =>
    CheckPhoneCodeParams(
      id: (json['id'] as num?)?.toInt(),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$CheckPhoneCodeParamsToJson(
        CheckPhoneCodeParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
    };
