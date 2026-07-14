// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_vehicle_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveVehiclePrams _$ReceiveVehiclePramsFromJson(Map<String, dynamic> json) =>
    ReceiveVehiclePrams(
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      shiftId: (json['shiftId'] as num?)?.toInt(),
      isComplete: json['isComplete'] as bool?,
    );

Map<String, dynamic> _$ReceiveVehiclePramsToJson(
  ReceiveVehiclePrams instance,
) => <String, dynamic>{
  'page': instance.page,
  'pageSize': instance.pageSize,
  'projectId': instance.projectId,
  'companyId': instance.companyId,
  if (instance.startDate case final value?) 'startDate': value,
  if (instance.endDate case final value?) 'endDate': value,
  'shiftId': instance.shiftId,
  'isComplete': instance.isComplete,
};
