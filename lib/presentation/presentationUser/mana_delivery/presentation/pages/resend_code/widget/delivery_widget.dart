import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../../utils/app_icons.dart';
import '../../../../../../../utils/app_utils.dart';
import '../../../../../../shared/components/base_stateless_widget.dart' show BaseStatelessWidget;
import '../../../../../../shared/components/decorations/decorations.dart';
import '../../../../../resources/colors.dart';
import '../../../../domain/entities/nearby_warehouses.dart';
import '../../../../domain/entities/order_mana.dart';

class DeliveryWidget extends BaseStatelessWidget {
 final OrderManaEntity data;
final NearbyWarehousesEntity nearbyWarehousesEntity;
  DeliveryWidget({super.key, required this.nearbyWarehousesEntity, required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: const EdgeInsets.all(16),
     padding: const EdgeInsets.all(16),
     decoration: Decorations.createRectangleDecoration(),
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [

         Column(
           children: [
             kSvgIcon( image: AppIcons.locationOnOutline, size: 30),

             _dashedLine(),
             kSvgIcon( image: AppIcons.locationOnOutline, size: 30),
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
                 children:   [
                   Text(
                   "${strings.receive_from} : ",
                     style: kTextMedium.copyWith(
                       color:kPrimary,
                       fontSize: 14,
                     ),
                   ),
                   SizedBox(width: 6),
                   Text(
                     nearbyWarehousesEntity.name??"",
                     style: kTextRegular.copyWith(
                        fontSize: 14,
                     ),
                   ),
                 ],
               ),
               const SizedBox(height: 3),

               /// المسافة والوقت
                 Text(
                   " ${strings.distance} ${nearbyWarehousesEntity.distanceKm??0} ${strings.km} ",
                 style: kTextRegular.copyWith(
                   color: kGreen_85,
                   fontSize: 13,
                 ),
               ),
               const SizedBox(height: 3),

               /// العنوان
                 Text(
                   nearbyWarehousesEntity.fullAddress??"",
                 maxLines: 1,
                 style: kTextRegular.copyWith(
                   fontSize: 14,

                 ),
               ),
               const SizedBox(height: 3),

               GestureDetector(
                 onTap: (){
                   AppUtils.openMap(
                     nearbyWarehousesEntity.latitude ?? 0.0,
                     nearbyWarehousesEntity.longitude ?? 0.0,);

                 },
                 child: Row(
                   children: [

                     kSvgIcon(image: AppIcons.location_map),
                     SizedBox(width: 5),
                     Text(
                       strings.open_map,
                       style: kTextMedium.copyWith(fontSize: 14, color: kOrange00),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 8),

               /// تسليم إلى
               Row(
                 children:   [
                   Text(
                     "${strings.deliver_to} : ",
                     style: kTextMedium.copyWith(
                       color:kPrimary.withOpacity(.3),
                       fontSize: 14,
                     ),
                   ),
                   SizedBox(width: 6),
                   Text(
                     strings.customer,
                     style: kTextRegular.copyWith(
                       fontSize: 14,
                       color: kBlack.withOpacity(.3),
                     ),
                   ),
                 ],
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
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
                  (index) => Container(
                width: 2,
                height: 6,
                color: Colors.grey.shade300,
              ),
            ),
          );
        },
      ),
    );
  }
}
