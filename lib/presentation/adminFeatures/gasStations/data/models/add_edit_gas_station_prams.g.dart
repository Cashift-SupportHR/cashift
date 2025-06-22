// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit_gas_station_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEditGasStationPrams _$AddEditGasStationPramsFromJson(
        Map<String, dynamic> json) =>
    AddEditGasStationPrams(
      id: (json['id'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      stationNameEn: json['stationNameEn'] as String?,
      stationNameAr: json['stationNameAr'] as String?,
      latitude: json['latitude'] as num?,
      longtude: json['longtude'] as num?,
    );

Map<String, dynamic> _$AddEditGasStationPramsToJson(
        AddEditGasStationPrams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'stationNameEn': instance.stationNameEn,
      'stationNameAr': instance.stationNameAr,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
    };
