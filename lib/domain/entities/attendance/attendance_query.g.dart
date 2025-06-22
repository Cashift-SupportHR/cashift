// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceQuery _$AttendanceQueryFromJson(Map<String, dynamic> json) =>
    AttendanceQuery(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longtude'] as num?)?.toDouble(),
      projectId: json['projectId'] as String?,
      id: (json['id'] as num?)?.toInt(),
      presentId: (json['presentId'] as num?)?.toInt(),
      isMock: json['isMock'] as bool?,
    );

Map<String, dynamic> _$AttendanceQueryToJson(AttendanceQuery instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longtude': instance.longitude,
      'projectId': instance.projectId,
      'id': instance.id,
      'presentId': instance.presentId,
      'isMock': instance.isMock,
    };
