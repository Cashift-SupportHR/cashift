import 'package:json_annotation/json_annotation.dart'; 

part 'remote_file.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class RemoteFile {
  @JsonKey(name: 'fileAttachmentType')
  final  String? fileAttachmentType;
  @JsonKey(name: 'fileName')
  final  String? fileName;
  @JsonKey(name: 'fileAttachment')
  final  String? fileAttachment;
  @JsonKey(name: 'notes')
  final  String? notes;
  @JsonKey(name: 'allowEditFaceRecognition')
  final  bool? allowedEdit;

  RemoteFile({this.fileAttachmentType, this.fileName, this.fileAttachment ,this.allowedEdit ,this.notes});

   factory RemoteFile.fromJson(Map<String, dynamic> json) => _$RemoteFileFromJson(json);

   Map<String, dynamic> toJson() => _$RemoteFileToJson(this);
}

