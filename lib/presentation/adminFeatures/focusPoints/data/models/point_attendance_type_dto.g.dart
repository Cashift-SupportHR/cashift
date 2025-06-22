// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_attendance_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointAttendanceTypeDto _$PointAttendanceTypeDtoFromJson(
        Map<String, dynamic> json) =>
    PointAttendanceTypeDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PointAttendanceTypeDtoToJson(
        PointAttendanceTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
