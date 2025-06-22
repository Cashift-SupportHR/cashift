// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_order_status_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveOrderStatusParams _$SaveOrderStatusParamsFromJson(
        Map<String, dynamic> json) =>
    SaveOrderStatusParams(
      id: (json['id'] as num?)?.toInt(),
      isAccept: (json['isAccept'] as num?)?.toInt(),
      description: json['description'] as String?,
      descriptionConnect: json['descriptionConnect'] as String?,
      freeLanceId: (json['freeLanceId'] as num?)?.toInt(),
      isAllow: json['isAllow'] as bool?,
      listProject: (json['listProject'] as List<dynamic>?)
          ?.map((e) => ListProject.fromJson(e as Map<String, dynamic>))
          .toList(),
      listShift: (json['listShift'] as List<dynamic>?)
          ?.map((e) => ListShift.fromJson(e as Map<String, dynamic>))
          .toList(),
      isAcceptedForAllProject:
          (json['isAcceptedForAllProject'] as num?)?.toInt(),
      isAcceptedForAllShift: (json['isAcceptedForAllShift'] as num?)?.toInt(),
      successAprovedLevel: (json['successAprovedLevel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SaveOrderStatusParamsToJson(
        SaveOrderStatusParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isAccept': instance.isAccept,
      'description': instance.description,
      'descriptionConnect': instance.descriptionConnect,
      'freeLanceId': instance.freeLanceId,
      'isAllow': instance.isAllow,
      'listProject': instance.listProject,
      'listShift': instance.listShift,
      'isAcceptedForAllProject': instance.isAcceptedForAllProject,
      'isAcceptedForAllShift': instance.isAcceptedForAllShift,
      'successAprovedLevel': instance.successAprovedLevel,
    };

ListProject _$ListProjectFromJson(Map<String, dynamic> json) => ListProject(
      projectId: (json['projectId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ListProjectToJson(ListProject instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
    };

ListShift _$ListShiftFromJson(Map<String, dynamic> json) => ListShift(
      shiftHeadId: (json['shiftHeadId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ListShiftToJson(ListShift instance) => <String, dynamic>{
      'shiftHeadId': instance.shiftHeadId,
    };
