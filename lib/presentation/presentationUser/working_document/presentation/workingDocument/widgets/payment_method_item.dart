import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../../common/components/decorations/decorations.dart';


///  Created by harbey on 7/4/2023.

class PaymentMethodItem extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  final Function() onTap;

  const PaymentMethodItem({Key? key, required this.icon, required this.title, required this.onTap, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 16),
      decoration: Decorations.boxDecorationBorder(borderColor: kGray_86, radius: 8, color: kBackground),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onTap: onTap,
         leading: kBuildImage(
          icon,
           border: 0,
           size: 50,
         ),
        minLeadingWidth: 30,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        title: Text(
          title,
          style: kTextMedium.copyWith(fontSize: 15, color: kBlack_33),
        ),
        subtitle: Text(
          subTitle,
          style: kTextRegular.copyWith(fontSize: 12, color: kGray_64),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: kBlack_33,
          size: 16,
        ),
      ),
    );
  }
}
