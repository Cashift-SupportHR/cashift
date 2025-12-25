import '../../../../../../../utils/app_icons.dart';
import '../../../../../../../utils/app_utils.dart';
import '../../../../../../shared/components/index.dart';
import '../../../../../common/common_state.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../data/models/accept_terms_prams.dart';
import '../../../../domain/entities/delivery_orde.dart';
import '../cubit/details_order_mana_state.dart';
import '../widget/terms_widget.dart';

class DetailsOrderManaScreen extends BaseStatelessWidget {
  final Function(AcceptTermsPrams prams) onNext;
  DeliveryOrderEntity deliveryOrderEntity;
  final DetailsOrderManaState state;

  DetailsOrderManaScreen({
    Key? key,
    required this.state,
    required this.onNext,
    required this.deliveryOrderEntity,
  }) : super(key: key);
  StreamState<bool> isApprovalStream = StreamStateInitial();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<bool>(
          stream: isApprovalStream.stream,
          builder: (context, snapshot) {
            return AppCupertinoButton(
              onPressed: () {
                if (snapshot.data == true) {
                  onNext(AcceptTermsPrams(orderId: deliveryOrderEntity.id));
                } else {
                  showErrorDialog(strings.please_accept_terms, context);
                }
              },
              text: strings.receive_from_warehouse,
              elevation: 0,
              backgroundColor: kPrimary,
              radius: BorderRadius.circular(5),
              padding: const EdgeInsets.symmetric(vertical: 11),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            orderDetails(),
            SizedBox(height: 20),
            TermsManaWidget(
              isApprovalStream: isApprovalStream,
              data: state.termsManaEntity,
            ),
          ],
        ),
      ),
    );
  }

  orderDetails() {
    return Container(
      decoration: Decorations.createRectangleDecoration(),
      padding: const EdgeInsets.all(7),
      child: Column(
        children: [
          header(),
          SizedBox(height: 7),
          ItemValue(
            title: strings.details_order,
            value: " 20 كرتونه - 330 ملل",
            icon: AppIcons.details_order,
          ),
          ItemValue(
            title: strings.receive_from,
            value: deliveryOrderEntity.receiveFrom ?? "",
            icon: AppIcons.locationOnOutline,
            color: kPrimary,
          ),
          ItemValue(
            title: strings.deliver_to,
            value: strings.customer,
            icon: AppIcons.locationOnOutline,
            color: kPrimary,
          ),
          DetailsDeliver(),
          ItemValue(
            title: strings.basic_service_fee,
            value: "${state.orderManaEntity.baseServicePrice} ${strings.sar}",
            icon: AppIcons.receipt,
          ),
          ItemValue(
            title: strings.floor_price,
            value: "${state.orderManaEntity.floorPrice}  ${strings.sar}",
            icon: AppIcons.receiptAdd,
          ),
          nots(),

          ItemValue(
            title: strings.final_price,
            value: "${state.orderManaEntity.totalPrice}  ${strings.sar}",
            icon: AppIcons.receiptEdit,
          ),
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

  Padding DetailsDeliver() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            "${strings.distance} ${deliveryOrderEntity.distanceKm} ${strings.km} ",
            style: kTextRegular.copyWith(fontSize: 12),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              AppUtils.openMap(
                deliveryOrderEntity.latitude ?? 0.0,
                deliveryOrderEntity.longitude ?? 0.0,
              );
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
      ),
    );
  }

  Row header() {
    return Row(
      children: [
        kSvgIcon(image: AppIcons.mana),
        SizedBox(width: 5),
        Text(
          strings.delivery_order_for_company,
          style: kTextMedium.copyWith(color: kFontDark, fontSize: 14),
        ),
        SizedBox(width: 25),
      ],
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
}
