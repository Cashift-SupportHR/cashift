// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_types_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceTypesDto _$InsuranceTypesDtoFromJson(Map<String, dynamic> json) =>
    InsuranceTypesDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$InsuranceTypesDtoToJson(InsuranceTypesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
