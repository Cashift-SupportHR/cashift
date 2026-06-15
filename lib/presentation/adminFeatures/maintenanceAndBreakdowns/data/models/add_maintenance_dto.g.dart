// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_maintenance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMaintenanceDto _$AddMaintenanceDtoFromJson(Map<String, dynamic> json) =>
    AddMaintenanceDto(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      faultsMaintenanceTypeId: (json['faultsMaintenanceTypeId'] as num?)
          ?.toInt(),
      scheduleEmployeeWorkId: (json['scheduleEmployeeWorkId'] as num?)?.toInt(),
      freeLanceId: (json['freeLanceId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddMaintenanceDtoToJson(AddMaintenanceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'projectId': instance.projectId,
      'companyId': instance.companyId,
      'shiftId': instance.shiftId,
      'faultsMaintenanceTypeId': instance.faultsMaintenanceTypeId,
      'scheduleEmployeeWorkId': instance.scheduleEmployeeWorkId,
      'freeLanceId': instance.freeLanceId,
    };
