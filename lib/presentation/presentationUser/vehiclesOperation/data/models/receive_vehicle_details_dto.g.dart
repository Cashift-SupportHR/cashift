// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_vehicle_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveVehicleDetailsDto _$ReceiveVehicleDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    ReceiveVehicleDetailsDto(
      roundTripId: (json['roundTripId'] as num?)?.toInt(),
      vehicleTrueComponentsCount:
          (json['vehicleTrueComponentsCount'] as num?)?.toInt(),
      vehicleTrueCustodiesCount:
          (json['vehicleTrueCustodiesCount'] as num?)?.toInt(),
      vehicleHandoverImages: (json['vehicleHandoverImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      vehiclesComponentsHandovers: (json['vehiclesComponentsHandovers']
              as List<dynamic>?)
          ?.map((e) =>
              VehicleComponentHandoverDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehiclesCustodiesHandovers: (json['vehiclesCustodiesHandovers']
              as List<dynamic>?)
          ?.map((e) => CustodyHandoverDto.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      companyId: (json['companyId'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      licenseExpiryDate: json['licenseExpiryDate'] as String?,
      licenseNumber: json['licenseNumber'] as String?,
      specifications: json['specifications'] as String?,
    );

Map<String, dynamic> _$ReceiveVehicleDetailsDtoToJson(
        ReceiveVehicleDetailsDto instance) =>
    <String, dynamic>{
      'vehicleHandoverImages': instance.vehicleHandoverImages,
      'vehiclesComponentsHandovers': instance.vehiclesComponentsHandovers,
      'vehiclesCustodiesHandovers': instance.vehiclesCustodiesHandovers,
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
      'companyId': instance.companyId,
      'vehicleTrueComponentsCount': instance.vehicleTrueComponentsCount,
      'vehicleTrueCustodiesCount': instance.vehicleTrueCustodiesCount,
      'companyName': instance.companyName,
      'projectId': instance.projectId,
      'roundTripId': instance.roundTripId,
      'projectName': instance.projectName,
      'licenseExpiryDate': instance.licenseExpiryDate,
      'licenseNumber': instance.licenseNumber,
      'specifications': instance.specifications,
    };
