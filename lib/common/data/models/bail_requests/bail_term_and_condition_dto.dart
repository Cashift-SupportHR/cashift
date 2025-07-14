import 'package:json_annotation/json_annotation.dart'; 

part 'bail_term_and_condition_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class BailTermAndConditionDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'conditionName')
  String? conditionName;
  @JsonKey(name: 'statusId')
  int? statusId;

  BailTermAndConditionDto({this.id, this.conditionName, this.statusId});

   factory BailTermAndConditionDto.fromJson(Map<String, dynamic> json) => _$BailTermAndConditionDtoFromJson(json);

   Map<String, dynamic> toJson() => _$BailTermAndConditionDtoToJson(this);
}

