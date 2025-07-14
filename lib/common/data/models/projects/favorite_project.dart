import 'package:json_annotation/json_annotation.dart'; 

part 'favorite_project.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class FavoriteProject {
  @JsonKey(name: 'id')
  final  int id;
  @JsonKey(name: 'projectId')
  final  int projectId;
  @JsonKey(name: 'projectName')
  final  String projectName;

  FavoriteProject({required this.id, required this.projectId, required this.projectName});

  factory FavoriteProject.fromJson(Map<String, dynamic> json) => _$FavoriteProjectFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteProjectToJson(this);
}

