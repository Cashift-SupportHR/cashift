import 'package:json_annotation/json_annotation.dart'; 

part 'down_load_salary_definition.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class DownLoadFileDto {
  @JsonKey(name: 'fileAttachmentType')
  String? fileAttachmentType;
  @JsonKey(name: 'fileName')
  String? fileName;
  @JsonKey(name: 'fileAttachment')
  String? fileAttachment;

  DownLoadFileDto({this.fileAttachmentType, this.fileName, this.fileAttachment});

   factory DownLoadFileDto.fromJson(Map<String, dynamic> json) => _$DownLoadFileDtoFromJson(json);

   Map<String, dynamic> toJson() => _$DownLoadFileDtoToJson(this);
}

