// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bail_term_and_condition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BailTermAndConditionDto _$BailTermAndConditionDtoFromJson(
        Map<String, dynamic> json) =>
    BailTermAndConditionDto(
      id: (json['id'] as num?)?.toInt(),
      conditionName: json['conditionName'] as String?,
      statusId: (json['statusId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BailTermAndConditionDtoToJson(
        BailTermAndConditionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conditionName': instance.conditionName,
      'statusId': instance.statusId,
    };
