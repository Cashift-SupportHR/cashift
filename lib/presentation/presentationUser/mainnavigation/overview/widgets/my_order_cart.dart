import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/services/routes.dart' show Routes;
import '../../../../../utils/app_icons.dart';
import '../../../../../utils/app_images.dart';
import '../../../../shared/components/index.dart';
import '../../../mana_delivery/domain/entities/delivery_orde.dart';
import '../../../mana_delivery/domain/entities/my_order.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

class MyOrderCart extends BaseStatelessWidget {
  final MyOrderItemEntity data;
  final VoidCallback onRefresh;

  MyOrderCart({required this.data, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 300,
      margin: const EdgeInsetsDirectional.fromSTEB(0, 10, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kPrimary),
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
            statusWidget(data.statusName ?? "", data.statusName ?? ""),
            const SizedBox(height: 10),
            titleWidget(),
            const SizedBox(height: 10),
            detailsOrder(data.orderDetails ?? " "),
            const SizedBox(height: 5),
            stepperWidget(data.progressSteps),
     if(data.status != 8)   ...[
          const SizedBox(height: 10),
          AppCupertinoButton(
            onPressed: () {
              final entity = DeliveryOrderEntity(
                id: data.id,
                status: data.status,
                orderNumber: data.orderNumber,
                customerAddress: data.customerAddress,
                cityName: data.cityName,
                districtName: data.districtName,
                latitude: data.latitude,
                longitude: data.longitude,
                totalPrice: data.totalPrice,
                orderDetails: data.orderDetails,
                statusName: data.statusName,
              );
              Navigator.pushNamed(
                context,
                Routes.mainManaDeliverPage,
                arguments: {
                  'entity': entity,
                  'initialPage': data.key == 'waitwarhousecode' ? 2 : 3,
                  'myOrderItem': data
                },
              ).then((value) {
                if (value == true) {
                  onRefresh();
                }
              });
            },
            text: data.key == 'waitwarhousecode'
                ? strings.enter_warehouse_code
                : strings.go_to_customer,
            elevation: 0,
            backgroundColor: kPrimary,
            radius: BorderRadius.circular(5),
            padding: const EdgeInsets.symmetric(vertical: 11),
          ),
        ]   ,
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget statusWidget(String status, String name) {
    return Container(
      height: 30,
      width: 180,
      color: status == "pending"
          ? kYellow.withOpacity(.1)
          : status == "accepted"
              ? kGreen.withOpacity(.1)
              : kRed_EE,
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: status == "pending"
                ? kYellow
                : status == "accepted"
                    ? kGreen
                    : kRed_00,
          ),
          const SizedBox(width: 5),
          Text(
            name,
            style: kTextMedium.copyWith(
              color: status == "pending"
                  ? kYellow
                  : status == "accepted"
                      ? kGreen
                      : kRed_00,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget titleWidget() {
    return Row(
      children: [
        kSvgIcon(image: AppIcons.mana),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            strings.delivery_order_for_company,
            style: kTextMedium.copyWith(color: kFontDark, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget detailsOrder(String details) {
    return Row(
      children: [
        kSvgIcon(image: AppIcons.details_order, size: 20),
        const SizedBox(width: 5),
        Text(
          "${strings.details_order} :   ",
          style: kTextMedium.copyWith(color: kGreen_85, fontSize: 14),
        ),
        Text(details, style: kTextRegular.copyWith(fontSize: 14)),
      ],
    );
  }

  Widget stepperWidget(List<MyOrderProgressStepEntity>? steps) {
    if (steps == null || steps.isEmpty) return const SizedBox();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < steps.length; i++) ...[
          customStepper(
            (steps[i].isDone ?? false) ? kPrimary : kGrey_D9,
            _getStepIcon(steps[i].step ?? 1),
            steps[i].title ?? "",
          ),
          if (i < steps.length - 1)
            Container(
              height: 2,
              width: 40,
              color: (steps[i + 1].isDone ?? false) ? kPrimary : kGrey_D9,
              margin: const EdgeInsets.only(top: 25),
            ),
        ]
      ],
    );
  }

  String _getStepIcon(int step) {
    switch (step) {
      case 1:
        return AppIcons.ma1;
      case 2:
        return AppIcons.ma2;
      case 3:
        return AppIcons.ma3;
      default:
        return AppIcons.ma1;
    }
  }

  Widget customStepper(Color color, String icon, String title) {
    return SizedBox(
      width: 60,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(icon, color: Colors.white),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: kTextRegular.copyWith(color: color, fontSize: 10),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
