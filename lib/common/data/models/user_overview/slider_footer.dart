import 'package:json_annotation/json_annotation.dart';

import 'slider_details.dart';
import 'slider_header.dart';

part 'slider_footer.g.dart';




@JsonSerializable(ignoreUnannotated: true)
class SliderFooter {
  @JsonKey(name: 'titleFooter')
  String? titleFooter;
  @JsonKey(name: 'imageFooter')
  String? imageFooter;

  SliderFooter({this.titleFooter, this.imageFooter});

  factory SliderFooter.fromJson(Map<String, dynamic> json) => _$SliderFooterFromJson(json);

  Map<String, dynamic> toJson() => _$SliderFooterToJson(this);
}
