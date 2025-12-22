// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_terms_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptTermsPrams _$AcceptTermsPramsFromJson(Map<String, dynamic> json) =>
    AcceptTermsPrams(
      orderId: (json['orderId'] as num?)?.toInt(),
      termsType: (json['termsType'] as num?)?.toInt(),
      termsVersion: json['termsVersion'] as String?,
    );

Map<String, dynamic> _$AcceptTermsPramsToJson(AcceptTermsPrams instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'termsType': instance.termsType,
      'termsVersion': instance.termsVersion,
    };
