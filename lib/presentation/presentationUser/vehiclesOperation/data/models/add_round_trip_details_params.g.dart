// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_round_trip_details_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRoundTripDetailsParams _$AddRoundTripDetailsParamsFromJson(
        Map<String, dynamic> json) =>
    AddRoundTripDetailsParams(
      vehicleZoneId: json['vehicleZoneId'] as int?,
      roundTypeId: json['roundTypeId'] as int?,
      roundTripId: json['roundTripId'] as int?,
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
