// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_image_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleImageParams _$VehicleImageParamsFromJson(Map<String, dynamic> json) =>
    VehicleImageParams(
      images: const ListMultipartFileJsonConverter()
          .fromJson(json['Images'] as List),
      vehicleId: (json['VehicleId'] as num).toInt(),
    );

Map<String, dynamic> _$VehicleImageParamsToJson(VehicleImageParams instance) =>
    <String, dynamic>{
      'Images': const ListMultipartFileJsonConverter().toJson(instance.images),
      'VehicleId': instance.vehicleId,
    };
