import 'package:json_annotation/json_annotation.dart'; 

part 'job_skills.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class JobSkills {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'imagePath')
  String? imagePath;

  JobSkills({this.id, this.name, this.imagePath});

   factory JobSkills.fromJson(Map<String, dynamic> json) => _$JobSkillsFromJson(json);

   Map<String, dynamic> toJson() => _$JobSkillsToJson(this);
}

