// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LastPriceDto _$LastPriceDtoFromJson(Map<String, dynamic> json) => LastPriceDto(
      fromDay: json['fromDay'] as int?,
      toDay: json['toDay'] as int?,
      salary: (json['salary'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LastPriceDtoToJson(LastPriceDto instance) =>
    <String, dynamic>{
      'fromDay': instance.fromDay,
      'toDay': instance.toDay,
      'salary': instance.salary,
    };
