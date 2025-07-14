// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobItem _$JobItemFromJson(Map<String, dynamic> json) => JobItem(
      id: (json['id'] as num?)?.toInt(),
      jobName: json['jobName'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$JobItemToJson(JobItem instance) => <String, dynamic>{
      'id': instance.id,
      'jobName': instance.jobName,
      'imagePath': instance.imagePath,
    };
