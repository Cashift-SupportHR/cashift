// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehiclesDto _$VehiclesDtoFromJson(Map<String, dynamic> json) => VehiclesDto(
      id: (json['id'] as num?)?.toInt(),
      vehicleCode: json['vehicleCode'] as String?,
      model: json['model'] as String?,
      yearOfManufacture: (json['yearOfManufacture'] as num?)?.toInt(),
      color: json['vehicleColorName'] as String?,
      plateNumber: json['plateNumber'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      licenseExpiryDate: json['licenseExpiryDate'] as String?,
      specifications: json['specifications'] as String?,
      vehicleImage: json['vehicleImage'] as String?,
      vehicleBrandName: json['vehicleBrandName'] as String?,
      vehicleBrandId: (json['vehicleBrandId'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VehiclesDtoToJson(VehiclesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleCode': instance.vehicleCode,
      'model': instance.model,
      'yearOfManufacture': instance.yearOfManufacture,
      'vehicleColorName': instance.color,
      'plateNumber': instance.plateNumber,
      'licenseNumber': instance.licenseNumber,
      'licenseExpiryDate': instance.licenseExpiryDate,
      'specifications': instance.specifications,
      'vehicleImage': instance.vehicleImage,
      'vehicleBrandName': instance.vehicleBrandName,
      'vehicleBrandId': instance.vehicleBrandId,
      'companyName': instance.companyName,
      'companyId': instance.companyId,
      'projectName': instance.projectName,
      'projectId': instance.projectId,
    };
