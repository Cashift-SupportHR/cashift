// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_track_attendance_departure_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestTrackAttendanceDepartureParams
    _$RequestTrackAttendanceDepartureParamsFromJson(
            Map<String, dynamic> json) =>
        RequestTrackAttendanceDepartureParams(
          id: (json['id'] as num?)?.toInt(),
          freelancerId: (json['freelancerId'] as num?)?.toInt(),
          startDate: json['startDate'] as String?,
          endDate: json['endDate'] as String?,
        );

Map<String, dynamic> _$RequestTrackAttendanceDepartureParamsToJson(
        RequestTrackAttendanceDepartureParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'freelancerId': instance.freelancerId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
