import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../shared/components/index.dart';
import '../../../../../resources/colors.dart';
import '../../../../domain/entities/index.dart';

class SelectCarItem extends BaseStatelessWidget {
 final CarLogisticsEntity data;

  SelectCarItem({super.key, required this.data});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10,   bottom: 10),
      padding: const EdgeInsets.all(5),
      decoration: Decorations.createRectangleWithColorDecoration(
        kBattleShipGrey,
        Colors.white,
        10,
      ),
      child: Row(
        children: [
          kBuildImage(data.iconKey??"", height: 50, width: 50),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.carSizeName??"",
                  style: kTextMedium.copyWith(
                    fontSize: 14,
                    color: kAlmostBlack,
                  ),
                ),
                Text(
                  data.description??"",
                  style: kTextMedium.copyWith(
                    fontSize: 13,
                    color: kBattleShipGrey,
                  ),
                ),
              ],
            ),
          ),

          Icon(Icons.arrow_forward_ios, color: kBattleShipGrey),
        ],
      ),
    );
  }
}
