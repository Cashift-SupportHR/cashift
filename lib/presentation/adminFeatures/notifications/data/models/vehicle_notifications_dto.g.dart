// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_notifications_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleNotificationsDto _$VehicleNotificationsDtoFromJson(
  Map<String, dynamic> json,
) => VehicleNotificationsDto(
  id: (json['id'] as num?)?.toInt(),
  notifyType: json['notifyType'] as String?,
  description: json['description'] as String?,
  employee: json['employee'] as String?,
  vehiclePlateNumber: json['vehiclePlateNumber'] as String?,
  notifyDate: json['notifyDate'] as String?,
  notifyTime: json['notifyTime'] as String?,
  action: json['action'] as String?,
  finalAction: json['finalAction'] as String?,
);

Map<String, dynamic> _$VehicleNotificationsDtoToJson(
  VehicleNotificationsDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'notifyType': instance.notifyType,
  'description': instance.description,
  'employee': instance.employee,
  'vehiclePlateNumber': instance.vehiclePlateNumber,
  'notifyDate': instance.notifyDate,
  'notifyTime': instance.notifyTime,
  'action': instance.action,
  'finalAction': instance.finalAction,
};
