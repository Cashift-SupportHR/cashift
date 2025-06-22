// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_focus_point_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddFocusPointParams _$AddFocusPointParamsFromJson(Map<String, dynamic> json) =>
    AddFocusPointParams(
      id: (json['id'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      focusPointsTypeId: (json['focusPointsTypeId'] as num?)?.toInt(),
      focusPointsPriorityId: (json['focusPointsPriorityId'] as num?)?.toInt(),
      focusPointName: json['focusPointName'] as String?,
      freeLanceType: (json['freeLanceType'] as num?)?.toInt(),
      focusPointId: json['focusPointId'] as String?,
      latitude: json['latitude'] as String?,
      longtude: json['longtude'] as String?,
      radius: json['radius'] as String?,
      focusPointsAreaId: (json['focusPointsAreaId'] as num?)?.toInt(),
      focusPointsTransactionId:
          (json['focusPointsTransactionId'] as num?)?.toInt(),
      listShift: (json['listShift'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      coverageBreak: (json['coverageBreak'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddFocusPointParamsToJson(
        AddFocusPointParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'focusPointsTypeId': instance.focusPointsTypeId,
      'focusPointsPriorityId': instance.focusPointsPriorityId,
      'focusPointName': instance.focusPointName,
      'freeLanceType': instance.freeLanceType,
      'focusPointId': instance.focusPointId,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'radius': instance.radius,
      'focusPointsAreaId': instance.focusPointsAreaId,
      'coverageBreak': instance.coverageBreak,
      'focusPointsTransactionId': instance.focusPointsTransactionId,
      'listShift': instance.listShift,
    };
