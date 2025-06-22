// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_opportunities_available_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchOpportunitiesAvailableParams _$SearchOpportunitiesAvailableParamsFromJson(
        Map<String, dynamic> json) =>
    SearchOpportunitiesAvailableParams(
      cityId: (json['cityId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      fromDate: json['fromDate'] as String?,
      fromSalary: (json['fromSalary'] as num?)?.toInt(),
      toSalary: (json['toSalary'] as num?)?.toInt(),
      toDate: json['toDate'] as String?,
    );

Map<String, dynamic> _$SearchOpportunitiesAvailableParamsToJson(
        SearchOpportunitiesAvailableParams instance) =>
    <String, dynamic>{
      'cityId': instance.cityId,
      'projectId': instance.projectId,
      'jobId': instance.jobId,
      'companyId': instance.companyId,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'fromSalary': instance.fromSalary,
      'toSalary': instance.toSalary,
    };
