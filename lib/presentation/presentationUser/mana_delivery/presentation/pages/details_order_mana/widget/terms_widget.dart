 import '../../../../../../../utils/app_icons.dart';
import '../../../../../../shared/components/index.dart';
import '../../../../../bail_requests/widgets/bail_terms_and_conditions.dart';
import '../../../../../common/common_state.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../domain/entities/index.dart';

class TermsManaWidget extends BaseStatelessWidget {
  StreamState<bool> isApprovalStream;
 final List<TermsManaEntity> data;
  TermsManaWidget({super.key,required this.isApprovalStream,required this.data});



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.createRectangleDecoration(),
      padding: const EdgeInsets.all(7),
      child: Column(
        children: [
          Row(
            children: [
              kSvgIcon(image: AppIcons.note,size: 30),
              SizedBox(width: 10),
              Text(
                strings.terms_and_conditions,
                style: kTextBold.copyWith(fontSize: 14, color: kPrimary),
              ),
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: List.generate(
              data.length,
                  (index) => Row(
                children: [
                  Container(color: kBattleShipGrey, height: 3, width: 3),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      data[index].content??"", style: kTextRegular.copyWith(
                        fontSize: 13,
                        color: kBattleShipGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TermsAndConditionsCheckBox(
            onChecked: (value) {
              isApprovalStream.setData(value);
            },
          ),
        ],
      ),
    );
  }
}
