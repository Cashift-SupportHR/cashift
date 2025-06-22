// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_vehicle_zone_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterVehicleZoneParams _$FilterVehicleZoneParamsFromJson(
        Map<String, dynamic> json) =>
    FilterVehicleZoneParams(
      projectId: (json['ProjectId'] as num?)?.toInt(),
      shiftId: (json['ShiftId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FilterVehicleZoneParamsToJson(
        FilterVehicleZoneParams instance) =>
    <String, dynamic>{
      'ProjectId': instance.projectId,
      'ShiftId': instance.shiftId,
    };
