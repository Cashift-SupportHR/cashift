import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';

import '../../../../../common/domain/entities/shared/date_formatter.dart';
import '../../../../shared/components/decorations/decorations.dart';
import '../../../resources/constants.dart';
import '../../../../shared/components/base_stateless_widget.dart';
import '../../../../shared/components/helper_widgets.dart';
import '../../../../shared/components/underline_widget.dart';
import 'add_absence_widget_builder.dart';

class AttendanceInfoCardWidget extends BaseStatelessWidget {
   AttendanceInfoCardWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: kPrimaryLight, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            MaterialText(
              DateFormatter. getCurrentDate()    ,
              startIcon: const Icon(
                Icons.calendar_month_outlined,
                color: kPrimary,
                size: 14,
              ),
              startIconPadding: const EdgeInsetsDirectional.only(end: 4),
              style: kTextRegularPrimary.copyWith(fontSize: 12),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
             strings.offer_you_service,
              style: kTextMedium.copyWith(
                color: kPrimary,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                onTapNotification(context);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: Decorations.createRectangleWithColorDecoration(
                    kPrimary, kPrimary, 20),
                width: 150,
                height: 35,
                child: Text(
                  strings.absenceNotice,
                  style: kTextMedium.copyWith(
                    color: kWhite,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  onTapNotification(context) {
    return showAppModalBottomSheet(
      context: context,
      isScrollControlled: true,
      title: strings.absenceNotice,
      isDivider: false,
      titleWidget: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              strings.absenceNotice,
              style: kTextBold.copyWith(color: kPrimary),
            ),
            const UnderlineWidget(),
          ],
        ),
      ),
      child: AddAbsenceWidgetBuilder(),
    );
  }


}
