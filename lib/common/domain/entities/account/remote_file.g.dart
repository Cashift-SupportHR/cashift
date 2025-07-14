// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteFile _$RemoteFileFromJson(Map<String, dynamic> json) => RemoteFile(
      fileAttachmentType: json['fileAttachmentType'] as String?,
      fileName: json['fileName'] as String?,
      fileAttachment: json['fileAttachment'] as String?,
      allowedEdit: json['allowEditFaceRecognition'] as bool?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$RemoteFileToJson(RemoteFile instance) =>
    <String, dynamic>{
      'fileAttachmentType': instance.fileAttachmentType,
      'fileName': instance.fileName,
      'fileAttachment': instance.fileAttachment,
      'notes': instance.notes,
      'allowEditFaceRecognition': instance.allowedEdit,
    };
