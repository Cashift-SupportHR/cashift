import 'package:json_annotation/json_annotation.dart';

import 'type_clearance_certificatet.dart';

part 'disclosure_required_task_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class DisclosureRequiredTaskDto {
  @JsonKey(name: 'logo')
  String? logo;
  @JsonKey(name: 'mainText')
  String? mainText;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'typeClearanceCertificate')
  List<TypeClearanceCertificate>? typeClearanceCertificate;

  DisclosureRequiredTaskDto({this.logo, this.mainText, this.description, this.typeClearanceCertificate});

   factory DisclosureRequiredTaskDto.fromJson(Map<String, dynamic> json) => _$DisclosureRequiredTaskDtoFromJson(json);

   Map<String, dynamic> toJson() => _$DisclosureRequiredTaskDtoToJson(this);
}



