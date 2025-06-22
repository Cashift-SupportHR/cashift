// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_vehicle_handover_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateVehicleHandoverDto _$CreateVehicleHandoverDtoFromJson(
        Map<String, dynamic> json) =>
    CreateVehicleHandoverDto(
      vehicleId: (json['vehicleId'] as num?)?.toInt(),
      freelancerInfoId: (json['freelancerInfoId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      isComplete: json['isComplete'] as bool?,
    );

Map<String, dynamic> _$CreateVehicleHandoverDtoToJson(
        CreateVehicleHandoverDto instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'freelancerInfoId': instance.freelancerInfoId,
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'shiftId': instance.shiftId,
      'id': instance.id,
      'isComplete': instance.isComplete,
    };
