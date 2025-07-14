import 'package:flutter/material.dart';

import '../../../../common/components/base/base_widget_bloc.dart';
import '../../common/common_state.dart';
import '../bloc/absencenotice_cubit.dart';
import 'absence_notice_screen.dart';

class AbsenceNoticePage extends BaseBlocWidget< InitializedAbsenceNotice, AbsenceNoticeCubit> {
    @override
   bool initializeByKoin() {
     return false;
   }
  @override
  void loadInitialData(BuildContext context) {
    bloc.loadAbsenceData();
  }

  @override
  Widget buildWidget(BuildContext context, InitializedAbsenceNotice state) {
    return AbsenceNoticeScreen(
      absenceDateParams:state.listAbsenceDate,
      attendanceShiftDto: state.dataUser,

    );
  }
  
  @override
  String? title(BuildContext context) {
    return strings.absenceNotice;
  }
}
