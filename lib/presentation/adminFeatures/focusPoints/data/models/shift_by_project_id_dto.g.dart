// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_by_project_id_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftByProjectIdDto _$ShiftByProjectIdDtoFromJson(Map<String, dynamic> json) =>
    ShiftByProjectIdDto(
      id: (json['id'] as num?)?.toInt(),
      shiftName: json['shiftName'] as String?,
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$ShiftByProjectIdDtoToJson(
        ShiftByProjectIdDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shiftName': instance.shiftName,
      'isActive': instance.isActive,
    };
