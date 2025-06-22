// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_round_trip_fill_station_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRoundTripFillStationPrams _$AddRoundTripFillStationPramsFromJson(
        Map<String, dynamic> json) =>
    AddRoundTripFillStationPrams(
      id: (json['id'] as num?)?.toInt(),
      vehicleZoneId: (json['vehicleZoneId'] as num?)?.toInt(),
      roundTripId: (json['roundTripId'] as num?)?.toInt(),
      stationId: (json['stationId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddRoundTripFillStationPramsToJson(
        AddRoundTripFillStationPrams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleZoneId': instance.vehicleZoneId,
      'roundTripId': instance.roundTripId,
      'stationId': instance.stationId,
    };
