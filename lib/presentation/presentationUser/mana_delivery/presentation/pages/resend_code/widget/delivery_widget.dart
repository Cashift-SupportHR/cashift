import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../../utils/app_icons.dart';
import '../../../../../../shared/components/base_stateless_widget.dart' show BaseStatelessWidget;
import '../../../../../../shared/components/decorations/decorations.dart';
import '../../../../../resources/colors.dart';

class DeliveryWidget extends BaseStatelessWidget {

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
                     'مستودع الرياض',
                     style: kTextRegular.copyWith(
                        fontSize: 14,
                     ),
                   ),
                 ],
               ),
               const SizedBox(height: 3),

               /// المسافة والوقت
                 Text(
                 'مسافة 10 كم - ساعة',
                 style: kTextRegular.copyWith(
                   color: kGreen_85,
                   fontSize: 11,
                 ),
               ),
               const SizedBox(height: 3),

               /// العنوان
                 Text(
                 'الرياض المربع شارع 40c امام شركة نجد الدور الثاني',
                 style: kTextRegular.copyWith(
                   fontSize: 12,
                 ),
               ),
               const SizedBox(height: 3),

               GestureDetector(
                 onTap: (){},
                 child: Row(
                   children: [

                     kSvgIcon(image: AppIcons.location_map),
                     SizedBox(width: 5),
                     Text(
                       strings.open_map,
                       style: kTextBold.copyWith(fontSize: 14, color: kOrange00),
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
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              8,
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
