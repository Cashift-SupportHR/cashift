// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_terms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobTerms _$JobTermsFromJson(Map<String, dynamic> json) => JobTerms(
      statusId: (json['statusId'] as num?)?.toInt(),
      companyLogo: json['companyLogo'] as String?,
      supLogo: json['supLogo'] as String?,
      mainLabel: json['mainLabel'] as String?,
      subMainLabel: json['subMainLabel'] as String?,
      companyName: json['companyName'] as String?,
      conditions: (json['conditionName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      interviewInfo: json['recruitment'] == null
          ? null
          : InterviewInfo.fromJson(json['recruitment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobTermsToJson(JobTerms instance) => <String, dynamic>{
      'statusId': instance.statusId,
      'companyLogo': instance.companyLogo,
      'supLogo': instance.supLogo,
      'mainLabel': instance.mainLabel,
      'subMainLabel': instance.subMainLabel,
      'companyName': instance.companyName,
      'recruitment': instance.interviewInfo,
      'conditionName': instance.conditions,
    };
