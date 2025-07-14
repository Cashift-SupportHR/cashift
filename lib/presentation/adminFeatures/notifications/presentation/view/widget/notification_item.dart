import 'package:flutter_svg/svg.dart';
import 'package:shiftapp/common/domain/constants/codes_constants.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../../core/services/routes.dart';
import '../../../domain/entities/vehicle_notifications.dart';

class VehicleNotificationItem extends BaseStatelessWidget {
  final String code;
  final VehicleNotification item;
  final Function() onAction;

  //
  VehicleNotificationItem({
    Key? key,
    required this.code,
    required this.item,
    required this.onAction,
  }) : super(key: key);

  TextStyle titleStyle = kTextMedium.copyWith(color: kPrimary, fontSize: 14);
  TextStyle valueStyle = kTextMedium.copyWith(color: kBlack, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: Decorations.decorationTabs,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppIcons.notification, width: 40, height: 50),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.notifyType ?? "",
                  style: kTextMedium.copyWith(fontSize: 16, color: kBlack),
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 90,
                  child: Text(
                    item.description ?? "",
                    style: kTextRegular.copyWith(
                      fontSize: 14,
                      color: kBlack,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 15,
                      color: kGray_64,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      item.notifyDate ?? "",
                      style:
                      kTextRegular.copyWith(fontSize: 12, color: kGray_64),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      item.notifyTime ?? "",
                      style:
                      kTextRegular.copyWith(fontSize: 12, color: kGray_64),
                    ),
                  ],
                ),
                if (item.action != null) actionTake(),
                if (code == CodesConstants.reviewed && item.finalAction != null)
                  responsibleResponse(),
                if (code != CodesConstants.reviewed) buildActionButton(context),
              ],
            )
          ],
        ));
  }

  Padding buildIconText(
      {required String icon, required String title, Color? colorText}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: IconText(
        icon: icon,
        text: title + ' :',
        textStyle: titleStyle,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  TextValue buildTextValue({required String title, required String value}) {
    return TextValue(
      text: title,
      value: value,
      textStyle: titleStyle,
      valueStyle: valueStyle,
      isExpanded: false,
    );
  }

  Container responsibleResponse() {
    return Container(
     width: 270,
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: Decorations.decorationOnlyRadius(
        radius: 4,
        color: kOrange_29,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kLoadSvgInCirclePath(
            AppIcons.responsible_response,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  strings.responsible_response,
                  style: kTextRegular.copyWith(
                      fontSize: 14, color: kOrange00),
                ),
                SizedBox(height: 10),
                Text(
                  item.finalAction ?? '',
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style:
                  kTextRegular.copyWith(fontSize: 12, color: kBlack_3C),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container actionTake() {
    return Container(
      width: 270,
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: Decorations.decorationOnlyRadius(
        radius: 4,
        color: kPrimary.withOpacity(.1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${strings.action_taken} :",
            style: kTextRegular.copyWith(fontSize: 12, color: kPrimary),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              item.action ?? '',
              overflow: TextOverflow.visible,
              style: kTextRegular.copyWith(fontSize: 12, color: kBlack_3C),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildActionButton(BuildContext context) {
    return SizedBox(
      height: 53,
      child: AppCupertinoButton(
        onPressed: onAction,
        textStyle: kTextMedium.copyWith(color: Colors.white, fontSize: 12),
        text: code == CodesConstants.waitingReviewV2 || code == ""
            ? strings.take_action
            : strings.final_action,
        margin: EdgeInsets.only(top: 15),
        radius: BorderRadius.circular(5),
      ),
    );
  }
}
