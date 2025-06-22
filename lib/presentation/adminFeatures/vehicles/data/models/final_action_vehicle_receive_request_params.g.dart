// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_action_vehicle_receive_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinalActionVehicleReceiveRequestParams
    _$FinalActionVehicleReceiveRequestParamsFromJson(
            Map<String, dynamic> json) =>
        FinalActionVehicleReceiveRequestParams(
          vehicleComponentHandOverId:
              (json['vehicleComponentHandOverId'] as num?)?.toInt(),
          handOverType: json['handOverType'] as String?,
          actionTakenDescription: json['actionTakenDescription'] as String?,
        );

Map<String, dynamic> _$FinalActionVehicleReceiveRequestParamsToJson(
        FinalActionVehicleReceiveRequestParams instance) =>
    <String, dynamic>{
      'vehicleComponentHandOverId': instance.vehicleComponentHandOverId,
      'handOverType': instance.handOverType,
      'actionTakenDescription': instance.actionTakenDescription,
    };
