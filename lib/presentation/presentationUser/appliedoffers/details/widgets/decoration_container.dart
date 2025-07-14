import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../resources/colors.dart';
import '../../../../../common/components/underline_widget.dart';

class BackgroundContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const BackgroundContainer({Key? key, required this.title, required this.child, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: Decorations.decorationTabs,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
            child: Text(
              title,
              style: kTextSemiBold.copyWith(color: kPrimary, fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: const UnderlineWidget(
              height: 1,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          child,
        ],
      ),
    );
  }
}
