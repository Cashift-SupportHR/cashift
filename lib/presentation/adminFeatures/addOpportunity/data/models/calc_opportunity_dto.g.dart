// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calc_opportunity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalcOpportunityDto _$CalcOpportunityDtoFromJson(Map<String, dynamic> json) =>
    CalcOpportunityDto(
      listCalc: (json['listCalc'] as List<dynamic>?)
          ?.map((e) => ListCalcOppDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CalcOpportunityDtoToJson(CalcOpportunityDto instance) =>
    <String, dynamic>{
      'listCalc': instance.listCalc,
      'description': instance.description,
    };

ListCalcOppDto _$ListCalcOppDtoFromJson(Map<String, dynamic> json) =>
    ListCalcOppDto(
      id: (json['id'] as num?)?.toInt(),
      calcOppName: json['calcOppName'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ListCalcOppDtoToJson(ListCalcOppDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'calcOppName': instance.calcOppName,
      'description': instance.description,
    };
