// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_or_reject_attachment_emp_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceptOrRejectAttachmentEmpPrams _$AcceptOrRejectAttachmentEmpPramsFromJson(
        Map<String, dynamic> json) =>
    AcceptOrRejectAttachmentEmpPrams(
      rejectReason: json['rejectReason'] as String?,
      freelancerId: (json['freelancerId'] as num?)?.toInt(),
      attachmentId: (json['attachmentId'] as num?)?.toInt(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AcceptOrRejectAttachmentEmpPramsToJson(
        AcceptOrRejectAttachmentEmpPrams instance) =>
    <String, dynamic>{
      'rejectReason': instance.rejectReason,
      'freelancerId': instance.freelancerId,
      'attachmentId': instance.attachmentId,
      'statusCode': instance.statusCode,
    };
