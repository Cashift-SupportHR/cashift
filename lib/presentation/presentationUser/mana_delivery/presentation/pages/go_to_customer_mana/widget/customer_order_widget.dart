import 'package:shiftapp/utils/app_utils.dart';

import '../../../../../../../utils/app_icons.dart';
import '../../../../../../shared/components/base_stateless_widget.dart'
    show BaseStatelessWidget;
import '../../../../../../shared/components/index.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';

class CustomerOrderWidget extends BaseStatelessWidget {
  CustomerOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.createRectangleDecoration(),
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          header(),
          SizedBox(height: 7),
          ItemValue(
            title: strings.expected_arrival_time,
            value: "08:00 PM - 09:00PM",
            icon: AppIcons.time8,
          ),

          ItemValue(
            title: strings.basic_service_fee,
            value: "100 ${strings.sar}",
            icon: AppIcons.receipt,
          ),
          ItemValue(
            title: strings.floor_price,
            value: "150 ${strings.sar}",
            icon: AppIcons.receiptAdd,
          ),
          nots(),

          ItemValue(
            title: strings.final_price,
            value: "250 ${strings.sar}",
            icon: AppIcons.receiptEdit,
          ),
        ],
      ),
    );
  }

  Padding ItemValue({
    required String title,
    required String value,
    required String icon,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        children: [
          kSvgIcon(image: icon, size: 20),
          SizedBox(width: 5),
          Text(
            "${title} :   ",
            style: kTextRegular.copyWith(
              color: color ?? kGreen_85,
              fontSize: 14,
            ),
          ),
          Text("$value", style: kTextRegular.copyWith(fontSize: 14)),
        ],
      ),
    );
  }

  Container nots() {
    return Container(
      decoration: Decorations.decorationOnlyRadius(color: kGreen_EF, radius: 5),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.error, size: 25, color: kPrimary),
          SizedBox(width: 7),
          Expanded(
            child: Text(
              "العميل في الطابق الثاني وسعر الطابق يزيد كلما علي الطابق.",
              style: kTextRegular.copyWith(color: kPrimary, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Row header() {
    return Row(
      children: [
        kBuildImage('', size: 40),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ahmed ahmed",
              style: kTextMedium.copyWith(color: kFontDark, fontSize: 14),
            ),
            Text(
              strings.customer,
              style: kTextRegular.copyWith(fontSize: 12, color: kGreen_85),
            ),
          ],
        ),
        SizedBox(width: 25),
        InkWell(
          onTap: () {
            AppUtils.launchPhone(phone: "01152344879");
          },
          child: kSvgIcon(image: AppIcons.call, size: 50),
        ),
        InkWell(
            onTap: () {

            },
            child: kSvgIcon(image: AppIcons.chat)),
      ],
    );
  }
}
