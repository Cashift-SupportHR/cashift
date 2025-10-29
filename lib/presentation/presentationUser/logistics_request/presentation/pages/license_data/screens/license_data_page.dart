import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../common/common_state.dart';
import '../../../../data/models/add_logistics_prams.dart';
import '../cubit/license_data_cubit.dart';
import 'license_data_screen.dart';

class LicenseDataPage extends BaseBlocWidget<UnInitState, LicenseDataCubit> {
  final Function(License  license ) onNext;
  final Function() onPrevious;

  LicenseDataPage({Key? key, required this.onNext, required this.onPrevious}) : super(key: key);

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return LicenseDataScreen(
      onNext: onNext,
      onPrevious:onPrevious ,
    );
  }
}
