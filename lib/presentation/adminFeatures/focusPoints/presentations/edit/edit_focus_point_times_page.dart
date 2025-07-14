import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/add_focus_point/pages/focus_point_times/base_focus_point_times_page.dart';

import '../../../../../common/components/stepper/easy_step.dart';
import '../../domain/entities/focus_point.dart';

class EditFocusPointTimesPage extends BaseFocusPointTimesPage {

  @override
  String? title(BuildContext context) {
    return strings.edit_focus_point_times;
  }

  @override
  void loadInitialData(BuildContext context) {
    final focusPoint = getArguments<FocusPoint>(context);
    //Todo remove static value
    bloc.loadFocusPointTimes(focusPointId: focusPoint?.id!,projectId: focusPoint?.projectId??0);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }

  @override
  int initFocusPointId(context) {
   return getArguments<FocusPoint>(context)!.id!;
  }
}
