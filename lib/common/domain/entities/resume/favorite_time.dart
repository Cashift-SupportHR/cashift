import 'package:json_annotation/json_annotation.dart'; 

part 'favorite_time.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class FavoriteTime {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'imagePath')
  String? imagePath;

  FavoriteTime({this.id, this.name, this.imagePath});

   factory FavoriteTime.fromJson(Map<String, dynamic> json) => _$FavoriteTimeFromJson(json);

   Map<String, dynamic> toJson() => _$FavoriteTimeToJson(this);
}

