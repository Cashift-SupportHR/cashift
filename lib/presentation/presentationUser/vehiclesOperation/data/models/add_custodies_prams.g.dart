// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_custodies_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCustodiesPrams _$AddCustodiesPramsFromJson(Map<String, dynamic> json) =>
    AddCustodiesPrams(
      vehicleHandoverId: (json['vehicleHandoverId'] as num?)?.toInt(),
      vehicleCustodiesStatuses:
          (json['vehicleCustodiesStatuses'] as List<dynamic>?)
              ?.map((e) =>
                  VehicleCustodiesStatuse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$AddCustodiesPramsToJson(AddCustodiesPrams instance) =>
    <String, dynamic>{
      'vehicleHandoverId': instance.vehicleHandoverId,
      'vehicleCustodiesStatuses': instance.vehicleCustodiesStatuses,
    };

VehicleCustodiesStatuse _$VehicleCustodiesStatuseFromJson(
        Map<String, dynamic> json) =>
    VehicleCustodiesStatuse(
      vehicleCustodyId: (json['vehicleCustodyId'] as num?)?.toInt(),
      custodyStatus: json['custodyStatus'] as bool?,
    );

Map<String, dynamic> _$VehicleCustodiesStatuseToJson(
        VehicleCustodiesStatuse instance) =>
    <String, dynamic>{
      'vehicleCustodyId': instance.vehicleCustodyId,
      'custodyStatus': instance.custodyStatus,
    };
