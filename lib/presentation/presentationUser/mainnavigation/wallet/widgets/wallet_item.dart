import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/domain/entities/collect_cash/job_cash.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_widget.dart';
import 'package:shiftapp/common/components/material_text.dart';

class WalletItemWidget extends BaseWidget {
  final JobCash jobCash;
  final Function onClickWithDraw;
  final bool isActiv;
  WalletItemWidget(
      {Key? key,
      required this.jobCash,
      required this.onClickWithDraw,
      this.isActiv = false})
      : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    Color statusColor = kGreen_A6;
    // if (jobCash.statusCode == CollectDuesStatus.pending.index) {
    //   statusColor = kOrange;
    // } else if (jobCash.statusCode == CollectDuesStatus.paid.index) {
    //   statusColor = kGreen_A6;
    // } else if (jobCash.statusCode == CollectDuesStatus.rejected.index) {
    //   statusColor = Colors.redAccent;
    // } else if (jobCash.statusCode == CollectDuesStatus.dues.index) {
    //   statusColor = kYellow2;
    // }
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
                          jobCash.money.toString().addCurrency(context),
                          style: kTextBold,
                          mathWidth: true,
                        ),
                        Text(
                          jobCash.projectName.toString(),
                          style: kTextMedium.copyWith(color: kGreyishBrown),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        Row(
                          children: [
                            Text(
                              strings.status,
                              style: kTextLabel,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            circleIcon(statusColor),
                            Expanded(
                              child: Text(
                                jobCash.statusName.toString(),
                                style: kTextMedium.copyWith(
                                  fontSize: 15,
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
                            AppCupertinoButton(
                                    text: strings.withdrawal,
                                    padding: EdgeInsets.all(8),
                                    radius: BorderRadius.circular(16),
                                    onPressed: ()  {
                                     onClickWithDraw();
                                    },
                                  ),
                        SizedBox(
                          height: 8,
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
