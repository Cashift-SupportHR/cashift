import '../../../../../core/services/routes.dart' show Routes;
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../../utils/app_utils.dart';
import '../../../../shared/components/index.dart';
import '../../../mana_delivery/domain/entities/index.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class ManaOrderCart extends BaseStatelessWidget {
  DeliveryOrderEntity data;

  ManaOrderCart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,

      margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 10, 10),
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color:kPrimary ),

        image: DecorationImage(
          image: AssetImage(AppImages.bgMana),
          fit: BoxFit.cover,
        ),
      ),
      

      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            header(context),
            SizedBox(height: 10),
            detailsOrder(),
            SizedBox(height: 10),
            ReceiptODelivery(
              title: strings.receive_from,
              value: data.receiveFrom ?? "",
              details: "",
              isShowMap: false,
              onTap: () {},
            ),
            ReceiptODelivery(
              title: strings.deliver_to,
              value: strings.customer,
              details: "${strings.distance} ${data.distanceKm} ${strings.km} ",
              width: 33,
              isShowMap: true,
              onTap: () {
                AppUtils.openMap(data.latitude ?? 0.0, data.longitude ?? 0.0);
              },
            ),
            SizedBox(height: 10),
            buildApplyButton(context),
          ],
        ),
      ),
    );
  }

  SizedBox header(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/1.4,
      child: Row(
        children: [
          kSvgIcon(image: AppIcons.mana),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              strings.delivery_order_for_company,
              style: kTextMedium.copyWith(color: kFontDark, fontSize: 14),
            ),
          ),

          Container(
            decoration: Decorations.decorationOnlyRadius(
              radius: 15,
              color: data.status==1?kGreen_EF:kRed_EE,
            ),

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.statusName??"",
                style: kTextMedium.copyWith(color:  data.status==1?kPrimary:kRed_00, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row detailsOrder() {
    return Row(
      children: [
        kSvgIcon(image: AppIcons.details_order, size: 20),
        SizedBox(width: 5),
        Text(
          "${strings.details_order} :   ",
          style: kTextMedium.copyWith(color: kGreen_85, fontSize: 14),
        ),
        Text(data.orderDetails??"", style: kTextRegular.copyWith(fontSize: 14)),
      ],
    );
  }

  Row ReceiptODelivery({
    required String title,
    required String value,
    required String details,
    double? width,
    required Function()? onTap,
    required bool isShowMap,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        kSvgIcon(image: AppIcons.locationOnOutline, size: 20),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${title} :   ",
                  style: kTextMedium.copyWith(color: kPrimary, fontSize: 14),
                ),

                Text(value, style: kTextRegular.copyWith(fontSize: 13)),
              ],
            ),
            if (isShowMap == true)
              Text(details, style: kTextRegular.copyWith(fontSize: 11)),
            SizedBox(height: 10),
          ],
        ),
        SizedBox(width: width ?? 15),

        if (isShowMap == true)
          InkWell(
            onTap: () {
              onTap!();
            },
            child: Row(
              children: [
                kSvgIcon(image: AppIcons.location_map),
                SizedBox(width: 5),
                Text(
                  strings.open_map,
                  style: kTextBold.copyWith(fontSize: 12, color: kOrange00),
                ),
              ],
            ),
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
          "${data.totalPrice}  ${strings.sar}",
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

     width: MediaQuery.of(context).size.width/1.4,
      child: AppCupertinoButton(

        child: buttonText(context),
        padding: const EdgeInsets.all(5),
        radius: BorderRadius.circular(10),
        onPressed: () {
          Navigator.pushNamed(context, Routes.mainManaDeliverPage, arguments: data);

          // onClickApply!();
        },
        // height: 38,
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

          'images/heart.png',
          color: kPrimary,
          colorBlendMode: BlendMode.srcIn,
        ),
      ),
    );
  }
}
