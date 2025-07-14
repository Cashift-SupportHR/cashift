import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../decorations/decorations.dart';

///  Created by harbey on 5/21/2023.
class InActiveStepperWidget extends StatelessWidget {
  final String inActiveImage;
  final Color? color;
  const InActiveStepperWidget({Key? key, required this.inActiveImage, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 9, start: 10, end: 9, bottom: 10),
      decoration: Decorations.boxDecorationBorderShape(
          color: kBackground,
          borderColor: color ?? kGrey_CD,
          borderWidth: 0.5
      ),
      child: Image.network(
        inActiveImage,
        color: color ?? kGrey_D0,
        errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported, color: color ?? kGrey_EB, size: 25),
      ),
    );
  }
}
