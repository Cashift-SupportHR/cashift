// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'final_action_follow_up_violation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinalActionFollowUpViolationParams _$FinalActionFollowUpViolationParamsFromJson(
        Map<String, dynamic> json) =>
    FinalActionFollowUpViolationParams(
      contractViolationId: (json['contractViolationId'] as num?)?.toInt(),
      actionDescription: json['actionDescription'] as String?,
    );

Map<String, dynamic> _$FinalActionFollowUpViolationParamsToJson(
        FinalActionFollowUpViolationParams instance) =>
    <String, dynamic>{
      'contractViolationId': instance.contractViolationId,
      'actionDescription': instance.actionDescription,
    };
