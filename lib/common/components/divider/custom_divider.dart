import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';

///  Created by harbey on 5/8/2023.
class CustomDivider extends StatelessWidget {
  final Color? color;
  final double? thickness;
  final double? endIndent;
  final double? height;
  const CustomDivider({Key? key, this.endIndent, this.color, this.thickness, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 0, top: 14),
      child: Divider(
        color: color ?? kGrey_DF,
        thickness: thickness ?? 1,
        endIndent: endIndent ?? 18,

        height: height ?? 1,
      ),
    );
  }
}
