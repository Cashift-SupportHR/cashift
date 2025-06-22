// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelItem _$LevelItemFromJson(Map<String, dynamic> json) => LevelItem(
      id: (json['id'] as num?)?.toInt(),
      levelName: json['levelName'] as String?,
    );

Map<String, dynamic> _$LevelItemToJson(LevelItem instance) => <String, dynamic>{
      'id': instance.id,
      'levelName': instance.levelName,
    };
