// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_component_handover_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleComponentHandoverDto _$VehicleComponentHandoverDtoFromJson(
        Map<String, dynamic> json) =>
    VehicleComponentHandoverDto(
      id: (json['id'] as num?)?.toInt(),
      vehicleComponentId: (json['vehicleComponentId'] as num?)?.toInt(),
      vehicleComponentName: json['vehicleComponentName'] as String?,
      vehicleHandoverId: (json['vehicleHandoverId'] as num?)?.toInt(),
      componentStatus: json['componentStatus'] as bool?,
      componentStatusName: json['componentStatusName'] as String?,
      image: json['image'] as String?,
      issueDescription: json['issueDescription'] as String?,
      attachmentPath: json['attachmentPath'] as String?,
    );

Map<String, dynamic> _$VehicleComponentHandoverDtoToJson(
        VehicleComponentHandoverDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleComponentId': instance.vehicleComponentId,
      'vehicleComponentName': instance.vehicleComponentName,
      'vehicleHandoverId': instance.vehicleHandoverId,
      'componentStatus': instance.componentStatus,
      'componentStatusName': instance.componentStatusName,
      'image': instance.image,
      'issueDescription': instance.issueDescription,
      'attachmentPath': instance.attachmentPath,
    };
