// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve_reject_bail_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApproveRejectBailParams _$ApproveRejectBailParamsFromJson(
        Map<String, dynamic> json) =>
    ApproveRejectBailParams(
      id: (json['id'] as num?)?.toInt(),
      isApprove: json['isApprove'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ApproveRejectBailParamsToJson(
        ApproveRejectBailParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isApprove': instance.isApprove,
      'description': instance.description,
    };
