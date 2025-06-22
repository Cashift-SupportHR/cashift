// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestsUserDto _$RequestsUserDtoFromJson(Map<String, dynamic> json) =>
    RequestsUserDto(
      id: (json['id'] as num?)?.toInt(),
      cashifterName: json['cashifterName'] as String?,
      projectName: json['projectName'] as String?,
      shiftName: json['shiftName'] as String?,
      cashifterRequestTypeId: (json['cashifterRequestTypeId'] as num?)?.toInt(),
      cashifterRequestTypeName: json['cashifterRequestTypeName'] as String?,
      oldPhoneNumber: json['oldPhoneNumber'] as String?,
      newPhoneNumber: json['newPhoneNumber'] as String?,
      attachmentDocument: json['attachmentDocument'] as String?,
      attachmentDocumentType: json['attachmentDocumentType'] as String?,
      description: json['description'] as String?,
      rejectReason: json['rejectReason'] as String?,
      cashifterRequestStatusId:
          (json['cashifterRequestStatusId'] as num?)?.toInt(),
      cashifterRequestStatusName: json['cashifterRequestStatusName'] as String?,
      shiftAdminUserId: json['shiftAdminUserId'] as String?,
      hrAdminUserId: json['hrAdminUserId'] as String?,
    );

Map<String, dynamic> _$RequestsUserDtoToJson(RequestsUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cashifterRequestTypeId': instance.cashifterRequestTypeId,
      'cashifterRequestTypeName': instance.cashifterRequestTypeName,
      'oldPhoneNumber': instance.oldPhoneNumber,
      'newPhoneNumber': instance.newPhoneNumber,
      'attachmentDocument': instance.attachmentDocument,
      'attachmentDocumentType': instance.attachmentDocumentType,
      'description': instance.description,
      'rejectReason': instance.rejectReason,
      'cashifterRequestStatusId': instance.cashifterRequestStatusId,
      'cashifterRequestStatusName': instance.cashifterRequestStatusName,
      'shiftAdminUserId': instance.shiftAdminUserId,
      'hrAdminUserId': instance.hrAdminUserId,
      'shiftName': instance.shiftName,
      'projectName': instance.projectName,
      'cashifterName': instance.cashifterName,
    };
