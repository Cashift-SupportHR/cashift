import 'package:json_annotation/json_annotation.dart';


part 'job_requirements.g.dart';
@JsonSerializable(ignoreUnannotated: false)
class JobRequirements {
  @JsonKey(name: 'projectId')
  int? projectId;
  @JsonKey(name: 'ageFrom')
  int? ageFrom;
  @JsonKey(name: 'ageTo')
  int? ageTo;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'lengthFrom')
  int? lengthFrom;
  @JsonKey(name: 'lengthTo')
  int? lengthTo;
  @JsonKey(name: 'wieghtFrom')
  int? wieghtFrom;
  @JsonKey(name: 'wieghtTo')
  int? wieghtTo;
  @JsonKey(name: 'hoursCount')
  int? hoursCount;
  @JsonKey(name: 'specialization')
  String? specialization;

  JobRequirements({this.projectId, this.ageFrom, this.ageTo, this.gender, this.lengthFrom, this.lengthTo, this.wieghtFrom, this.wieghtTo, this.hoursCount, this.specialization});

   factory JobRequirements.fromJson(Map<String, dynamic> json) => _$JobRequirementsFromJson(json);

   Map<String, dynamic> toJson() => _$JobRequirementsToJson(this);
}


