// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_traking_details_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleTrakingDetailsPrams _$VehicleTrakingDetailsPramsFromJson(
  Map<String, dynamic> json,
) => VehicleTrakingDetailsPrams(
  vehicleHandoverId: (json['vehicleHandoverId'] as num?)?.toInt(),
  isVehicleHandover: json['isVehicleHandover'] as bool?,
  vehicleId: (json['vehicleId'] as num?)?.toInt(),
  startShiftDateTime: json['startShiftDateTime'] as String?,
  endShiftDateTime: json['endShiftDateTime'] as String?,
);

Map<String, dynamic> _$VehicleTrakingDetailsPramsToJson(
  VehicleTrakingDetailsPrams instance,
) => <String, dynamic>{
  'vehicleId': instance.vehicleId,
  'vehicleHandoverId': instance.vehicleHandoverId,
  'isVehicleHandover': instance.isVehicleHandover,
  'startShiftDateTime': instance.startShiftDateTime,
  'endShiftDateTime': instance.endShiftDateTime,
};
