// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_reject_violation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApproveRejectViolationParams _$ApproveRejectViolationParamsFromJson(
        Map<String, dynamic> json) =>
    ApproveRejectViolationParams(
      id: (json['id'] as num?)?.toInt(),
      typeViolation: (json['typeViolation'] as num?)?.toInt(),
      description: json['description'] as String?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ApproveRejectViolationParamsToJson(
        ApproveRejectViolationParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typeViolation': instance.typeViolation,
      'description': instance.description,
      'status': instance.status,
    };
