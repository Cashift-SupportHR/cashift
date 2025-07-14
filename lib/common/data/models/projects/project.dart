import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/domain/entities/projects/project.dart';

part 'project.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ProjectDto {
  @JsonKey(name: 'id')
  final  int id;
  @JsonKey(name: 'projectName')
  String? projectName;
  @JsonKey(name: 'logo')
  String? logo;
  @JsonKey(name: 'address')
  String? address;

  ProjectDto({required this.id,  this.projectName,  this.address,  this.logo});

  factory ProjectDto.fromJson(Map<String, dynamic> json) => _$ProjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectDtoToJson(this);

  Project builder(bool favorite){
    return Project(id: id, projectName: projectName ?? '', favorite: favorite, logo: logo ?? '',address: address ?? '');
  }
}

