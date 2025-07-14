import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';

///  Created by harbey on 5/8/2023.
class DividerVertical extends StatelessWidget {
  final double? space;
  final Color? color;
  final double? width;
  final double? height;
  const DividerVertical({Key? key, this.space, this.color, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width ?? 1.2,
      height: height ?? 16,
      margin: EdgeInsets.symmetric(horizontal: space ?? 12),
      decoration: BoxDecoration(
          color: color ?? kBlack,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
