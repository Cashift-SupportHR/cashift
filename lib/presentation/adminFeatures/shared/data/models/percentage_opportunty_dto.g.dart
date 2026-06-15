// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'percentage_opportunty_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PercentageOpportuntyDto _$PercentageOpportuntyDtoFromJson(
  Map<String, dynamic> json,
) => PercentageOpportuntyDto(
  name: json['name'] as String?,
  percentage: json['percentage'] as num?,
  label: json['label'] as String?,
  count: json['count'] as num?,
);

Map<String, dynamic> _$PercentageOpportuntyDtoToJson(
  PercentageOpportuntyDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'percentage': instance.percentage,
  'label': instance.label,
  'count': instance.count,
};
