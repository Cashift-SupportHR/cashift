import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shiftapp/common/domain/entities/collect_cash/dues_item.dart';
import 'package:shiftapp/generated/assets.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/ui_constanst.dart';

import 'package:shiftapp/presentation/shared/components/material_text.dart';

import '../../../shared/components/base_widget.dart';

class CollectCashItemWidget extends BaseWidget {
  final DuesItem jobCash;
  final Function onChangeStatus;
  final bool isActiv;
  CollectCashItemWidget(
      {Key? key,
      required this.jobCash,
      required this.onChangeStatus,
      this.isActiv = false})
      : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    Color statusColor = kOrange;
    if (jobCash.statusCode == CollectDuesStatus.pending.index) {
      statusColor = kOrange;
    } else if (jobCash.statusCode == CollectDuesStatus.paid.index) {
      statusColor = kGreen_A6;
    } else if (jobCash.statusCode == CollectDuesStatus.rejected.index) {
      statusColor = Colors.redAccent;
    } else if (jobCash.statusCode == CollectDuesStatus.dues.index) {
      statusColor = kYellow2;
    }
    return Card(
      elevation: 4,
      shadowColor: kGrey_D6,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 4,
              decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(12),
                      bottomStart: Radius.circular(12))),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, top: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MaterialText(
                          jobCash.amount.toString().addCurrency(context),
                          style: kTextBold,
                          mathWidth: true,
                          endIcon: MaterialText(
                            jobCash.workingDate.toString(),
                            style: kTextLabel.copyWith(fontSize: 12),
                          ),
                        ),
                        Text(
                          '${jobCash.jobName.toString()} - '
                          '${jobCash.projectName.toString()}',
                          style: kTextMedium.copyWith(color: kGreyishBrown,fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        MaterialText(jobCash.totalShiftHourse.toString()
                          +'${strings.hour} '
                          ' ${strings.and}'
                          ' ${jobCash.totalShiftMinutes}'
                          ' ${strings.minute}',
                        style: kTextRegular,
                        startIcon: SvgPicture.asset(Assets.shiftappImagesTimer,),),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        Row(
                          children: [
                            circleIcon(statusColor),
                            Expanded(
                              child: Text(
                                jobCash.statusName.toString(),
                                style: kTextMedium.copyWith(
                                  fontSize: 14,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget circleIcon(Color color, {double? size}) {
  return Container(
    width: size ?? 20,
    height: size ?? 10,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}
