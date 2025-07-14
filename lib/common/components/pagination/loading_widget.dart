
import 'package:flutter/material.dart';

import '../../../presentation/presentationUser/resources/colors.dart';


class LoadingWidget extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  const LoadingWidget({Key? key, this.size, this.strokeWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size,
      width: size,
      padding: const EdgeInsets.all(10),
      child: CircularProgressIndicator(strokeWidth: strokeWidth ?? 4),);
  }
}

class SmallLoading extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  final double? padding;
  final Color? color;

  const SmallLoading({Key? key, this.size, this.strokeWidth, this.padding, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // alignment: Alignment.topRight,
      height: size ?? 20,
      width: size ?? 20,
      padding: EdgeInsets.all(padding ?? 0.0),
      child: CircularProgressIndicator(strokeWidth: strokeWidth ?? 2, color: color ??  kPrimary),);
  }
}
