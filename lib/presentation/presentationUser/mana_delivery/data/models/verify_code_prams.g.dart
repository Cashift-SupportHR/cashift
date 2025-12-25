// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodePrams _$VerifyCodePramsFromJson(Map<String, dynamic> json) =>
    VerifyCodePrams(
      orderId: (json['orderId'] as num?)?.toInt(),
      code: json['code'] as String?,
    );

Map<String, dynamic> _$VerifyCodePramsToJson(VerifyCodePrams instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'code': instance.code,
    };
