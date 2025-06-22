// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_job_uniform_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddJobUniformParams _$AddJobUniformParamsFromJson(Map<String, dynamic> json) =>
    AddJobUniformParams(
      id: (json['Id'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      jobId: (json['JobId'] as num?)?.toInt(),
      description: json['Description'] as String?,
      jobUniformCategoryId: (json['JobUniformCategoryId'] as num?)?.toInt(),
      file: _$JsonConverterFromJson<String, File>(
          json['File'], const FileJsonConverter().fromJson),
    );

Map<String, dynamic> _$AddJobUniformParamsToJson(
        AddJobUniformParams instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'Id': value,
      'JobId': instance.jobId,
      'companyId': instance.companyId,
      if (instance.description case final value?) 'Description': value,
      'JobUniformCategoryId': instance.jobUniformCategoryId,
      if (_$JsonConverterToJson<String, File>(
              instance.file, const FileJsonConverter().toJson)
          case final value?)
        'File': value,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
