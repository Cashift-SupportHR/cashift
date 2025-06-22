// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_attendance_departure_image_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackAttendanceDepartureImageDto _$TrackAttendanceDepartureImageDtoFromJson(
        Map<String, dynamic> json) =>
    TrackAttendanceDepartureImageDto(
      id: (json['id'] as num?)?.toInt(),
      trackFaceRecognitionRequestId:
          (json['trackFaceRecognitionRequestId'] as num?)?.toInt(),
      faceRecognitionPath: json['faceRecognitionPath'] as String?,
      addedDate: json['addedDate'] as String?,
    );

Map<String, dynamic> _$TrackAttendanceDepartureImageDtoToJson(
        TrackAttendanceDepartureImageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trackFaceRecognitionRequestId': instance.trackFaceRecognitionRequestId,
      'faceRecognitionPath': instance.faceRecognitionPath,
      'addedDate': instance.addedDate,
    };
