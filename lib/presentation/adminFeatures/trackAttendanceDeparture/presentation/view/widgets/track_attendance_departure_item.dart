import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/core/utils/app_icons.dart';

import '../../../../../../core/services/routes.dart';
import '../../../../../adminFeatures/available_opportunities/presentation/widgets/build_popup_menu_button.dart';
import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../../../shared/components/icons/icon_text.dart';
import '../../../../../shared/components/options_menu_button.dart';
import '../../../../../shared/components/texts/icon_double_text.dart';
import '../../../domain/entities/track_attendance_departure.dart';

class TrackAttendanceDepartureItem extends BaseStatelessWidget {
  final TrackAttendanceDeparture item;
  final bool details;
  final Function() onRefresh;

  TrackAttendanceDepartureItem({
    Key? key,
    required this.item,
    required this.details,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      // padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          _OptionsMenuButton(
            onRefresh: onRefresh,
            item: item,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildIconDoubleText(
                  icon: AppIcons.buildingsOutline,
                  title: strings.cashifter_name,
                  value: item.freelancerName ?? '',
                ),
                buildIconDoubleText(
                  icon: AppIcons.projectName,
                  title: strings.tracking_period,
                  value: item.dateRange(strings),
                ),
                buildIconDoubleText(
                  icon: AppIcons.phoneSolid,
                  title: strings.phone,
                  value: item.freelancerPhone??"",
                ),
                buildIconDoubleText(
                  icon: AppIcons.statusTime,
                  title: strings.status_request,
                  value: item.status ?? '',
                  colorText: kRed,
                ),
                detailsButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildIconDoubleText(
      {required String icon, required String title, required String value, Color? colorText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IconDoubleText(
        icon: icon,
        name: title + ' :',
        value: value,
        nameStyle: kTextRegular.copyWith(fontSize: 14, color: kPrimary),
        valueStyle: kTextMedium.copyWith(fontSize: 14, color: colorText),
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  GestureDetector detailsButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.trackAttendanceDepartureDetailsPage,
            arguments: item);
      },
      child: IconText(
        icon: AppIcons.hazard_details,
        text: strings.show_cashifter_images,
        textStyle: kTextRegular.copyWith(fontSize: 14, color: kOrange00),
        crossAxisAlignment: CrossAxisAlignment.start,
        isIconLift: true,
        iconSize: 20,
        padding: EdgeInsets.only(top: 5),
      ),
    );
  }
}

class _OptionsMenuButton extends BaseStatelessWidget {
  final item;
  final Function() onRefresh;

  _OptionsMenuButton({
    Key? key,
    required this.item,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = kTextBold.copyWith(fontSize: 10, color: kGreen_54);
    double iconSize = 16;
    return OptionsMenuButton(
      padding: EdgeInsets.all(16),
      options: [
        BuildPopupMenuItemContent(
          title: strings.edit,
          titleStyle: titleStyle,
          iconSize: iconSize,
        ),
      ],
      onSelect: (value) async {
        if (value == 0) {
          final isRefresh = await Navigator.pushNamed(
              context, Routes.requestTrackAttendanceDeparturePage,
              arguments: item);
          if (isRefresh == true) {
            onRefresh();
          }
        }
      },
    );
  }
}
