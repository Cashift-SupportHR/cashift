// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_vehicle_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveVehicleDto _$ReceiveVehicleDtoFromJson(Map<String, dynamic> json) =>
    ReceiveVehicleDto(
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      totalData: (json['totalData'] as num?)?.toInt(),
      receiveVehicleDataDto:
          (json['vehicleComponentCustoHandOverViewModels'] as List<dynamic>?)
              ?.map(
                (e) =>
                    ReceiveVehicleDataDto.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$ReceiveVehicleDtoToJson(ReceiveVehicleDto instance) =>
    <String, dynamic>{
      'totalData': instance.totalData,
      'pageSize': instance.pageSize,
      'pageNumber': instance.pageNumber,
      'vehicleComponentCustoHandOverViewModels': instance.receiveVehicleDataDto,
    };
