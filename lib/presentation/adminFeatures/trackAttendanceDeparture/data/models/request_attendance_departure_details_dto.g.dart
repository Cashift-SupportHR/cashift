// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_attendance_departure_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestAttendanceDepartureDetailsDto
    _$RequestAttendanceDepartureDetailsDtoFromJson(Map<String, dynamic> json) =>
        RequestAttendanceDepartureDetailsDto(
          freelancerProfileImage: json['freelancerProfileImage'] as String?,
          freelancerName: json['freelancerName'] as String?,
          freelancerPhoneNumber: json['freelancerPhoneNumber'] as String?,
          freelancerIdNumber: json['freelancerIdNumber'] as String?,
          freelancerNationality: json['freelancerNationality'] as String?,
          trackFaceRecognitionDetailsList:
              (json['trackFaceRecognitionDetailsList'] as List<dynamic>?)
                  ?.map((e) => TrackFaceRecognitionDetailsListDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList(),
        );

Map<String, dynamic> _$RequestAttendanceDepartureDetailsDtoToJson(
        RequestAttendanceDepartureDetailsDto instance) =>
    <String, dynamic>{
      'freelancerProfileImage': instance.freelancerProfileImage,
      'freelancerName': instance.freelancerName,
      'freelancerPhoneNumber': instance.freelancerPhoneNumber,
      'freelancerIdNumber': instance.freelancerIdNumber,
      'freelancerNationality': instance.freelancerNationality,
      'trackFaceRecognitionDetailsList':
          instance.trackFaceRecognitionDetailsList,
    };

TrackFaceRecognitionDetailsListDto _$TrackFaceRecognitionDetailsListDtoFromJson(
        Map<String, dynamic> json) =>
    TrackFaceRecognitionDetailsListDto(
      id: (json['id'] as num?)?.toInt(),
      trackFaceRecognitionRequestId:
          (json['trackFaceRecognitionRequestId'] as num?)?.toInt(),
      faceRecognitionPath: json['faceRecognitionPath'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      shiftId: (json['shiftId'] as num?)?.toInt(),
      shiftName: json['shiftName'] as String?,
      addedDate: json['addedDate'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$TrackFaceRecognitionDetailsListDtoToJson(
        TrackFaceRecognitionDetailsListDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trackFaceRecognitionRequestId': instance.trackFaceRecognitionRequestId,
      'faceRecognitionPath': instance.faceRecognitionPath,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'shiftId': instance.shiftId,
      'shiftName': instance.shiftName,
      'addedDate': instance.addedDate,
      'status': instance.status,
      'notes': instance.notes,
    };
