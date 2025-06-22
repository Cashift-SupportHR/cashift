// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_shift_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterShiftParams _$FilterShiftParamsFromJson(Map<String, dynamic> json) =>
    FilterShiftParams(
      projectId: (json['ProjectId'] as num?)?.toInt(),
      jobId: (json['JobId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FilterShiftParamsToJson(FilterShiftParams instance) =>
    <String, dynamic>{
      'ProjectId': instance.projectId,
      'JobId': instance.jobId,
    };
