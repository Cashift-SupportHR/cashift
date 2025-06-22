// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_opportunity_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationOpportunityParams _$PaginationOpportunityParamsFromJson(
        Map<String, dynamic> json) =>
    PaginationOpportunityParams(
      projectId: (json['projectId'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      jobId: (json['jobId'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      pageSize: (json['pageSize'] as num?)?.toInt(),
      type: (json['type'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationOpportunityParamsToJson(
        PaginationOpportunityParams instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'type': instance.type,
      'projectId': instance.projectId,
      'jobId': instance.jobId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
