// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_request_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileRequestPrams _$UploadFileRequestPramsFromJson(
        Map<String, dynamic> json) =>
    UploadFileRequestPrams(
      NewPhoneNumber: json['NewPhoneNumber'] as String?,
      CashifterRequestTypeId: (json['CashifterRequestTypeId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UploadFileRequestPramsToJson(
        UploadFileRequestPrams instance) =>
    <String, dynamic>{
      'NewPhoneNumber': instance.NewPhoneNumber,
      'CashifterRequestTypeId': instance.CashifterRequestTypeId,
    };
