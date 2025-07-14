import 'package:flutter/material.dart';

import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../../common/components/decorations/decorations.dart';

class PointImage extends StatelessWidget {
  final String image;
  final EdgeInsetsGeometry? margin;
  final double? size;
  final Color? color;
  const PointImage({Key? key, required this.image, this.margin, this.size, this.color = kPrimary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 50,
      width: size ?? 50,
      decoration: Decorations.boxDecorationBorder(borderWidth: 1.2, borderColor: color, radius: 6),
      padding: const EdgeInsets.all(2),
      margin: margin ?? const EdgeInsetsDirectional.only(start: 15, top: 5),
      child: Container(
        decoration: Decorations.boxDecorationBorder(borderColor: color, radius: 4),
        child: Image.network(
          image,
          color: color,
          width: size ?? 50,
          height: size ?? 50,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.image_not_supported,
              color: color,
              size: 20,
            );
          },
        ),
      ),
    );
  }
}
