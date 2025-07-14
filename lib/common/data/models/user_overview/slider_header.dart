import 'package:json_annotation/json_annotation.dart'; 

part 'slider_header.g.dart';



@JsonSerializable(ignoreUnannotated: true)
class SliderHeader {
  @JsonKey(name: 'titleHeader')
  String? titleHeader;
  @JsonKey(name: 'subTitleHeader')
  String? subTitleHeader;

  SliderHeader({this.titleHeader, this.subTitleHeader});

  factory SliderHeader.fromJson(Map<String, dynamic> json) => _$SliderHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$SliderHeaderToJson(this);
}


