// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_tabs_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityTabsDto _$OpportunityTabsDtoFromJson(Map<String, dynamic> json) =>
    OpportunityTabsDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OpportunityTabsDtoToJson(OpportunityTabsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
