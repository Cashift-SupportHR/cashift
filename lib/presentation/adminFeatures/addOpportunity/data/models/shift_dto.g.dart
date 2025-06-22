// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftDto _$ShiftDtoFromJson(Map<String, dynamic> json) => ShiftDto(
      description: json['description'] as String?,
      listShift: (json['listShift'] as List<dynamic>?)
          ?.map((e) => ListShiftDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShiftDtoToJson(ShiftDto instance) => <String, dynamic>{
      'description': instance.description,
      'listShift': instance.listShift,
    };

ListShiftDto _$ListShiftDtoFromJson(Map<String, dynamic> json) => ListShiftDto(
      id: (json['id'] as num?)?.toInt(),
      shiftName: json['shiftName'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      startShift: json['startShift'] as String?,
      hoursCount: (json['hoursCount'] as num?)?.toInt(),
    )..jobId = (json['jobId'] as num?)?.toInt();

Map<String, dynamic> _$ListShiftDtoToJson(ListShiftDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shiftName': instance.shiftName,
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'startShift': instance.startShift,
      'hoursCount': instance.hoursCount,
      'jobId': instance.jobId,
    };
