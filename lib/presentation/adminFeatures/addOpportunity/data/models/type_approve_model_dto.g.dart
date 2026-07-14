// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_approve_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeApproveModelDto _$TypeApproveModelDtoFromJson(Map<String, dynamic> json) =>
    TypeApproveModelDto(
      description: json['description'] as String?,
      typeApprove: (json['typeApprove'] as List<dynamic>?)
          ?.map((e) => TypeApproveDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypeApproveModelDtoToJson(
  TypeApproveModelDto instance,
) => <String, dynamic>{
  'description': instance.description,
  'typeApprove': instance.typeApprove,
};

TypeApproveDto _$TypeApproveDtoFromJson(Map<String, dynamic> json) =>
    TypeApproveDto(
      name: json['name'] as String?,
      type: json['type'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TypeApproveDtoToJson(TypeApproveDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
    };
