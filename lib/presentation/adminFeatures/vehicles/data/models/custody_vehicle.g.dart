// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custody_vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustodyVehicle _$CustodyVehicleFromJson(Map<String, dynamic> json) =>
    CustodyVehicle(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$CustodyVehicleToJson(CustodyVehicle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
    };
