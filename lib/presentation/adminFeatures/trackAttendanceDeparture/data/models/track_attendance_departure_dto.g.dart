// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_attendance_departure_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackAttendanceDepartureDto _$TrackAttendanceDepartureDtoFromJson(
        Map<String, dynamic> json) =>
    TrackAttendanceDepartureDto(
      id: (json['id'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      status: json['status'] as String?,
      freelancerId: (json['freelancerId'] as num?)?.toInt(),
      freelancerName: json['freelancerName'] as String?,
      freelancerPhone: json['freelancerPhone'] as String?,
    );

Map<String, dynamic> _$TrackAttendanceDepartureDtoToJson(
        TrackAttendanceDepartureDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'status': instance.status,
      'freelancerId': instance.freelancerId,
      'freelancerName': instance.freelancerName,
      'freelancerPhone': instance.freelancerPhone,
    };
