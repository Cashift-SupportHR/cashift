// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_project_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationProjectParams _$LocationProjectParamsFromJson(
        Map<String, dynamic> json) =>
    LocationProjectParams(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      latitude: json['latitude'] as String?,
      longtude: json['longtude'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LocationProjectParamsToJson(
        LocationProjectParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'projectId': instance.projectId,
    };
