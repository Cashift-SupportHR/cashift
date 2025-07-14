import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';

import '../../../../shared/components/base_stateless_widget.dart';
import '../../../addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import '../../../available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../shared/domain/entities/opportunities/opportunity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';
import 'package:shiftapp/presentation/shared/components/outlint_button.dart';
import 'package:shiftapp/presentation/shared/components/shapes/rounded_shape.dart';
import 'package:shiftapp/utils/app_utils.dart';

class TodayOpportunityWidget extends BaseStatelessWidget {
  final void Function() onItemTap;
  final Opportunity opportunity;
  final Function()? onRefresh;

  TodayOpportunityWidget(
      {required this.opportunity, required this.onItemTap, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            bottom: 8, end: 16, top: 2, start: 2),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1.5,
                      blurRadius: 2,
                      offset: const Offset(0, 2), // c // c
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: kSilver, width: 0.5)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildTitle(context),
                    const SizedBox(
                      height: 16,
                    ),
                    buildAddress(context),
                    const SizedBox(
                      height: 8,
                    ),
                    buildShiftTime2(),
                    const Spacer(),
                    buildDetailsButton(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
            shadowColor: kPrimaryDark,
            margin: const EdgeInsets.all(2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: kBuildImage(opportunity.logoPath.toString(),
                size: 50, border: 0)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    opportunity.jobName ?? 'Job Name',
                    style: kTextMedium.copyWith(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  opportunity.companyName ?? 'Company Name',
                  style: kTextRegularSilver.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
        ),
        remainingCountWidget(),
      ],
    );
  }

  Widget buildShiftTime() {
    return MaterialText(
      getShiftTime(),
      style: kTextMedium.copyWith(fontSize: 12, color: kDarkGrey),
      startIconPadding: const EdgeInsetsDirectional.only(end: 16),
      startIcon: SvgPicture.asset('images/clock.svg'),
      endIconPadding: const EdgeInsetsDirectional.only(start: 20),
    );
  }

  Widget buildShiftTime2() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: SvgPicture.asset('images/clock.svg'),
        ),
        Text(
          '${strings.shift_times}  : ',
          style: kTextRegularCoolGrey.copyWith(fontSize: 12),
        ),
        Text(
          '${DateFormatter.formatDate(DateTime.parse(opportunity.workingStartDate!), 'h:mm a')} - ${DateFormatter.formatDate(DateTime.parse(opportunity.workingEndDate!), 'h:mm a')}',
          style: kTextRegularGrey.copyWith(fontSize: 12),
        ),
      ],
    );
  }

  Widget buildAddress(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 10),
          child: SvgPicture.asset('images/location.svg'),
        ),
        Text(
          '${strings.location}  : ',
          style: kTextRegularCoolGrey.copyWith(fontSize: 12),
        ),
        Flexible(
          child: Text(
            opportunity.address ?? "",
            style: kTextRegularGrey.copyWith(fontSize: 12),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        navigateLocationButton(context),
      ],
    );
  }

  String getShiftTime() {
    final start = hourFromDate(opportunity.startShiftDate ?? '');
    final end = hourFromDate(opportunity.endShiftDate ?? '');

    return '$end  -  $start';
  }

  String hourFromDate(String date) {
    return date;
  }

  Widget buildDetailsButton(
    BuildContext context,
  ) {
    return Row(
      children: [
        Expanded(
          child: AppOutlineButton(
            onClick: () {
              onItemTap();
            },
            child: Text(
              strings.show_details,
              style: kTextSemiBold.copyWith(color: kPrimary),
            ),
            radius: 6,
            borderWidth: 0.9,
            strokeColor: kPrimary,
            padding: const EdgeInsets.symmetric(vertical: 13),
          ),
        ),
        checkStatusOpportunity(context),
      ],
    );
  }

  Widget checkStatusOpportunity(BuildContext context) {
    return BuildPopupMenuButton(
      opportunity: opportunity,
      onRefresh: onRefresh,
      onNavigatorToEdit: () {
        AddNewOpportunityPage.push(context, opportunity: opportunity,
            onSuccess: () {
          onRefresh!();
        });
      },
    );
  }

  Widget navigateLocationButton(BuildContext context) {
    return SizedBox(
      height: 20,
      child: TextButton(
        onPressed: () {
          AppUtils.launchMap(
              lat: '${opportunity.latitude}', long: '${opportunity.longtude}');
          //  JobOfferWidgetHelper.openMap(context, jobOffer);
        },
        style: TextButton.styleFrom(
            fixedSize: const Size.fromHeight(20),
            padding: const EdgeInsets.all(0)),
        child: MaterialText(
          strings.open_map,
          style: kTextRegular.copyWith(color: kPrimary, fontSize: 10),
          endIcon: Image.asset(
            'images/gps.png',
            height: 10,
          ),
        ),
      ),
    );
  }

  Widget remainingCountWidget() {
    return Align(
        alignment: AlignmentDirectional.topCenter,
        child: RoundedShape(
          width: 80,
          height: 28,
          radius: 8,
          color: (opportunity.isExpired() ? Colors.red : kPrimary)
              .withOpacity(0.10),
          child: Text(
            remainingCount(),
            style: kTextMedium.copyWith(
                fontSize: 10,
                color: (opportunity.isExpired() ? Colors.red : kPrimary)),
          ),
        ));
  }

  String remainingCount() {
    return opportunity.isExpired()
        ? '${opportunity.requiredCount} ${strings.expired}'
        : '${opportunity.requiredCount}  ${strings.remaining}  ${opportunity.actualNumber} ';
  }
}
