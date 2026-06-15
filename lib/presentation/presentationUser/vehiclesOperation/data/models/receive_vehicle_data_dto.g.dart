// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_vehicle_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveVehicleDataDto _$ReceiveVehicleDataDtoFromJson(
  Map<String, dynamic> json,
) => ReceiveVehicleDataDto(
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
  shiftId: (json['shiftId'] as num?)?.toInt(),
  shiftName: json['shiftName'] as String?,
  startShiftDateTime: json['startShiftDateTime'] as String?,
  endShiftDateTime: json['endShiftDateTime'] as String?,
  licenseExpiryDate: json['licenseExpiryDate'] as String?,
  yearOfManufacture: (json['yearOfManufacture'] as num?)?.toInt(),
  licenseNumber: json['licenseNumber'] as String?,
  specifications: json['specifications'] as String?,
);

Map<String, dynamic> _$ReceiveVehicleDataDtoToJson(
  ReceiveVehicleDataDto instance,
) => <String, dynamic>{
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
  'companyName': instance.companyName,
  'projectId': instance.projectId,
  'projectName': instance.projectName,
  'shiftId': instance.shiftId,
  'shiftName': instance.shiftName,
  'startShiftDateTime': instance.startShiftDateTime,
  'endShiftDateTime': instance.endShiftDateTime,
  'licenseExpiryDate': instance.licenseExpiryDate,
  'yearOfManufacture': instance.yearOfManufacture,
  'licenseNumber': instance.licenseNumber,
  'specifications': instance.specifications,
};
