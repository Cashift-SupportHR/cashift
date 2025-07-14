import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UnderlineWidget extends StatelessWidget {
  final Color? color;
  final double? height;
  final double? width;
  const UnderlineWidget({Key? key, this.color, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(top: 2),
        child: SizedBox(
        height:height?? 1.h,
        width: width??22.w,
        child:  Divider(
          height: height ?? 20,
          color: color ?? const Color(0xffffbf47),
          thickness: height??1,
          endIndent: 7.w,
         // indent: 3.w,
        ),
    ),
      );
  }
}
