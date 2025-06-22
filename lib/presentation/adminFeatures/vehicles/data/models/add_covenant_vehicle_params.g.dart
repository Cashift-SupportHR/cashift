// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_covenant_vehicle_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCovenantVehicleParams _$AddCovenantVehicleParamsFromJson(
        Map<String, dynamic> json) =>
    AddCovenantVehicleParams(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      description: json['Description'] as String?,
      custodyImagePath: json['CustodyImagePath'] as String?,
      custodyImage: _$JsonConverterFromJson<String, File>(
          json['CustodyImage'], const FileJsonConverter().fromJson),
      vehicleId: (json['VehicleId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddCovenantVehicleParamsToJson(
        AddCovenantVehicleParams instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Description': instance.description,
      if (instance.custodyImagePath case final value?)
        'CustodyImagePath': value,
      'CustodyImage': _$JsonConverterToJson<String, File>(
          instance.custodyImage, const FileJsonConverter().toJson),
      'VehicleId': instance.vehicleId,
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
