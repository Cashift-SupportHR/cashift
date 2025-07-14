import 'package:json_annotation/json_annotation.dart';

import 'slider_header.dart';

part 'slider_details.g.dart';




@JsonSerializable(ignoreUnannotated: true)
class SliderDetails {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;

  SliderDetails({this.title, this.description, this.image});

  factory SliderDetails.fromJson(Map<String, dynamic> json) => _$SliderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SliderDetailsToJson(this);
}


