// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_follow_up_up_maintenance_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionFollowUpUpMaintenancePrams _$ActionFollowUpUpMaintenancePramsFromJson(
  Map<String, dynamic> json,
) => ActionFollowUpUpMaintenancePrams(
  faultsMaintenanceId: (json['faultsMaintenanceId'] as num?)?.toInt(),
  importantLevel: (json['importantLevel'] as num?)?.toInt(),
  actionDescription: json['actionDescription'] as String?,
);

Map<String, dynamic> _$ActionFollowUpUpMaintenancePramsToJson(
  ActionFollowUpUpMaintenancePrams instance,
) => <String, dynamic>{
  'faultsMaintenanceId': instance.faultsMaintenanceId,
  'importantLevel': instance.importantLevel,
  'actionDescription': instance.actionDescription,
};
