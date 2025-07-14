import 'package:json_annotation/json_annotation.dart'; 

part 'focus_point_info_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class FocusPointInfoDto {
  @JsonKey(name: 'freelanceName')
  String? freelanceName;
  @JsonKey(name: 'projectName')
  String? projectName;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'shiftName')
  String? shiftName;
  @JsonKey(name: 'startShift')
  String? startShift;
  @JsonKey(name: 'endShift')
  String? endShift;

  FocusPointInfoDto({this.freelanceName, this.projectName, this.date, this.shiftName});

   factory FocusPointInfoDto.fromJson(Map<String, dynamic> json) => _$FocusPointInfoDtoFromJson(json);

   Map<String, dynamic> toJson() => _$FocusPointInfoDtoToJson(this);
}

