// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geofence_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeofenceDto _$GeofenceDtoFromJson(Map<String, dynamic> json) => GeofenceDto(
      latitude: json['latitude'] as String?,
      longtude: json['longtude'] as String?,
      radius: json['radius'] as String?,
      projectName: json['projectName'] as String?,
      isAutoAttendance: json['isAutoAttendance'] as bool?,
    );

Map<String, dynamic> _$GeofenceDtoToJson(GeofenceDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'radius': instance.radius,
      'projectName': instance.projectName,
      'isAutoAttendance': instance.isAutoAttendance,
    };
