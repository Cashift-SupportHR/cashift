import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../decorations/decorations.dart';

///  Created by harbey on 5/21/2023.
class ActiveStepperWidget extends StatelessWidget {
  final String activeImage;
  final Color? color;

  const ActiveStepperWidget({Key? key, required this.activeImage, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: Decorations.boxDecorationBorderShape(
          color: kWhite, borderColor: color ?? kOrange_09, borderWidth: 0.5),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(1),
        decoration: Decorations.boxDecorationBorderShape(
            color: kWhite, borderColor: color ?? kOrange_09, borderWidth: 0.5),
        child: Image.network(
          activeImage,
          color: color ?? kOrange_09,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.image_not_supported, color: color ?? kGrey_EB, size: 25),
        ),
      ),
    );
  }
}
