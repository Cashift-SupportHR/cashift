// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requirement_attachment_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequirementAttachmentPrams _$RequirementAttachmentPramsFromJson(
        Map<String, dynamic> json) =>
    RequirementAttachmentPrams(
      freelancerId: (json['FreelancerId'] as num?)?.toInt(),
      requirementAttachmentId:
          (json['RequirementAttachmentId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$RequirementAttachmentPramsToJson(
        RequirementAttachmentPrams instance) =>
    <String, dynamic>{
      'FreelancerId': instance.freelancerId,
      'RequirementAttachmentId': instance.requirementAttachmentId,
    };
