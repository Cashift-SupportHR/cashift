import 'package:flutter/material.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../common/domain/entities/workerWorkPlaces/focus_point_info.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/decorations/decorations.dart';

class DatesWidgetPoint extends BaseStatelessWidget {
  final FocusPointInfo focusPointInfo;

  DatesWidgetPoint({Key? key, required this.focusPointInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _DatesItem(
            day: strings.today,
            date: DateFormatter.repairApiDateTime(focusPointInfo.date ?? '', apiPattern: DateFormatter.DATE_Api_DD_MM_YYYY, pattern: DateFormatter.DATE_D_MMM_YYYY),
            icon: AppIcons.calendarCircle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: _DatesItem(
          day: focusPointInfo.shiftName ?? '',
          icon: AppIcons.timeOutline,
          iconSize: 16,
          date:
              '${strings.from}${DateFormatter.repairApiTime(focusPointInfo.startShift ?? '', apiPattern: DateFormatter.TIME_UI)}\t\t${strings.to} ${DateFormatter.repairApiTime(focusPointInfo.endShift ?? '', apiPattern: DateFormatter.TIME_UI)}',
        )),
      ],
    );
  }
}

class _DatesItem extends StatelessWidget {
  final String day;
  final String date;
  final String icon;
  final double? iconSize;

  const _DatesItem({Key? key, required this.day, required this.date, required this.icon, this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      padding: const EdgeInsets.all(10),
      decoration: Decorations.decorationWithGradientNotSpread(),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(top: 5), child: kLoadSvgInCirclePath(icon, width: iconSize, height: iconSize)),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(day, style: kTextBold.copyWith(fontSize: 14, color: kPrimary)),
                const SizedBox(height: 10),
                SizedBox(child: Text(date, style: kTextRegular.copyWith(fontSize: 14, color: kBlack.withOpacity(0.7)))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
