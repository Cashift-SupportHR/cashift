// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_definition_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryDefinitionRequestDto _$SalaryDefinitionRequestDtoFromJson(
        Map<String, dynamic> json) =>
    SalaryDefinitionRequestDto(
      id: json['id'] as String?,
      title: json['title'] as String?,
      slipForDistination: json['slipForDistination'] as String?,
      resonF: json['resonF'] as String?,
      needStamp: json['needStamp'] as String?,
      createdDate: json['createdDate'] as String?,
      rejectReason: json['rejectReason'] as String?,
      fileAttachment: json['fileAttachment'] as String?,
    );

Map<String, dynamic> _$SalaryDefinitionRequestDtoToJson(
        SalaryDefinitionRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slipForDistination': instance.slipForDistination,
      'resonF': instance.resonF,
      'needStamp': instance.needStamp,
      'createdDate': instance.createdDate,
      'rejectReason': instance.rejectReason,
      'fileAttachment': instance.fileAttachment,
    };
