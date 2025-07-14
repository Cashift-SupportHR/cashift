import 'package:shiftapp/common/data/models/user_overview/slider_details.dart';
import 'package:shiftapp/common/data/models/user_overview/slider_footer.dart';
import 'package:shiftapp/common/data/models/user_overview/slider_header.dart';

import '../../../data/models/user_overview/index.dart';


class JobOfferSlider {
  final int? id;
  String? jobName;
  String? description;
  String? mainLogo;
  String? backGroundLogo;
  String? companyLogo;
  String? actionName;
  SliderHeader? header;
  List<SliderDetails>? details;
  SliderFooter? footer;

  JobOfferSlider({
    this.id,
    this.jobName,
    this.description,
    this.mainLogo,
    this.backGroundLogo,
    this.companyLogo,
    this.actionName,
    this.header,
    this.details,
    this.footer,
  });

  factory JobOfferSlider.fromDto(JobOfferSliderDto json) {
    return JobOfferSlider(
      id: json.id,
      jobName: json.jobName,
      description: json.description,
      mainLogo: json.mainLogo,
      backGroundLogo: json.backGroundLogo,
      companyLogo: json.companyLogo,
      actionName: json.actionName,
      header: json.header,
      details: json.details,
      footer: json.footer,
    );
  }

}