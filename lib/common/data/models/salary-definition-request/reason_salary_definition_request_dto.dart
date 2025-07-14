import 'package:json_annotation/json_annotation.dart';

part 'reason_salary_definition_request_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ReasonSalaryDefinitionRequestDto {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;

  ReasonSalaryDefinitionRequestDto({this.id, this.name});

   factory ReasonSalaryDefinitionRequestDto.fromJson(Map<String, dynamic> json) => _$ReasonSalaryDefinitionRequestDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ReasonSalaryDefinitionRequestDtoToJson(this);
}

