// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_round_trip_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentRoundTripDto _$CurrentRoundTripDtoFromJson(Map<String, dynamic> json) =>
    CurrentRoundTripDto(
      id: (json['id'] as num?)?.toInt(),
      stationLongtude: (json['stationLongtude'] as num?)?.toDouble(),
      stationLatitue: (json['stationLatitue'] as num?)?.toDouble(),
      pubupMessage: json['pubupMessage'] as String?,
      isRequiredPubup: json['isRequiredPubup'] as bool?,
      roundTypeCode: json['roundTypeCode'] as String?,
      vehiclesZoneId: (json['vehiclesZoneId'] as num?)?.toInt(),
      vehiclesZoneName: json['vehiclesZoneName'] as String?,
      numberOfViolations: (json['numberOfViolations'] as num?)?.toInt(),
      roundTypeId: (json['roundTypeId'] as num?)?.toInt(),
      roundTypeName: json['roundTypeName'] as String?,
      isAllowToTrackTime: json['isAllowToTrackTime'] as bool?,
      startRound: json['startRound'] as String?,
      latlngs: (json['latlngs'] as List<dynamic>?)
          ?.map((e) => VehicleZoneLatLng.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurrentRoundTripDtoToJson(
        CurrentRoundTripDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehiclesZoneId': instance.vehiclesZoneId,
      'vehiclesZoneName': instance.vehiclesZoneName,
      'numberOfViolations': instance.numberOfViolations,
      'roundTypeId': instance.roundTypeId,
      'roundTypeName': instance.roundTypeName,
      'isAllowToTrackTime': instance.isAllowToTrackTime,
      'startRound': instance.startRound,
      'latlngs': instance.latlngs,
      'roundTypeCode': instance.roundTypeCode,
      'isRequiredPubup': instance.isRequiredPubup,
      'pubupMessage': instance.pubupMessage,
      'stationLatitue': instance.stationLatitue,
      'stationLongtude': instance.stationLongtude,
    };
