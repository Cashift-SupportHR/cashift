// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_info_focus_point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectInfoFocusPointDto _$ProjectInfoFocusPointDtoFromJson(
  Map<String, dynamic> json,
) => ProjectInfoFocusPointDto(
  projectName: json['projectName'] as String?,
  date: json['date'] as String?,
  shiftName: json['shiftName'] as String?,
  startShift: json['startShift'] as String?,
  endShift: json['endShift'] as String?,
);

Map<String, dynamic> _$ProjectInfoFocusPointDtoToJson(
  ProjectInfoFocusPointDto instance,
) => <String, dynamic>{
  'projectName': instance.projectName,
  'date': instance.date,
  'shiftName': instance.shiftName,
  'startShift': instance.startShift,
  'endShift': instance.endShift,
};
