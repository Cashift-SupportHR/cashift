// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_attendance_focus_point_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartAttendanceFocusPointParams _$StartAttendanceFocusPointParamsFromJson(
        Map<String, dynamic> json) =>
    StartAttendanceFocusPointParams(
      id: (json['id'] as num?)?.toInt(),
      focusPointId: json['focusPointId'] as String?,
      latitude: json['latitude'] as String?,
      longtude: json['longtude'] as String?,
    );

Map<String, dynamic> _$StartAttendanceFocusPointParamsToJson(
        StartAttendanceFocusPointParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'focusPointId': instance.focusPointId,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
    };
