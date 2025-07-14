import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';

class RoundedShape extends StatelessWidget {
  final Widget child;

  final Color? color;

  final double? height;

  final double? width;

  final double? radius;

  const RoundedShape(
      {Key? key,
      this.color,
      required this.child,
      this.height,
      this.width,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: FittedBox(child: child),
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: color ?? kPrimary.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 14)),
      ),
    );
  }
}
