// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_relax_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayRelaxDto _$DayRelaxDtoFromJson(Map<String, dynamic> json) => DayRelaxDto(
      dayValue: (json['dayValue'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$DayRelaxDtoToJson(DayRelaxDto instance) =>
    <String, dynamic>{
      'dayValue': instance.dayValue,
      'name': instance.name,
    };
