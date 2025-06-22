// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_pricing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodPricingDto _$PeriodPricingDtoFromJson(Map<String, dynamic> json) =>
    PeriodPricingDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      timeName: json['timeName'] as String?,
      price: json['price'] as String?,
      fromDay: json['fromDay'] as String?,
      toDay: json['toDay'] as String?,
    );

Map<String, dynamic> _$PeriodPricingDtoToJson(PeriodPricingDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'timeName': instance.timeName,
      'price': instance.price,
      'fromDay': instance.fromDay,
      'toDay': instance.toDay,
    };
