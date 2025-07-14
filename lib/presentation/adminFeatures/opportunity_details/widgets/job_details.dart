import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/underline_widget.dart';

import '../../shared/domain/entities/opportunities/opportunity_details.dart';

class JobDetails extends BaseStatelessWidget {
  final OpportunityDetails opportunityDetails;
  JobDetails({Key? key, required this.opportunityDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = kTextMedium.copyWith(
      color: kFontDark,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(strings.opportunity_details,
              style: kTextRegular.copyWith(
                color: kPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              )),
          const UnderlineWidget(),
          const SizedBox(
            height: 10,
          ),
          _CustomRichText(
            title: strings.the_opportunity,
            subTitle: opportunityDetails.jobName ?? '',
            subTitleStyle: kTextRegular.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          _RowTexts(
            child: _CustomRichText(
              title: strings.working_hours2,
              subTitle: '${opportunityDetails.workingHours ?? ''} ${strings.hours}',
              subTitleStyle: kTextRegular.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            subChild: _CustomRichText(
              title: strings.opportunity_value,
              children: [
                TextSpan(
                  text: '${opportunityDetails.salaries ?? ''}\t',
                  style: style,
                ),
                TextSpan(
                  text: strings.rs,
                  style: style.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          _RowTexts(
            child: _CustomRichText(
              title: strings.beginning_work,
              subTitle: opportunityDetails.startShiftDate ?? '',
            ),
            subChild: _CustomRichText(
              title: strings.end_work,
              subTitle: opportunityDetails.endShiftDate ?? '',
            ),
          ),
          _RowTexts(
            child: _CustomRichText(
              title: strings.required_number,
              subTitle: opportunityDetails.requiredCount.toString() ?? '',
              subTitleStyle: style,
            ),
            subChild: _CustomRichText(
              title: strings.remaining_number,
              subTitle: opportunityDetails.actualNumber.toString() ?? '',
              subTitleStyle: style,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomRichText extends StatelessWidget {
  final String title;
  final String? subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;
  final List<TextSpan>? children;

  const _CustomRichText({
    Key? key,
    required this.title,
    this.subTitle,
    this.subTitleStyle,
    this.children,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 12, bottom: 12),
      child: RichText(
        text: TextSpan(
          text: '$title :\t\t',
          style: titleStyle ??
              kTextMediumPrimary.copyWith(
                fontSize: 12,
              ),
          children: children ??
              [
                TextSpan(
                  text: subTitle,
                  style: subTitleStyle ??
                      kTextRegular.copyWith(
                        fontSize: 12,
                        color: kFontDark,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
        ),
      ),
    );
  }
}

class _RowTexts extends StatelessWidget {
  final Widget child;
  final Widget subChild;

  const _RowTexts({Key? key, required this.child, required this.subChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: child,
        ),
        Expanded(
          child: subChild,
        ),
      ],
    );
  }
}
