// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vehicle_camera_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddVehicleCameraParams _$AddVehicleCameraParamsFromJson(
  Map<String, dynamic> json,
) => AddVehicleCameraParams(
  id: (json['id'] as num?)?.toInt(),
  cameraNameEn: json['cameraNameEn'] as String?,
  cameraNameAr: json['cameraNameAr'] as String?,
  cameraIndexCode: json['cameraIndexCode'] as String?,
  vehicleId: (json['vehicleId'] as num?)?.toInt(),
);

Map<String, dynamic> _$AddVehicleCameraParamsToJson(
  AddVehicleCameraParams instance,
) => <String, dynamic>{
  'id': instance.id,
  'cameraNameEn': instance.cameraNameEn,
  'cameraNameAr': instance.cameraNameAr,
  'cameraIndexCode': instance.cameraIndexCode,
  'vehicleId': instance.vehicleId,
};
