// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_vehicle_handover_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateVehicleHandoverPrams _$CreateVehicleHandoverPramsFromJson(
        Map<String, dynamic> json) =>
    CreateVehicleHandoverPrams(
      vehicleId: (json['vehicleId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateVehicleHandoverPramsToJson(
        CreateVehicleHandoverPrams instance) =>
    <String, dynamic>{
      'vehicleId': instance.vehicleId,
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'shiftId': instance.shiftId,
    };
