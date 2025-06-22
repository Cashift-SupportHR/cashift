// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_filter_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobFilterData _$JobFilterDataFromJson(Map<String, dynamic> json) =>
    JobFilterData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$JobFilterDataToJson(JobFilterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
