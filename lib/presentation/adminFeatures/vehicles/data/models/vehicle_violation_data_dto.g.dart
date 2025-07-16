// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_violation_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractViolationDataDto _$ContractViolationDataDtoFromJson(
        Map<String, dynamic> json) =>
    ContractViolationDataDto(
      contractViolations: (json['contractViolations'] as List<dynamic>?)
          ?.map((e) => ContractViolationDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ContractViolationDataDtoToJson(
        ContractViolationDataDto instance) =>
    <String, dynamic>{
      'contractViolations': instance.contractViolations,
      'count': instance.count,
    };
