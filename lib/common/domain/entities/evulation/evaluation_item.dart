import 'package:json_annotation/json_annotation.dart'; 

part 'evaluation_item.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class EvaluationItem {
  @JsonKey(name: 'id')
    int id;
  @JsonKey(name: 'title')
    String title;
  @JsonKey(name: 'value')
    int value;

  EvaluationItem({required this.id, required this.title, required this.value});

  factory EvaluationItem.fromJson(Map<String, dynamic> json) => _$EvaluationItemFromJson(json);

  Map<String, dynamic> toJson() => _$EvaluationItemToJson(this);
}

