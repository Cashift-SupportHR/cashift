// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachments_emp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentsEmpDto _$AttachmentsEmpDtoFromJson(Map<String, dynamic> json) =>
    AttachmentsEmpDto(
      id: (json['id'] as num?)?.toInt(),
      allowEdit: json['allowEdit'] as bool?,
      rejectReason: json['rejectReason'] as String?,
      requirementName: json['requirementName'] as String?,
      attachmentExtensionType: json['attachmentExtensionType'] as String?,
      requirementAttachmentPath: json['requirementAttachmentPath'] as String?,
      isAdded: json['isAdded'] as bool?,
    );

Map<String, dynamic> _$AttachmentsEmpDtoToJson(AttachmentsEmpDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requirementName': instance.requirementName,
      'requirementAttachmentPath': instance.requirementAttachmentPath,
      'attachmentExtensionType': instance.attachmentExtensionType,
      'rejectReason': instance.rejectReason,
      'isAdded': instance.isAdded,
      'allowEdit': instance.allowEdit,
    };
