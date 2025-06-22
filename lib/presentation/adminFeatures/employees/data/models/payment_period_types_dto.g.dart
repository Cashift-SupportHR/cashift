// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_period_types_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentPeriodTypesDto _$PaymentPeriodTypesDtoFromJson(
        Map<String, dynamic> json) =>
    PaymentPeriodTypesDto(
      code: json['code'] as String?,
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentPeriodTypesDtoToJson(
        PaymentPeriodTypesDto instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'id': instance.id,
    };
