import '../../../../../common/components/stepper/easy_step.dart';
import '../add_focus_point/pages/covenant_received/base_covenant_received_page.dart';

class EditCovenantReceivedPage extends BaseCovenantReceivedPage {

  @override
  String? title(BuildContext context) {
    return strings.edit_covenant_received;
  }

  @override
  void loadInitialData(BuildContext context) {
    final focusPointId = getArguments(context);
    bloc.fetchCovenantTypes(focusPointId: focusPointId);
  }
  @override
  int initFocusPointId(context) {
    return getArguments<int>(context)!;
  }
  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  void onSave() {}
}
