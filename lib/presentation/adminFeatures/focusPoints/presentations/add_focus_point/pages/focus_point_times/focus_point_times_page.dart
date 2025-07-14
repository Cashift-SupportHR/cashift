import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/adminFeatures/focusPoints/presentations/add_focus_point/pages/focus_point_times/base_focus_point_times_page.dart';

import '../../../../domain/entities/index.dart';
import '../../../../data/models/index.dart';

class FocusPointTimesPage extends BaseFocusPointTimesPage {
  final FocusPointTimesArgs Function() idCallback;
  final Function onNext;

  FocusPointTimesPage({required this.idCallback, required this.onNext});

  FocusPointTimesArgs args = FocusPointTimesArgs();
  @override
  Future<void> loadInitialData(BuildContext context) async {
    args =  idCallback();
    bloc.loadFocusPointTimes(projectId: args.projectId!);
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  void onSavePoints() {
    onNext();
  }

  @override
  int initFocusPointId(context) {
    return args.focusPointId!;
  }
}
