import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../shared/components/index.dart';
import '../../../../../resources/colors.dart';
import '../../../../domain/entities/index.dart';

class TermsAndConditionsLogisticsItem extends BaseStatelessWidget {
  final CarTermsAndConditionsEntity data;

  TermsAndConditionsLogisticsItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(color: kBattleShipGrey, height: 1, width: 5),
        SizedBox(width: 10),
        Text(
          data.title ?? "",
          style: kTextRegular.copyWith(fontSize: 13, color: kBattleShipGrey),
        ),
      ],
    );
  }
}
