// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_up_violation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowUpViolationDto _$FollowUpViolationDtoFromJson(
        Map<String, dynamic> json) =>
    FollowUpViolationDto(
      violationId: (json['violationId'] as num?)?.toInt(),
      violationType: json['violationType'] as String?,
      companyName: json['companyName'] as String?,
      dateOfViolationApplying: json['dateOfViolationApplying'] as String?,
      time: json['time'] as String?,
      streetName: json['streetName'] as String?,
      details: json['details'] as String?,
      imagesPath: (json['imagesPath'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      adminAction: json['adminAction'] as String?,
      shiftAdminAction: json['shiftAdminAction'] as String?,
      importantLevel: json['importantLevel'] as String?,
      allowEdit: json['allowEdit'] as bool?,
    );

Map<String, dynamic> _$FollowUpViolationDtoToJson(
        FollowUpViolationDto instance) =>
    <String, dynamic>{
      'violationId': instance.violationId,
      'violationType': instance.violationType,
      'companyName': instance.companyName,
      'dateOfViolationApplying': instance.dateOfViolationApplying,
      'time': instance.time,
      'streetName': instance.streetName,
      'details': instance.details,
      'imagesPath': instance.imagesPath,
      'adminAction': instance.adminAction,
      'shiftAdminAction': instance.shiftAdminAction,
      'importantLevel': instance.importantLevel,
      'allowEdit': instance.allowEdit,
    };
