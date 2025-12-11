import '../../../../../core/services/routes.dart' show Routes;
import '../../../../../utils/app_icons.dart';
import '../../../../shared/components/index.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class ManaOrderCart extends BaseStatelessWidget {
  ManaOrderCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: Decorations.boxDecorationBorder(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          SizedBox(height: 10),
          detailsOrder(),
          SizedBox(height: 10),
          ReceiptODelivery(
            title: strings.receive_from,
            value: strings.warehouse,
            details: "مسافة 10 كم - ساعة ",
          ),
          ReceiptODelivery(
            title: strings.deliver_to,
            value: strings.customer,
            details: "مسافة 10 كم - ساعة ",
            width: 33,
          ),
          SizedBox(height: 10),
          buildApplyButton(context),
        ],
      ),
    );
  }

  Row header() {
    return Row(
      children: [
        kBuildImage('', size: 30),
        SizedBox(width: 5),
        Text(
          "توصيل طلب - شركة مانا",
          style: kTextMedium.copyWith(color: kFontDark, fontSize: 14),
        ),
        SizedBox(width: 25),
        Container(
          decoration: Decorations.decorationOnlyRadius(
            radius: 15,
            color: kRed_EE,
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "محجوزة",
              style: kTextMedium.copyWith(color: kRed_00, fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }

  Row detailsOrder() {
    return Row(
      children: [
        kSvgIcon(image: AppIcons.details_order, size: 20),
        SizedBox(width: 5),
        Text(
          "${strings.details_order} :   ",
          style: kTextRegular.copyWith(color: kGreen_85, fontSize: 14),
        ),
        Text("20 كرتونه - 330 ملل", style: kTextRegular.copyWith(fontSize: 14)),
      ],
    );
  }

  Row ReceiptODelivery({
    required String title,
    required String value,
    required String details,
    double? width,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        kSvgIcon(image: AppIcons.locationOnOutline, size: 25),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${title} :   ",
                  style: kTextRegular.copyWith(color: kPrimary, fontSize: 14),
                ),

                Text(value, style: kTextRegular.copyWith(fontSize: 14)),
              ],
            ),
            Text(details, style: kTextRegular.copyWith(fontSize: 12)),
            SizedBox(height: 10),
          ],
        ),
        SizedBox(width: width ?? 15),

        kSvgIcon(image: AppIcons.location_map),
        SizedBox(width: 5),
        Text(
          strings.open_map,
          style: kTextBold.copyWith(fontSize: 12, color: kOrange00),
        ),
      ],
    );
  }

  Row buttonText(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(strings.apply_now, style: kButtonTextStyle),
        SizedBox(width: 10),
        Text(
          "150  ${strings.sar}",
          style: kTextBold.copyWith(fontSize: 14, color: kOrange47),
        ),
      ],
    );
  }

  Widget buildApplyButton(
    BuildContext context, {
    bool isLastButtonAlignment = true,
    double? sizeIcon,
  }) {
    return SizedBox(
      width: 270,
      child: Row(
        children: [
          Expanded(
            child: AppCupertinoButton(
              child: buttonText(context),
              padding: const EdgeInsets.all(5),
              radius: BorderRadius.circular(10),
              onPressed: () {
                Navigator.pushNamed(context, Routes.mainManaDeliverPage);

                // onClickApply!();
              },
              height: 38,
            ),
          ),
          const SizedBox(width: 5),
          favoriteIcon(sizeIcon: sizeIcon),
          const SizedBox(width: 5),

          shareIconButton(sizeIcon: sizeIcon),
        ],
      ),
    );
  }

  Widget shareIconButton({double? sizeIcon}) {
    return SizedBox(
      height: sizeIcon ?? 35,
      width: sizeIcon ?? 40,
      child: AppOutlineButton(
        onClick: () {
          // onClickShare(jobOffer.id.toString());
        },
        borderWidth: 0.8,
        radius: 10,
        child: Image.asset(
          'images/share.png',
          color: kPrimary,
          colorBlendMode: BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget favoriteIcon({double? sizeIcon}) {
    return SizedBox(
      height: sizeIcon ?? 35,
      width: sizeIcon ?? 40,
      child: AppOutlineButton(
        onClick: () {},
        borderWidth: 0.8,
        radius: 10,
        child: Image.asset(
          // jobOffer.isFavorite() == true
          //     ? 'images/heart_fill.png'
          //     : 'images/heart.png',
          'images/heart.png',
          color: kPrimary,
          colorBlendMode: BlendMode.srcIn,
        ),
      ),
    );
  }
}
