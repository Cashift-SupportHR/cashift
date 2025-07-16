// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaintenanceDataDto _$MaintenanceDataDtoFromJson(Map<String, dynamic> json) =>
    MaintenanceDataDto(
      faultsAndMaintenance: (json['faultsAndMaintenance'] as List<dynamic>?)
          ?.map((e) => MaintenanceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MaintenanceDataDtoToJson(MaintenanceDataDto instance) =>
    <String, dynamic>{
      'faultsAndMaintenance': instance.faultsAndMaintenance,
      'count': instance.count,
    };

MaintenanceDto _$MaintenanceDtoFromJson(Map<String, dynamic> json) =>
    MaintenanceDto(
      fautMaintenanceId: (json['fautMaintenanceId'] as num?)?.toInt(),
      faultMaintenanceType: json['faultMaintenanceType'] as String?,
      dateFaultApplying: json['dateFaultApplying'] as String?,
      time: json['time'] as String?,
      description: json['description'] as String?,
      faultMaintenanceImagesBefore:
          (json['faultMaintenanceImagesBefore'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      faultMaintenanceImagesAfter:
          (json['faultMaintenanceImagesAfter'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      adminAction: json['adminAction'] as String?,
      shiftAdminAction: json['shiftAdminAction'] as String?,
      importantLevel: json['importantLevel'] as String?,
      allowEdit: json['allowEdit'] as bool?,
    );

Map<String, dynamic> _$MaintenanceDtoToJson(MaintenanceDto instance) =>
    <String, dynamic>{
      'fautMaintenanceId': instance.fautMaintenanceId,
      'faultMaintenanceType': instance.faultMaintenanceType,
      'dateFaultApplying': instance.dateFaultApplying,
      'time': instance.time,
      'description': instance.description,
      'faultMaintenanceImagesBefore': instance.faultMaintenanceImagesBefore,
      'faultMaintenanceImagesAfter': instance.faultMaintenanceImagesAfter,
      'adminAction': instance.adminAction,
      'shiftAdminAction': instance.shiftAdminAction,
      'importantLevel': instance.importantLevel,
      'allowEdit': instance.allowEdit,
    };
