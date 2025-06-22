// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas_station_trip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GasStationTripDto _$GasStationTripDtoFromJson(Map<String, dynamic> json) =>
    GasStationTripDto(
      fillingStationId: (json['fillingStationId'] as num?)?.toInt(),
      fillingStationNameAr: json['fillingStationNameAr'] as String?,
      fillingStationNameEn: json['fillingStationNameEn'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longtude: (json['longtude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GasStationTripDtoToJson(GasStationTripDto instance) =>
    <String, dynamic>{
      'fillingStationId': instance.fillingStationId,
      'fillingStationNameAr': instance.fillingStationNameAr,
      'fillingStationNameEn': instance.fillingStationNameEn,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
    };
