import 'package:json_annotation/json_annotation.dart'; 

part 'check_working_document_dto.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class CheckWorkingDocumentDto {
  @JsonKey(name: 'icon')
  String? icon;
  @JsonKey(name: 'decription')
  String? decription;
  @JsonKey(name: 'notes')
  String? notes;

  CheckWorkingDocumentDto({this.icon, this.decription, this.notes});

   factory CheckWorkingDocumentDto.fromJson(Map<String, dynamic> json) => _$CheckWorkingDocumentDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CheckWorkingDocumentDtoToJson(this);
}

