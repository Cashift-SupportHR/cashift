// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDetailsDto _$JobDetailsDtoFromJson(Map<String, dynamic> json) =>
    JobDetailsDto(
      conditionName: (json['conditionName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      companyInfo: json['companyInfo'] == null
          ? null
          : CompanyInfo.fromJson(json['companyInfo'] as Map<String, dynamic>),
      availableJob: (json['availableJob'] as List<dynamic>?)
          ?.map((e) => JobOfferDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      jobInfo: json['opportuntyAvalibleDetail'] == null
          ? null
          : JobOfferDto.fromJson(
              json['opportuntyAvalibleDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobDetailsDtoToJson(JobDetailsDto instance) =>
    <String, dynamic>{
      'companyInfo': instance.companyInfo,
      'opportuntyAvalibleDetail': instance.jobInfo,
      'availableJob': instance.availableJob,
      'conditionName': instance.conditionName,
    };
