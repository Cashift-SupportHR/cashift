// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_point_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusPointInfoDto _$FocusPointInfoDtoFromJson(Map<String, dynamic> json) =>
    FocusPointInfoDto(
      freelanceName: json['freelanceName'] as String?,
      projectName: json['projectName'] as String?,
      date: json['date'] as String?,
      shiftName: json['shiftName'] as String?,
    )
      ..startShift = json['startShift'] as String?
      ..endShift = json['endShift'] as String?;

Map<String, dynamic> _$FocusPointInfoDtoToJson(FocusPointInfoDto instance) =>
    <String, dynamic>{
      'freelanceName': instance.freelanceName,
      'projectName': instance.projectName,
      'date': instance.date,
      'shiftName': instance.shiftName,
      'startShift': instance.startShift,
      'endShift': instance.endShift,
    };
