// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimePriceDto _$TimePriceDtoFromJson(Map<String, dynamic> json) => TimePriceDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TimePriceDtoToJson(TimePriceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
