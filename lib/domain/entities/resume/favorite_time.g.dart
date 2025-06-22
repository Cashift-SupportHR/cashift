// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteTime _$FavoriteTimeFromJson(Map<String, dynamic> json) => FavoriteTime(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$FavoriteTimeToJson(FavoriteTime instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imagePath': instance.imagePath,
    };
