import 'package:json_annotation/json_annotation.dart'; 

part 'salary_definition_request_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class SalaryDefinitionRequestDto {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'slipForDistination')
  String? slipForDistination;
  @JsonKey(name: 'resonF')
  String? resonF;
  @JsonKey(name: 'needStamp')
  String? needStamp;
  @JsonKey(name: 'createdDate')
  String? createdDate;
  @JsonKey(name: 'rejectReason')
  String? rejectReason;
  @JsonKey(name: 'fileAttachment')
  String? fileAttachment;

  SalaryDefinitionRequestDto({this.id, this.title, this.slipForDistination, this.resonF, this.needStamp, this.createdDate, this.rejectReason, this.fileAttachment});

   factory SalaryDefinitionRequestDto.fromJson(Map<String, dynamic> json) => _$SalaryDefinitionRequestDtoFromJson(json);

   Map<String, dynamic> toJson() => _$SalaryDefinitionRequestDtoToJson(this);
}

