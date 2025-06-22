// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_receive_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleReceiveRequestDto _$VehicleReceiveRequestDtoFromJson(
        Map<String, dynamic> json) =>
    VehicleReceiveRequestDto(
      vehicleComponentHandoverId:
          (json['vehicleComponentHandoverId'] as num?)?.toInt(),
      vehicleCompnentId: (json['vehicleCompnentId'] as num?)?.toInt(),
      vehicleName: json['vehicleName'] as String?,
      vehicleHandoverDate: json['vehicleHandoverDate'] as String?,
      vehicleModel: json['vehicleModel'] as String?,
      freelancerName: json['freelancerName'] as String?,
      freeLancerId: (json['freeLancerId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      vehicleHandoverTime: json['vehicleHandoverTime'] as String?,
      vehiclePlateNumber: json['vehiclePlateNumber'] as String?,
      vehicleHandoverId: (json['vehicleHandoverId'] as num?)?.toInt(),
      status: (json['status'] as num?)?.toInt(),
      statusName: json['statusName'] as String?,
      issueDescription: json['issueDescription'] as String?,
      attachmentPath: json['attachmentPath'] as String?,
      type: json['type'] as String?,
      actionTaken: json['actionTaken'] as String?,
      codeType: json['codeType'] as String?,
      shiftName: json['shiftName'] as String?,
      allowForEdit: json['allowForEdit'] as bool?,
    );

Map<String, dynamic> _$VehicleReceiveRequestDtoToJson(
        VehicleReceiveRequestDto instance) =>
    <String, dynamic>{
      'vehicleComponentHandoverId': instance.vehicleComponentHandoverId,
      'vehicleCompnentId': instance.vehicleCompnentId,
      'vehicleName': instance.vehicleName,
      'vehicleHandoverDate': instance.vehicleHandoverDate,
      'vehicleModel': instance.vehicleModel,
      'freelancerName': instance.freelancerName,
      'freeLancerId': instance.freeLancerId,
      'projectId': instance.projectId,
      'companyId': instance.companyId,
      'vehicleHandoverTime': instance.vehicleHandoverTime,
      'vehiclePlateNumber': instance.vehiclePlateNumber,
      'vehicleHandoverId': instance.vehicleHandoverId,
      'status': instance.status,
      'statusName': instance.statusName,
      'issueDescription': instance.issueDescription,
      'attachmentPath': instance.attachmentPath,
      'type': instance.type,
      'actionTaken': instance.actionTaken,
      'codeType': instance.codeType,
      'shiftName': instance.shiftName,
      'allowForEdit': instance.allowForEdit,
    };
