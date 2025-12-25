import '../../../../shared/components/index.dart';
import '../../../common/common_state.dart';
import '../../../mana_delivery/domain/entities/delivery_orde.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';
import 'mana_order_cart.dart';

class ManaOrderWidget extends BaseStatelessWidget {
  final StreamState<List<DeliveryOrderEntity>> deliveryOrdersStream;

  ManaOrderWidget({super.key,required this.deliveryOrdersStream});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          strings.offer_delivery,
          style: kTextMedium.copyWith(color: kFontDark, fontSize: 14),
        ),
        StreamStateWidgetV2 <List<DeliveryOrderEntity>>(
          stream: deliveryOrdersStream,
          builder: (context, snapshot) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                itemCount: snapshot.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ManaOrderCart(data: snapshot[index],);
                },
              ),
            );
          }
        ),
      ],
    );
  }
}
