import 'package:json_annotation/json_annotation.dart'; 

part 'level_item.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class LevelItem {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'levelName')
  final  String? levelName;

  LevelItem({this.id, this.levelName});

  factory LevelItem.fromJson(Map<String, dynamic> json) => _$LevelItemFromJson(json);

  Map<String, dynamic> toJson() => _$LevelItemToJson(this);
}

