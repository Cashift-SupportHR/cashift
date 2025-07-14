import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/common/domain/entities/shared/date_formatter.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import 'package:shiftapp/common/components/image_builder.dart';
import 'package:shiftapp/common/components/material_text.dart';
import 'package:shiftapp/common/components/outlint_button.dart';

import '../../../../utils/app_icons.dart';
 import '../../../../common/components/curancy_widget.dart';
import '../../../../common/components/decorations/decorations.dart';
import '../../mainnavigation/overview/widgets/current_shift_widget.dart';

class ShiftItemWidget extends BaseStatelessWidget {
  final AppliedOffer shift;
  final Function? onClickDetails;
  final Function()? onItemTap;
  final bool? isActive;
  final bool showTimer;
  final bool? showOptions;
  final Function(AppliedOffer shift) onClickChange;
  final Function(AppliedOffer shift) onClickCancel;
  final int? maxLines;

  ShiftItemWidget(this.shift,
      {Key? key,
      this.onClickDetails,
      this.onItemTap,
      required this.onClickChange,
      required this.onClickCancel,
      this.isActive = false,
      this.showOptions,
      this.showTimer = true,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("shiftItemWidget ${shift.notes}");
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: InkWell(
          onTap: onItemTap,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), border: Border.all(color: kSilver, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildTitle(shift, context),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildShiftTime(shift),
                            const SizedBox(
                              height: 8,
                            ),
                            buildShiftDate(shift),
                            const SizedBox(
                              height: 8,
                            ),
                            buildStatusWidget(shift),
                            const SizedBox(
                              height: 8,
                            ),
                           buildShiftPrice(shift),
                            ((shift.totalDeductions == 0 && shift.deservedAmount == 0) || (shift.totalDeductions == null && shift.deservedAmount == null))
                                ? SizedBox()
                                : Container(
                                    padding: EdgeInsets.all(16),
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    decoration: Decorations.boxDecorationBorder(
                                      borderColor: kPrimary,
                                    ),
                                    child: Column(
                                      children: [
                                        shift.totalDeductions == null || shift.totalDeductions == 0
                                            ? SizedBox()
                                            : itemValue(text: strings.total_deductions, value: '${shift.totalDeductions} ${strings.rs}'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        shift.deservedAmount == 0 || shift.deservedAmount == null
                                            ? SizedBox()
                                            : itemValue(text: strings.net, value: '${shift.deservedAmount} ${strings.rs}'),
                                      ],
                                    ),
                                  ),
                            if (shift.notes != null && shift.notes!.isNotEmpty)
                              WarningWidget(
                                iconPath: AppIcons.waiting,
                                color: kPrimary,
                                warningText: shift.notes!,
                                maxLines: maxLines,
                                margin: EdgeInsetsDirectional.only(top: 10),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      buildDetailsButton(context, shift)
                    ],
                  ),
                ),
              ),
/*
              PositionedDirectional(
                  end: 10,
                  top: 0,
                  bottom: 0,
                  child: Icon(Icons.arrow_forward_ios,color: kGrey_94,size: 15,))
*/
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(AppliedOffer job, BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: job.isStarted() && showTimer
                ? buildTimerWidget(job)
                : MaterialText(
                    job.projectName!,
                    overflow: TextOverflow.ellipsis,
                    mathWidth: true,
                    subText: buildJobWidget(shift),
                    style: kTextMedium.copyWith(fontSize: 14),
                    startIcon: kBuildImage(job.logo(), size: 32),
                    endIconPadding: EdgeInsetsDirectional.only(start: 24),
                    startIconPadding: const EdgeInsetsDirectional.only(end: 8),
                  ),
          ),
          isActive == true && shift.ableToAttendance() ? options(context, shift) : Container(),
        ],
      ),
    );
  }

  Widget projectTitle(AppliedOffer job) {
    return MaterialText(
      job.projectName!,
      style: kTextMedium.copyWith(fontSize: 14),
      startIcon: kBuildImage(job.logo(), size: 32),
      startIconPadding: const EdgeInsetsDirectional.only(end: 8),
    );
  }

  Widget itemValue({
    required String text,
    required String value,
  }) {
    return Row(
      children: [
        Text(
          text,
          style: kTextMedium.copyWith(fontSize: 13, fontWeight: FontWeight.w600, color: kPrimaryDark),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          value,
          style: kTextMedium.copyWith(fontSize: 12),
        ),
      ],
    );
  }

  Widget buildTimerWidget(AppliedOffer currentShift) {
    return CountdownTimer(
      endTime: currentShift.finishedDateTime()!.millisecondsSinceEpoch,
      widgetBuilder: (c, time) {
        final hour = time != null && time.hours != null ? time.hours! : 0;
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: getCurrentShiftBackgroundColor(hour)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  Row(
                    children: [
                      kBuildImage(shift.logo(), size: 32),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shift.projectName.toString(),
                            style: kTextMedium.copyWith(fontSize: 14),
                          ),
                          time == null
                              ? Text(
                                  strings.finish_shift_label,
                                  style: kTextRegular.copyWith(fontSize: 12, color: kLipStick),
                                )
                              : Row(
                                  children: [
                                    Text(
                                      strings.remaining_time,
                                      style: kTextRegular.copyWith(fontSize: 12),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Text(
                                        ' ${time.hours ?? 0} : ${time.min ?? 0}  : ${time.sec.toString()} ',
                                        style: kTextBold.copyWith(fontSize: 12, color: getHourColor(time.hours ?? 0)),
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  buildJobWidget(AppliedOffer job) {
    return Text(
      job.jobName ?? '',
      style: kTextRegular.copyWith(color: kPrimary, fontSize: 12),
    );
  }

  Widget buildShiftTime(AppliedOffer job) {
    return MaterialText(
      // mathWidth: true,
      getShiftTime(job),
      style: kTextMedium.copyWith(fontSize: 12, color: kDarkGrey),
      startIconPadding: const EdgeInsetsDirectional.only(end: 16),
      startIcon: SvgPicture.asset('images/clock.svg'),
      endIconPadding: const EdgeInsetsDirectional.only(start: 20),
    );
  }

  Widget buildShiftPrice(AppliedOffer job) {
    return
     Row(
       children: [
         Padding(
           padding: const EdgeInsetsDirectional.only(end: 16),
           child: kLoadSvgInCirclePath(AppIcons.opportunityValue),
         ),
         CurancyWidget(valuePrice:   job.salary.toString() ,valueStyle:  kTextMedium.copyWith(fontSize: 12, color: kDarkGrey)),
       SizedBox(width: 20,),
       ],
     );

  }

  Widget buildShiftDate(AppliedOffer job) {
    final date = DateFormatter.formatDate(job.startDateTime(), DateFormatter.DATE_UI);
    return MaterialText(
      '${strings.working_date} $date',
      style: kTextMedium.copyWith(fontSize: 12, color: kDarkGrey),
      startIconPadding: const EdgeInsetsDirectional.only(end: 16),
      startIcon: Icon(
        Icons.calendar_today_outlined,
        color: kBattleShipGrey,
        size: 15,
      ),
      endIconPadding: const EdgeInsetsDirectional.only(start: 20),
    );
  }

  Widget buildStatusWidget(AppliedOffer job) {
    final statusColor = job.isPending()
        ? kYellow
        : job.isStarted()
            ? kCoolGreen
            : kDarkGrey;

    return MaterialText(
      job.status ?? '',
      style: kTextMedium.copyWith(fontSize: 12, color: statusColor),
      startIconPadding: const EdgeInsetsDirectional.only(end: 16),
      startIcon: Image.asset(
        'images/status.png',
        color: statusColor,
        height: 15,
      ),
      endIconPadding: const EdgeInsetsDirectional.only(start: 20),
    );
  }

  String getShiftTime(AppliedOffer job) {
    final start = hourFromDate(job.opportunitiesEndTime ?? '');
    final end = hourFromDate(job.opportunitiesStrartTime ?? '');

    return '$end  -  $start';
  }

  String hourFromDate(String date) {
    return DateFormatter.formatDateString(date, DateFormatter.HOUR_MINUT, DateFormatter.HOUR_MINUT_12, local: local);
  }

  Widget buildDetailsButton(BuildContext context, AppliedOffer shift) {
    return onClickDetails != null
        ? AppOutlineButton(
            onClick: () async {
              onClickDetails!();
            },
            child: Text(
              strings.show_details,
              style: kTextRegularPrimary,
            ),
            borderWidth: 0.8,
          )
        : Container();
  }

  Widget options(context, AppliedOffer shift) {
    return PopupMenuButton(
        icon: Container(
          height: 27,
          width: 27,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimary.withOpacity(0.2),
          ),
          child: Center(
              child: Image.asset(
            'images/option.png',
            height: 20,
          )),
        ),
        position: PopupMenuPosition.under,
        itemBuilder: (_) => optionItems(shift),
        onSelected: (value) {
          if (value == 'Attendance') {
            onClickChange(shift);
          }

          if (value == 'Cancel') {
            onClickCancel(shift);
          }
        });
  }

  List<PopupMenuItem> optionItems(AppliedOffer shift) {
    final items = <PopupMenuItem>[];
    items.add(menuItem(shift.isAccept() ? strings.checkin : strings.checkout, 'Attendance'));
    if (shift.ableToCancel()) {
      items.add(menuItem(strings.cancel_shift_title, 'Cancel'));
    }

    return items;
  }

  PopupMenuItem menuItem(String name, String value) {
    return PopupMenuItem<String>(
        child: Text(
          name,
          style: kTextRegular.copyWith(fontSize: 11, color: kGreyishBrown),
        ),
        value: value);
  }
}
