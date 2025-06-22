// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_insurance_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddInsurancePrams _$AddInsurancePramsFromJson(Map<String, dynamic> json) =>
    AddInsurancePrams(
      insuranceNumber: json['InsuranceNumber'] as String?,
      id: (json['Id'] as num?)?.toInt(),
      insuranceProvider: json['InsuranceProvider'] as String?,
      insuranceExpiryDate: json['InsuranceExpiryDate'] as String?,
      vehicleId: (json['VehicleId'] as num?)?.toInt(),
      vehicleInsuranceTypeId: json['VehicleInsuranceTypeId'] as String?,
      insuranceImage: _$JsonConverterFromJson<String, File>(
          json['InsuranceImage'], const FileJsonConverter().fromJson),
    );

Map<String, dynamic> _$AddInsurancePramsToJson(AddInsurancePrams instance) =>
    <String, dynamic>{
      'InsuranceNumber': instance.insuranceNumber,
      'InsuranceProvider': instance.insuranceProvider,
      'InsuranceExpiryDate': instance.insuranceExpiryDate,
      'VehicleId': instance.vehicleId,
      'Id': instance.id,
      'VehicleInsuranceTypeId': instance.vehicleInsuranceTypeId,
      'InsuranceImage': _$JsonConverterToJson<String, File>(
          instance.insuranceImage, const FileJsonConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
