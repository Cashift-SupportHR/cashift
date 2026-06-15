// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_received_images_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleReceivedImagesParams _$VehicleReceivedImagesParamsFromJson(
  Map<String, dynamic> json,
) => VehicleReceivedImagesParams(
  images: const ListMultipartFileJsonConverter().fromJson(
    json['images'] as List,
  ),
  vehicleId: (json['VehicleId'] as num?)?.toInt(),
  vehicleHandoverId: (json['VehicleHandoverId'] as num?)?.toInt(),
);

Map<String, dynamic> _$VehicleReceivedImagesParamsToJson(
  VehicleReceivedImagesParams instance,
) => <String, dynamic>{
  'VehicleId': instance.vehicleId,
  'VehicleHandoverId': instance.vehicleHandoverId,
};
