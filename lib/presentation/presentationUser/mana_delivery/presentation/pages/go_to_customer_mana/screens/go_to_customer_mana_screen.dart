import '../../../../../../shared/components/index.dart';
import '../../../../../bail_requests/widgets/bail_terms_and_conditions.dart';
import '../../../../../common/common_state.dart';
import '../../../../../resources/colors.dart';
import '../../../../../resources/constants.dart';
import '../../../../domain/entities/index.dart';
import '../widget/terms_and_conditions_logistics_item.dart';

class GoToCustomerManaScreen extends BaseStatelessWidget {
  final Function() onNext;

  GoToCustomerManaScreen({Key? key, required this.onNext}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      bottomNavigationBar: RowButtons(
        textSaveButton: strings.apply_now,
        textCancelButton: strings.previous,
        onSave: () {},
        onCancel: () {},
      ),
      body: Column(),
    );
  }
}
