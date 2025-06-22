// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_round_trip_details_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRoundTripDetailsParams _$AddRoundTripDetailsParamsFromJson(
        Map<String, dynamic> json) =>
    AddRoundTripDetailsParams(
      vehicleZoneId: (json['vehicleZoneId'] as num?)?.toInt(),
      roundTypeId: (json['roundTypeId'] as num?)?.toInt(),
      roundTripId: (json['roundTripId'] as num?)?.toInt(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AddRoundTripDetailsParamsToJson(
        AddRoundTripDetailsParams instance) =>
    <String, dynamic>{
      'vehicleZoneId': instance.vehicleZoneId,
      'roundTypeId': instance.roundTypeId,
      'roundTripId': instance.roundTripId,
      'notes': instance.notes,
    };
