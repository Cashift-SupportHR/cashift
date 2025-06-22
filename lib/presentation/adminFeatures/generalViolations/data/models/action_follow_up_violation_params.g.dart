// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_follow_up_violation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionFollowUpViolationParams _$ActionFollowUpViolationParamsFromJson(
        Map<String, dynamic> json) =>
    ActionFollowUpViolationParams(
      contractViolationId: (json['contractViolationId'] as num?)?.toInt(),
      importantLevel: (json['importantLevel'] as num?)?.toInt(),
      actionDescription: json['actionDescription'] as String?,
    );

Map<String, dynamic> _$ActionFollowUpViolationParamsToJson(
        ActionFollowUpViolationParams instance) =>
    <String, dynamic>{
      'contractViolationId': instance.contractViolationId,
      'importantLevel': instance.importantLevel,
      'actionDescription': instance.actionDescription,
    };
