// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uniform_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniformDto _$UniformDtoFromJson(Map<String, dynamic> json) => UniformDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      jobUniformDetails: (json['jobUniformDetails'] as List<dynamic>?)
          ?.map((e) => JobUniformDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UniformDtoToJson(UniformDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'jobUniformDetails': instance.jobUniformDetails,
    };

JobUniformDetail _$JobUniformDetailFromJson(Map<String, dynamic> json) =>
    JobUniformDetail(
      jobUniformId: (json['jobUniformId'] as num?)?.toInt(),
      uniFormImage: json['uniFormImage'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$JobUniformDetailToJson(JobUniformDetail instance) =>
    <String, dynamic>{
      'jobUniformId': instance.jobUniformId,
      'uniFormImage': instance.uniFormImage,
      'description': instance.description,
    };
