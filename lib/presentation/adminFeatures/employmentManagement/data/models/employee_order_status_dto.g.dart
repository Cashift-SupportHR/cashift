// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_order_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeOrderStatusDto _$EmployeeOrderStatusDtoFromJson(
        Map<String, dynamic> json) =>
    EmployeeOrderStatusDto(
      id: (json['id'] as num?)?.toInt(),
      isAccept: (json['isAccept'] as num?)?.toInt(),
      description: json['description'] as String?,
      descriptionConnect: json['descriptionConnect'] as String?,
      isAllow: json['isAllow'] as bool?,
      listProject: (json['listProject'] as List<dynamic>?)
          ?.map((e) => CommonListItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      listShift: (json['listShift'] as List<dynamic>?)
          ?.map((e) => WorkingPeriodDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isAcceptedForAllProject:
          (json['isAcceptedForAllProject'] as num?)?.toInt(),
      isAcceptedForAllShift: (json['isAcceptedForAllShift'] as num?)?.toInt(),
      successAprovedLevel: (json['isShowDescription'] as num?)?.toInt(),
      isShowDescription: (json['successAprovedLevel'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmployeeOrderStatusDtoToJson(
        EmployeeOrderStatusDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isAccept': instance.isAccept,
      'description': instance.description,
      'descriptionConnect': instance.descriptionConnect,
      'isAllow': instance.isAllow,
      'listProject': instance.listProject,
      'listShift': instance.listShift,
      'isAcceptedForAllProject': instance.isAcceptedForAllProject,
      'isAcceptedForAllShift': instance.isAcceptedForAllShift,
      'successAprovedLevel': instance.isShowDescription,
      'isShowDescription': instance.successAprovedLevel,
    };
