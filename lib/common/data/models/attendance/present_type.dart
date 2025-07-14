import 'package:json_annotation/json_annotation.dart';

part 'present_type.g.dart';
@JsonSerializable(ignoreUnannotated: false)
class PresentType {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'icon')
  String? icon;
  @JsonKey(name: 'isActive')
  bool? isActive;

  PresentType({this.id, this.name, this.icon, this.isActive});

  factory PresentType.fromJson(Map<String, dynamic> json) => _$PresentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PresentTypeToJson(this);
}

