// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodOrderDto _$PeriodOrderDtoFromJson(Map<String, dynamic> json) =>
    PeriodOrderDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PeriodOrderDtoToJson(PeriodOrderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
