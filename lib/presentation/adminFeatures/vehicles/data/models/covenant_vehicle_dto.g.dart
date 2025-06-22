// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covenant_vehicle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CovenantVehicleDto _$CovenantVehicleDtoFromJson(Map<String, dynamic> json) =>
    CovenantVehicleDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      custodyImage: json['custodyImage'] as String?,
      custodyImagePath: json['custodyImagePath'] as String?,
      vehicleId: (json['vehicleId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CovenantVehicleDtoToJson(CovenantVehicleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'custodyImage': instance.custodyImage,
      'custodyImagePath': instance.custodyImagePath,
      'vehicleId': instance.vehicleId,
    };
