// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_vehicle_receive_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionVehicleReceiveRequestParams _$ActionVehicleReceiveRequestParamsFromJson(
        Map<String, dynamic> json) =>
    ActionVehicleReceiveRequestParams(
      vehicleHandoverId: (json['vehicleHandoverId'] as num?)?.toInt(),
      scheduleEmployeeId: (json['scheduleEmployeeId'] as num?)?.toInt(),
      handoverId: (json['handoverId'] as num?)?.toInt(),
      issueDescriptionStatus: (json['issueDescriptionStatus'] as num?)?.toInt(),
      action: json['action'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ActionVehicleReceiveRequestParamsToJson(
        ActionVehicleReceiveRequestParams instance) =>
    <String, dynamic>{
      'vehicleHandoverId': instance.vehicleHandoverId,
      'scheduleEmployeeId': instance.scheduleEmployeeId,
      'handoverId': instance.handoverId,
      'issueDescriptionStatus': instance.issueDescriptionStatus,
      'action': instance.action,
      'type': instance.type,
    };
