// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_round_trip_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRoundTripParams _$AddRoundTripParamsFromJson(Map<String, dynamic> json) =>
    AddRoundTripParams(
      id: (json['id'] as num?)?.toInt(),
      vehiclesZoneId: (json['vehiclesZoneId'] as num?)?.toInt(),
      roundTypeId: (json['roundTyepId'] as num?)?.toInt(),
      vehicleHandoverId: (json['vehicleHandoverId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddRoundTripParamsToJson(AddRoundTripParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehiclesZoneId': instance.vehiclesZoneId,
      'roundTyepId': instance.roundTypeId,
      'vehicleHandoverId': instance.vehicleHandoverId,
    };
