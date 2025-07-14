import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/components/base/base_stateless_widget.dart';


class CustomSmoothPageIndicator extends BaseStatelessWidget {
  final int count;
  final PageController controller;
   CustomSmoothPageIndicator({Key? key, required this.count, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SmoothPageIndicator(
        controller: controller,
        count: count ,
        effect: const ExpandingDotsEffect(
          dotColor: kGrey_D9,
          activeDotColor: kGreen_2,
          dotHeight: 6,
          dotWidth: 14,
          spacing: 5,
          expansionFactor: 2,
        ),
      ),
    );
  }
}
