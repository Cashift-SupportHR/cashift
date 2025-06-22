// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_receive_vehicle_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmReceiveVehicleParams _$ConfirmReceiveVehicleParamsFromJson(
        Map<String, dynamic> json) =>
    ConfirmReceiveVehicleParams(
      vehicleHandoverId: (json['vehicleHandoverId'] as num?)?.toInt(),
      handoverStatus: (json['handoverStatus'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ConfirmReceiveVehicleParamsToJson(
        ConfirmReceiveVehicleParams instance) =>
    <String, dynamic>{
      'vehicleHandoverId': instance.vehicleHandoverId,
      'handoverStatus': instance.handoverStatus,
      'description': instance.description,
    };
