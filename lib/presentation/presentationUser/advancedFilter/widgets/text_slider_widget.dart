import 'package:flutter/cupertino.dart';

import '../../../../common/components/curancy_widget.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';

class TextSliderWidget extends StatelessWidget {
  final String minimum;
  final String maximum;

  const TextSliderWidget({
    Key? key,
    required this.minimum,
    required this.maximum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CurancyWidget(
          valuePrice: minimum,
          valueStyle: kTextSemiBold.copyWith(
            color: kBattleShipGrey2,
            fontSize: 16,
          ),
        ),
        CurancyWidget(
          valuePrice: maximum,
          valueStyle: kTextSemiBold.copyWith(
            color: kBattleShipGrey2,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
