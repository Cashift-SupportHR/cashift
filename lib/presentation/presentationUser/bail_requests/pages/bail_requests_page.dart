import 'package:flutter/material.dart';

import '../../../../common/components/base/base_widget_bloc.dart';
import '../../common/common_state.dart';
import '../bloc/bail_requests_cubit.dart';
import 'bail_requests_screen.dart';

class BailRequestsPage extends BaseBlocWidget<
    InitializedBailRequests, BailRequestsCubit> {
  final int type;

  BailRequestsPage({Key? key, required this.type})
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
    bloc.loadInitialData(type);
  }

  @override
  Widget buildWidget(
      BuildContext context, InitializedBailRequests state) {
    return BailRequestsScreen(
      requests: state.requests,
      termsAndConditions: state.termsAndConditions,
      type: type,
      onApproveReject: (params) {
        bloc.approveRejectBailRequest(params);
      },
    );
  }
}
