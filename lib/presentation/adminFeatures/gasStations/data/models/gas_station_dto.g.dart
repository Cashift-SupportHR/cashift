// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas_station_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GasStationDto _$GasStationDtoFromJson(Map<String, dynamic> json) =>
    GasStationDto(
      id: (json['id'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      projectName: json['projectName'] as String?,
      stationNameEn: json['stationNameEn'] as String?,
      stationNameAr: json['stationNameAr'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longtude: (json['longtude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GasStationDtoToJson(GasStationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'projectName': instance.projectName,
      'stationNameEn': instance.stationNameEn,
      'stationNameAr': instance.stationNameAr,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
    };
