// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_violation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractViolationDto _$ContractViolationDtoFromJson(
        Map<String, dynamic> json) =>
    ContractViolationDto(
      project: json['project'] as String?,
      company: json['company'] as String?,
      shift: json['shift'] as String?,
      contractViolationType: json['contractViolationType'] as String?,
      freeLanceName: json['freeLanceName'] as String?,
      freeLancePhone: json['freeLancePhone'] as String?,
      contractViolationAttachments: (json['contractViolationAttachments']
              as List<dynamic>?)
          ?.map((e) =>
              ContractViolationAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      details: json['details'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      projectId: (json['projectId'] as num?)?.toInt(),
      companyId: (json['companyId'] as num?)?.toInt(),
      shiftId: (json['shiftId'] as num?)?.toInt(),
      contractViolationTypeId:
          (json['contractViolationTypeId'] as num?)?.toInt(),
      scheduleEmployeeWorkId: (json['scheduleEmployeeWorkId'] as num?)?.toInt(),
      freeLanceId: (json['freeLanceId'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      streetName: json['streetName'] as String?,
    );

Map<String, dynamic> _$ContractViolationDtoToJson(
        ContractViolationDto instance) =>
    <String, dynamic>{
      'project': instance.project,
      'company': instance.company,
      'shift': instance.shift,
      'contractViolationType': instance.contractViolationType,
      'freeLanceName': instance.freeLanceName,
      'freeLancePhone': instance.freeLancePhone,
      'contractViolationAttachments': instance.contractViolationAttachments,
      'id': instance.id,
      'details': instance.details,
      'lat': instance.lat,
      'lng': instance.lng,
      'projectId': instance.projectId,
      'companyId': instance.companyId,
      'shiftId': instance.shiftId,
      'contractViolationTypeId': instance.contractViolationTypeId,
      'scheduleEmployeeWorkId': instance.scheduleEmployeeWorkId,
      'freeLanceId': instance.freeLanceId,
      'companyName': instance.companyName,
      'streetName': instance.streetName,
    };

ContractViolationAttachment _$ContractViolationAttachmentFromJson(
        Map<String, dynamic> json) =>
    ContractViolationAttachment(
      path: json['path'] as String?,
    );

Map<String, dynamic> _$ContractViolationAttachmentToJson(
        ContractViolationAttachment instance) =>
    <String, dynamic>{
      'path': instance.path,
    };
