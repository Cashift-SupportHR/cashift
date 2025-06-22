// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_vehicle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveVehicleDto _$ReceiveVehicleDtoFromJson(Map<String, dynamic> json) =>
    ReceiveVehicleDto(
      id: (json['id'] as num?)?.toInt(),
      vehicleId: (json['vehicleId'] as num?)?.toInt(),
      vehicleBrand: json['vehicleBrand'] as String?,
      vehicleModel: json['vehicleModel'] as String?,
      vehiclePlateNumber: json['vehiclePlateNumber'] as String?,
      vehicleHandoverDate: json['vehicleHandoverDate'] as String?,
      vehicleHandoverTime: json['vehicleHandoverTime'] as String?,
      freelancerInfoId: (json['freelancerInfoId'] as num?)?.toInt(),
      freelancerName: json['freelancerName'] as String?,
      vehicleImage: json['vehicleImage'] as String?,
      isComplete: json['isComplete'] as bool?,
      vehiclesComponentsHandovers: (json['vehiclesComponentsHandovers']
              as List<dynamic>?)
          ?.map((e) =>
              VehicleComponentHandoverDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehiclesCustodiesHandovers: (json['vehiclesCustodiesHandovers']
              as List<dynamic>?)
          ?.map((e) => CustodyHandoverDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReceiveVehicleDtoToJson(ReceiveVehicleDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'vehicleBrand': instance.vehicleBrand,
      'vehicleModel': instance.vehicleModel,
      'vehiclePlateNumber': instance.vehiclePlateNumber,
      'vehicleHandoverDate': instance.vehicleHandoverDate,
      'vehicleHandoverTime': instance.vehicleHandoverTime,
      'freelancerInfoId': instance.freelancerInfoId,
      'freelancerName': instance.freelancerName,
      'vehicleImage': instance.vehicleImage,
      'isComplete': instance.isComplete,
      'vehiclesComponentsHandovers': instance.vehiclesComponentsHandovers,
      'vehiclesCustodiesHandovers': instance.vehiclesCustodiesHandovers,
    };
