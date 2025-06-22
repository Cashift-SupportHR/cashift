// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_points_types_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusPointsTypesDto _$FocusPointsTypesDtoFromJson(Map<String, dynamic> json) =>
    FocusPointsTypesDto(
      order: (json['order'] as num?)?.toInt(),
      focusPointTypeName: json['focusPointTypeName'] as String?,
      focusPointTypeCount: (json['focusPointTypeCount'] as num?)?.toInt(),
      imageFocusPointsType: json['imageFocusPointsType'] as String?,
      freelanceApply: (json['freelanceApply'] as List<dynamic>?)
          ?.map((e) => FreelanceApply.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FocusPointsTypesDtoToJson(
        FocusPointsTypesDto instance) =>
    <String, dynamic>{
      'order': instance.order,
      'focusPointTypeName': instance.focusPointTypeName,
      'focusPointTypeCount': instance.focusPointTypeCount,
      'imageFocusPointsType': instance.imageFocusPointsType,
      'freelanceApply': instance.freelanceApply,
    };

FreelanceApply _$FreelanceApplyFromJson(Map<String, dynamic> json) =>
    FreelanceApply(
      totalHourse: (json['totalHourse'] as num?)?.toInt(),
      deviceNumber: json['deviceNumber'] as String?,
      statusColor: json['statusColor'] as String?,
      statusName: json['statusName'] as String?,
      deviceName: json['deviceName'] as String?,
      imageFocusPoints: json['imageFocusPoints'] as String?,
      freelanceName: json['freelanceName'] as String?,
      freelanceType: json['freelanceType'] as String?,
      pointName: json['pointName'] as String?,
      startDateTime: json['startDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      isStart: json['isStart'] as bool?,
      isBreak: json['isBreak'] as bool?,
    );

Map<String, dynamic> _$FreelanceApplyToJson(FreelanceApply instance) =>
    <String, dynamic>{
      'totalHourse': instance.totalHourse,
      'deviceNumber': instance.deviceNumber,
      'statusColor': instance.statusColor,
      'statusName': instance.statusName,
      'deviceName': instance.deviceName,
      'imageFocusPoints': instance.imageFocusPoints,
      'freelanceName': instance.freelanceName,
      'freelanceType': instance.freelanceType,
      'pointName': instance.pointName,
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'isStart': instance.isStart,
      'isBreak': instance.isBreak,
    };
