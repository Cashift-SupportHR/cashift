// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_event_picture_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleEventPicturePrams _$VehicleEventPicturePramsFromJson(
  Map<String, dynamic> json,
) => VehicleEventPicturePrams(
  eventIndexCode: json['eventIndexCode'] as String?,
  mobileVehicleIndexCode: (json['mobileVehicleIndexCode'] as num?)?.toInt(),
);

Map<String, dynamic> _$VehicleEventPicturePramsToJson(
  VehicleEventPicturePrams instance,
) => <String, dynamic>{
  'eventIndexCode': instance.eventIndexCode,
  'mobileVehicleIndexCode': instance.mobileVehicleIndexCode,
};
