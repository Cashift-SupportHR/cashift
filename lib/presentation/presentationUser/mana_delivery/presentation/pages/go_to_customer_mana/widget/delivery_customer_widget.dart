import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../../utils/app_icons.dart';
import '../../../../../../../utils/app_utils.dart';
import '../../../../../../shared/components/base_stateless_widget.dart'
    show BaseStatelessWidget;
import '../../../../../../shared/components/decorations/decorations.dart';
import '../../../../../resources/colors.dart';
import '../../../../domain/entities/index.dart';

class DeliveryCustomerWidget extends BaseStatelessWidget {
  final OrderManaEntity data;
  DeliveryOrderEntity deliveryOrderEntity;
  final NearbyWarehousesEntity nearbyWarehousesEntity;
  DeliveryCustomerWidget({
    super.key,
    required this.data,
    required this.deliveryOrderEntity,
    required this.nearbyWarehousesEntity,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      decoration: Decorations.createRectangleDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              kSvgIcon(image: AppIcons.locationOnOutline, size: 20),

              _dashedLine(),
              kSvgIcon(image: AppIcons.locationOnOutline, size: 20),
            ],
          ),
          const SizedBox(width: 8),

          /// المحتوى
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// استلام من
                Row(
                  children: [
                    Text(
                      "${strings.receive_from} : ",
                      style: kTextMedium.copyWith(
                        color: kPrimary.withOpacity(.3),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      nearbyWarehousesEntity.name ?? "",
                      style: kTextRegular.copyWith(
                        fontSize: 14,
                        color: kBlack.withOpacity(.3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// تسليم إلى
                Row(
                  children: [
                    Text(
                      "${strings.deliver_to} : ",
                      style: kTextMedium.copyWith(
                        color: kPrimary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      strings.customer,
                      style: kTextRegular.copyWith(fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 3),

                /// المسافة والوقت
                Text(
                  " ${strings.distance} ${deliveryOrderEntity.distanceKm ?? 0} ${strings.km} ",
                  style: kTextRegular.copyWith(color: kGreen_85, fontSize: 11),
                ),
                const SizedBox(height: 3),

                /// العنوان
                Text(
                  data.customerAddress ?? "",
                  style: kTextRegular.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 6),

                GestureDetector(
                  onTap: () {
                    AppUtils.openMap(
                      data.latitude ?? 0.0,
                      data.longitude ?? 0.0,
                    );
                  },
                  child: Row(
                    children: [
                      kSvgIcon(image: AppIcons.location_map),
                      SizedBox(width: 5),
                      Text(
                        strings.open_map,
                        style: kTextBold.copyWith(
                          fontSize: 14,
                          color: kOrange00,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _dashedLine() {
    return Container(
      width: 2,
      height: 12,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
              (index) =>
                  Container(width: 2, height: 2, color: Colors.grey.shade300),
            ),
          );
        },
      ),
    );
  }
}
