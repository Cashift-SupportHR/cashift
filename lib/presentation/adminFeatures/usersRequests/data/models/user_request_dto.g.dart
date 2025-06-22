// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestDto _$UserRequestDtoFromJson(Map<String, dynamic> json) =>
    UserRequestDto(
      id: (json['id'] as num?)?.toInt(),
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
      companyId: (json['companyId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      shiftId: (json['shiftId'] as num?)?.toInt(),
      shiftName: json['shiftName'] as String?,
      cashiftName: json['cashiftName'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$UserRequestDtoToJson(UserRequestDto instance) =>
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
      'companyId': instance.companyId,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'shiftId': instance.shiftId,
      'shiftName': instance.shiftName,
      'cashiftName': instance.cashiftName,
      'imagePath': instance.imagePath,
    };
