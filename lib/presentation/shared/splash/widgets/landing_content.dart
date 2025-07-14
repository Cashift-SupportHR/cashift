

import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../utils/app_images.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
import 'landing_model.dart';


class LnadingContent extends BaseStatelessWidget {
  final LandingModel landing;

  LnadingContent({Key? key, required this.landing});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.landingPageCurve,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 120),
          child: Column(
            children: [
              Image.asset(
                landing.image,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 30),
              Text(
                landing.title,
                textAlign: TextAlign.center,
                style: kTextBoldTitle.copyWith(color: kGreen_2, fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                landing.description,
                textAlign: TextAlign.center,
                style: kTextMedium.copyWith(color: kSteal, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
