import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../shared/components/circular_percent_widget.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../../shared/domain/entities/opportunities/PercentageOpportunty.dart';

class StatisticWidget extends BaseStatelessWidget {
  final List<PercentageOpportunty> percentageOpportunty;

  StatisticWidget({required this.percentageOpportunty});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.boxDecorationBorder(borderColor: kGrey_EE, color: kGrey_EE, radius: 10),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(AppIcons.totalSta),
              SizedBox(
                width: 10,
              ),
              Text(
                strings.total_statistic,
                style: kTextSemiBold.copyWith(color: kOrange00, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 110,
            width: double.infinity,
            child: ListView.builder(
              itemCount: percentageOpportunty.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                double percent = double.parse(percentageOpportunty[index].percentage.toString()) == 0
                    ? 0
                    : double.parse(percentageOpportunty[index].percentage.toString()) / 100;
                return circularPercentWidget(
                    percentData: PercentData(
                        label: percentageOpportunty[index].label ?? '',
                        text: percentageOpportunty[index].name ?? '',
                        percent: percent,
                        count: percentageOpportunty[index].count ?? 0));
              },
            ),
          ),
        ],
      ),
    );
  }
}
