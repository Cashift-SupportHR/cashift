// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_warehouses_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyWarehousesDto _$NearbyWarehousesDtoFromJson(Map<String, dynamic> json) =>
    NearbyWarehousesDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      mapUrl: json['mapUrl'] as String?,
      fullAddress: json['fullAddress'] as String?,
      managerPhone: json['managerPhone'] as String?,
      cityName: json['cityName'] as String?,
      districtName: json['districtName'] as String?,
    );

Map<String, dynamic> _$NearbyWarehousesDtoToJson(
  NearbyWarehousesDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'distanceKm': instance.distanceKm,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'mapUrl': instance.mapUrl,
  'fullAddress': instance.fullAddress,
  'managerPhone': instance.managerPhone,
  'cityName': instance.cityName,
  'districtName': instance.districtName,
};
