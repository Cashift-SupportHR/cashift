// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_focus_point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftFocusPointDto _$ShiftFocusPointDtoFromJson(Map<String, dynamic> json) =>
    ShiftFocusPointDto(
      id: json['id'] as int?,
      shiftName: json['shiftName'] as String?,
    )..shiftId = json['shiftId'] as int?;

Map<String, dynamic> _$ShiftFocusPointDtoToJson(ShiftFocusPointDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shiftId': instance.shiftId,
      'shiftName': instance.shiftName,
    };
