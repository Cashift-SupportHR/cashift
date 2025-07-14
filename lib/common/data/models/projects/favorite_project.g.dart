// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProject _$FavoriteProjectFromJson(Map<String, dynamic> json) =>
    FavoriteProject(
      id: (json['id'] as num).toInt(),
      projectId: (json['projectId'] as num).toInt(),
      projectName: json['projectName'] as String,
    );

Map<String, dynamic> _$FavoriteProjectToJson(FavoriteProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
    };
