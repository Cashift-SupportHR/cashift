// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusPointDto _$FocusPointDtoFromJson(Map<String, dynamic> json) =>
    FocusPointDto(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      image: json['image'] as String?,
      focusPointName: json['focusPointName'] as String?,
      projectName: json['projectName'] as String?,
      focusPointLookUp: json['focusPointLookUp'] as String?,
      freelanceType: json['freelanceType'] as String?,
      focusPointType: json['focusPointType'] as String?,
      addedDate: json['addedDate'] as String?,
      statusName: json['statusName'] as String?,
      shifts: (json['listShifts'] as List<dynamic>?)
          ?.map((e) => ShiftFocusPointDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FocusPointDtoToJson(FocusPointDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'focusPointName': instance.focusPointName,
      'projectName': instance.projectName,
      'focusPointLookUp': instance.focusPointLookUp,
      'freelanceType': instance.freelanceType,
      'focusPointType': instance.focusPointType,
      'addedDate': instance.addedDate,
      'statusName': instance.statusName,
      'projectId': instance.projectId,
      'listShifts': instance.shifts,
    };
