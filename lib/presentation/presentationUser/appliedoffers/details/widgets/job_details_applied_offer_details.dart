import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';

import '../../../../../domain/entities/shift/applied_offer.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../applied_offer_details_screen_v2.dart';
import 'decoration_container.dart';



class OpportunityDetailsAppliedOfferDetails extends BaseStatelessWidget {
  final AppliedOffer appliedOffer;

  OpportunityDetailsAppliedOfferDetails({Key? key, required this.appliedOffer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List items = [
      {
        'image': AppIcons.building,
        'type': strings.project_name,
        'value': appliedOffer.projectName ?? '',
      },
      {
        'image': AppIcons.workSpecialty,
        'type': strings.job,
        'value': appliedOffer.jobName ?? '',
      },
      {
        'image': AppIcons.calendar,
        'type': strings.opportunity_value,
        'value': appliedOffer.salary.toString().addCurrencyShort(context) ?? '',
      },

    ];
    return BackgroundContainer(
      title: strings.opportunity_details,
      child: Column(
        children: items.map((e) => OpportunityTermItem(
          image: e['image'],
          title: e['type'],
          value: e['value'],
          isDivider: items.indexOf(e) != items.length - 1,
        )).toList(),
      ),
    );
  }
  /*@override
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
          Text(strings.job_details,
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
            title: strings.job,
            subTitle: appliedOffers.jobName ?? '',
            subTitleStyle: kTextRegular.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          _RowTexts(
            child: _CustomRichText(
              title: strings.working_hours2,
              subTitle: '${appliedOffers.actualNumber ?? ''} ${strings.hours}',
              subTitleStyle: kTextRegular.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),),
            subChild: Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: RichText(
                text: TextSpan(
                  text: strings.opportunity_value + ' : ',
                  style:
                  kTextMediumPrimary.copyWith(
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(
                      text: appliedOffers.salary?.toString() ?? '',
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
            ),
          ),
        ],
      ),
    );
  }*/
}
class _CustomRichText extends StatelessWidget {
  final String title;
  final String subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subTitleStyle;

  const _CustomRichText(
      {Key? key,
        required this.title,
        required this.subTitle, this.titleStyle, this.subTitleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 12, bottom: 12),
      child: RichText(
        text: TextSpan(
          text: '$title :\t\t',
          style: titleStyle ??
              kTextMediumPrimary.copyWith(
                fontSize: 14,
              ),
          children: [
            TextSpan(
              text: subTitle,
              style: subTitleStyle ??
                  kTextRegular.copyWith(
                    fontSize: 14,
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

  const _RowTexts({Key? key, required this.child, required this.subChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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