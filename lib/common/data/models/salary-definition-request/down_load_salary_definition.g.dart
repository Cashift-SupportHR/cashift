// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'down_load_salary_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownLoadFileDto _$DownLoadFileDtoFromJson(Map<String, dynamic> json) =>
    DownLoadFileDto(
      fileAttachmentType: json['fileAttachmentType'] as String?,
      fileName: json['fileName'] as String?,
      fileAttachment: json['fileAttachment'] as String?,
    );

Map<String, dynamic> _$DownLoadFileDtoToJson(DownLoadFileDto instance) =>
    <String, dynamic>{
      'fileAttachmentType': instance.fileAttachmentType,
      'fileName': instance.fileName,
      'fileAttachment': instance.fileAttachment,
    };
