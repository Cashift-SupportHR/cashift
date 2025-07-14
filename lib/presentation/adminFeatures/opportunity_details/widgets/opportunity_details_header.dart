import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../common/components/decorations/decorations.dart';
import '../../../../common/components/image_builder.dart';
import '../../shared/domain/entities/opportunities/OpportunityDetailsData.dart';

class OpportunityDetailsHeader extends StatelessWidget {
  final OpportunityDetailsData opportunityDetails;
  OpportunityDetailsHeader({
    Key? key,
    required this.opportunityDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kBuildCircleImage(
          opportunityDetails.companyLogo ?? '',
          size: 80,
          margin: EdgeInsets.all(10),
          decoration: Decorations.shapeDecorationBorderCircular(width: 2),
          borderColor: kPrimary,
        ),
        Text(
          opportunityDetails.projectName ?? '',
          style: kTextRegular.copyWith(fontSize: 15, color: kPrimary),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          opportunityDetails.companyName ?? '',
          style: kTextSemiBold.copyWith(fontSize: 24, color: kGreen_66),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
