// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleLocationDto _$VehicleLocationDtoFromJson(Map<String, dynamic> json) =>
    VehicleLocationDto(
      zone: (json['zone'] as List<dynamic>?)
          ?.map((e) => Zone.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentLocation: json['currentLocation'] == null
          ? null
          : CurrentLocation.fromJson(
              json['currentLocation'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VehicleLocationDtoToJson(VehicleLocationDto instance) =>
    <String, dynamic>{
      'zone': instance.zone,
      'currentLocation': instance.currentLocation,
    };

Zone _$ZoneFromJson(Map<String, dynamic> json) => Zone(
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ZoneToJson(Zone instance) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
};

CurrentLocation _$CurrentLocationFromJson(Map<String, dynamic> json) =>
    CurrentLocation(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentLocationToJson(CurrentLocation instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};
