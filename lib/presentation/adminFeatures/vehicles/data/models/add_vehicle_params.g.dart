// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vehicle_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddVehicleParams _$AddVehicleParamsFromJson(Map<String, dynamic> json) =>
    AddVehicleParams(
      id: (json['id'] as num?)?.toInt(),
      vehicleCode: (json['VehicleCode'] as num?)?.toInt(),
      model: json['Model'] as String?,
      mobileVehicleIndexCode: json['MobileVehicleIndexCode'] as String?,
      yearOfManufacture: json['YearOfManufacture'] as String?,
      plateNumber: json['PlateNumber'] as String?,
      licenseNumber: json['LicenseNumber'] as String?,
      licenseExpiryDate: json['LicenseExpiryDate'] as String?,
      specifications: json['Specifications'] as String?,
      vehicleImage: json['VehicleImage'] as String?,
      vehicleImageFile: _$JsonConverterFromJson<String, File>(
        json['VehicleImageFile'],
        const FileJsonConverter().fromJson,
      ),
      vehicleBrandId: json['VehicleBrandId'] as String?,
      companyId: json['CompanyId'] as String?,
      projectId: json['ProjectId'] as String?,
      vehicleColorId: (json['VehicleColorId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddVehicleParamsToJson(AddVehicleParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'VehicleCode': instance.vehicleCode,
      'Model': instance.model,
      'MobileVehicleIndexCode': instance.mobileVehicleIndexCode,
      'YearOfManufacture': instance.yearOfManufacture,
      'PlateNumber': instance.plateNumber,
      'LicenseNumber': instance.licenseNumber,
      'LicenseExpiryDate': instance.licenseExpiryDate,
      'Specifications': instance.specifications,
      'VehicleImage': instance.vehicleImage,
      'VehicleImageFile': _$JsonConverterToJson<String, File>(
        instance.vehicleImageFile,
        const FileJsonConverter().toJson,
      ),
      'VehicleBrandId': instance.vehicleBrandId,
      'CompanyId': instance.companyId,
      'ProjectId': instance.projectId,
      'VehicleColorId': instance.vehicleColorId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
