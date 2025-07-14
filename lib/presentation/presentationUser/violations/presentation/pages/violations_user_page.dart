import 'package:flutter/material.dart';

import '../../../../../common/components/base/base_widget_bloc.dart';
import '../../../common/common_state.dart';
import '../../domain/entities/violations_data.dart';
import '../bloc/violations_user_cubit.dart';
import 'violations_user_screen.dart';

class ViolationsUserPage extends BaseBlocWidget<
    Initialized<ViolationsData>, ViolationsUserCubit> {
  final int type;

  ViolationsUserPage({Key? key, required this.type})
      : super(key: key);


  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }
  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(context) {
    bloc.fetchViolationsData(type);
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<ViolationsData> state) {
    return ViolationsUserScreen(
      violationsData: state.data,
      type: type,
      onAccept: (params) {
        bloc.approveRejectViolationFreelance(params);
      },
      onReject: (params) {
        bloc.approveRejectViolationFreelance(params);
      },
    );
  }
}
