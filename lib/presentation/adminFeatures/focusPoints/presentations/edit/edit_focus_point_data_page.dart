import '../../../../../common/components/stepper/easy_step.dart';
import '../widgets/base_focus_point_data_page.dart';

class EditFocusPointDataPage extends BaseFocusPointDataPage {

  @override
  String? title(BuildContext context) {
    return strings.edit_focus_point_data;
  }

  @override
  void loadInitialData(BuildContext context) {
    final id = getArguments<int>(context);
    bloc.loadFocusPointData(focusPointId: id);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  void onSuccessDismissed() {
    if(isDeleteShift() == true){
      final id = getArguments<int>(context);
      bloc.loadFocusPointData(focusPointId: id);
    } else {
      Navigator.of(context).pop(true);
    }
  }

}
