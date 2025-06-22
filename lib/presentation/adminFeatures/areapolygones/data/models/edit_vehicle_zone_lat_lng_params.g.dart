// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_vehicle_zone_lat_lng_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditVehicleZoneLatLngParams _$EditVehicleZoneLatLngParamsFromJson(
        Map<String, dynamic> json) =>
    EditVehicleZoneLatLngParams(
      id: (json['id'] as num?)?.toInt(),
      latlngs: (json['latlngs'] as List<dynamic>?)
          ?.map((e) => VehicleZoneLatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EditVehicleZoneLatLngParamsToJson(
        EditVehicleZoneLatLngParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latlngs': instance.latlngs,
    };
