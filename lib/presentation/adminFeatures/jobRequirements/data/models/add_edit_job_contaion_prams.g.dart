// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit_job_contaion_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEditJobContaionPrams _$AddEditJobContaionPramsFromJson(
        Map<String, dynamic> json) =>
    AddEditJobContaionPrams(
      id: (json['id'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
      descriptionEn: json['descriptionEn'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
    );

Map<String, dynamic> _$AddEditJobContaionPramsToJson(
        AddEditJobContaionPrams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobId': instance.jobId,
      'descriptionEn': instance.descriptionEn,
      'descriptionAr': instance.descriptionAr,
    };
