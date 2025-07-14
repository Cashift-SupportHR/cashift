import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../presentation/presentationUser/resources/colors.dart';
import 'index.dart';

class CurancyWidget extends BaseStatelessWidget {
  final String valuePrice;
  final TextStyle? valueStyle;

  CurancyWidget({Key? key, required this.valuePrice, this.valueStyle})
    : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 3,),
        Text(
          "${valuePrice} ",
          style:
              valueStyle ??
              kTextRegular.copyWith(
                color: kBlack.withOpacity(0.8),
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
        ),

        Text(
          "\uE900",
          style:
              fontIcon.copyWith(
                fontSize: valueStyle?.fontSize ?? 14,
                color: valueStyle?.color ?? kBlack.withOpacity(0.8),
              ),
        ),
      ],
    );
  }
}
