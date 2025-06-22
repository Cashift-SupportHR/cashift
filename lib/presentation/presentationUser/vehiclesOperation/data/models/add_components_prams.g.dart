// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_components_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddComponentsPrams _$AddComponentsPramsFromJson(Map<String, dynamic> json) =>
    AddComponentsPrams(
      vehicleHandoverId: (json['vehicleHandoverId'] as num?)?.toInt(),
      vehicleComponentsStatuses:
          (json['vehicleComponentsStatuses'] as List<dynamic>?)
              ?.map((e) =>
                  VehicleComponentsStatuse.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$AddComponentsPramsToJson(AddComponentsPrams instance) =>
    <String, dynamic>{
      'vehicleHandoverId': instance.vehicleHandoverId,
      'vehicleComponentsStatuses': instance.vehicleComponentsStatuses,
    };

VehicleComponentsStatuse _$VehicleComponentsStatuseFromJson(
        Map<String, dynamic> json) =>
    VehicleComponentsStatuse(
      vehicleComponentId: (json['vehicleComponentId'] as num?)?.toInt(),
      componentStatus: json['componentStatus'] as bool?,
    );

Map<String, dynamic> _$VehicleComponentsStatuseToJson(
        VehicleComponentsStatuse instance) =>
    <String, dynamic>{
      'vehicleComponentId': instance.vehicleComponentId,
      'componentStatus': instance.componentStatus,
    };
