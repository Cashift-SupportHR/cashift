// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_maintenance_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMaintenancePrams _$AddMaintenancePramsFromJson(Map<String, dynamic> json) =>
    AddMaintenancePrams(
      id: (json['Id'] as num?)?.toInt(),
      roundTripId: (json['RoundTripId'] as num?)?.toInt(),
      description: json['Description'] as String?,
      faultMaintainceTypeId: (json['FaultMaintainceTypeId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddMaintenancePramsToJson(
  AddMaintenancePrams instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'Id': value,
  if (instance.roundTripId case final value?) 'RoundTripId': value,
  'Description': instance.description,
  'FaultMaintainceTypeId': instance.faultMaintainceTypeId,
};
