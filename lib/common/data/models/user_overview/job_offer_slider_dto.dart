import 'package:json_annotation/json_annotation.dart';

import 'slider_details.dart';
import 'slider_footer.dart';
import 'slider_header.dart';

part 'job_offer_slider_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class JobOfferSliderDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'jobName')
  String? jobName;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'mainLogo')
  String? mainLogo;
  @JsonKey(name: 'backGroundLogo')
  String? backGroundLogo;
  @JsonKey(name: 'companyLogo')
  String? companyLogo;
  @JsonKey(name: 'actionName')
  String? actionName;
  @JsonKey(name: 'header')
  SliderHeader? header;
  @JsonKey(name: 'details')
  List<SliderDetails>? details;
  @JsonKey(name: 'footer')
  SliderFooter? footer;

  JobOfferSliderDto({ this.id, this.jobName, this.description, this.mainLogo, this.backGroundLogo, this.companyLogo, this.actionName, this.header, this.details, this.footer});

  factory JobOfferSliderDto.fromJson(Map<String, dynamic> json) => _$JobOfferSliderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobOfferSliderDtoToJson(this);
}


