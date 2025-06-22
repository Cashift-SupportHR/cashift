// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'term_condition_certificate_payment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TermConditionCertificatePaymentDto _$TermConditionCertificatePaymentDtoFromJson(
        Map<String, dynamic> json) =>
    TermConditionCertificatePaymentDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TermConditionCertificatePaymentDtoToJson(
        TermConditionCertificatePaymentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
