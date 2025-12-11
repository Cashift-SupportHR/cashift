import '../../../../shared/components/index.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import 'mana_order_cart.dart';

class ManaOrderWidget extends BaseStatelessWidget {
  ManaOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "فرص التوصيل",
          style: kTextMedium.copyWith(color: kFontDark, fontSize: 14),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ManaOrderCart();
            },
          ),
        ),
      ],
    );
  }
}
