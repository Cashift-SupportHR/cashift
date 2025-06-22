// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covenant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovenantDto _$CovenantDtoFromJson(Map<String, dynamic> json) => CovenantDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      priorityNumber: (json['priorityNumber'] as num?)?.toInt(),
      attendanceList: json['attendanceList'] as List<dynamic>?,
    );

Map<String, dynamic> _$CovenantDtoToJson(CovenantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'projectId': instance.projectId,
      'priorityNumber': instance.priorityNumber,
      'attendanceList': instance.attendanceList,
    };
