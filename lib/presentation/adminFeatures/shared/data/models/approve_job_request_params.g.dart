// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_job_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApproveJobRequestParams _$ApproveJobRequestParamsFromJson(
        Map<String, dynamic> json) =>
    ApproveJobRequestParams(
      id: (json['id'] as num?)?.toInt(),
      approve: json['approve'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ApproveJobRequestParamsToJson(
        ApproveJobRequestParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'approve': instance.approve,
      'description': instance.description,
    };
