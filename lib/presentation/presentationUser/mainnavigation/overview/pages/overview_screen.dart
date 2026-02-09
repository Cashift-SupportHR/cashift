import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget.dart';

import '../bloc/overview_bloc.dart';
import '../bloc/overview_state.dart';
import 'perlogin_widget.dart';
import 'postlogin_widget.dart';

class OverviewScreenV2 extends BaseWidget {
  final OverviewState state;
  final Function onRefresh;
  final Function(OverviewEvents event) onRequestEvent;
  final Function(DateTime? dateTime) onChangeDate;
  final Function(int) onApplyJobNow;
  final Function(int) onCheckCertificateJob;
  final Function() canSubmitLogistics;
  final VoidCallback onRetryDeliveryOrders;

  OverviewScreenV2({
    Key? key,
    required this.onRefresh,
    required this.state,
    required this.onRequestEvent,
    required this.onChangeDate,
    required this.onApplyJobNow,
    required this.canSubmitLogistics,
    required this.onCheckCertificateJob,
    required this.onRetryDeliveryOrders,
  }) : super(key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 16),
            child: buildBody(state, context),
          ),
        );
      },
    );
  }

  Widget buildBody(OverviewState state, BuildContext context) {
    return state is OverviewPreLoginState
        ? buildPreLogin(state, context)
        : buildPostLogin(state as OverviewPostLoginState);
  }

  Widget buildPreLogin(OverviewPreLoginState state, BuildContext context) {
    return PreLoginWidget(state: state);
  }

  Widget buildPostLogin(OverviewPostLoginState postLoginState) {
    print('buildPostLogin $postLoginState');
    return PostLoginWidget(
      onRefresh: onRefresh,
      onChangeDate: onChangeDate,
      onRequestEvent: onRequestEvent,
      postLoginState: postLoginState,
      onApplyJobNow: onApplyJobNow,
      canSubmitLogistics: canSubmitLogistics,
      onCheckCertificateJob: onCheckCertificateJob,
      onRetryDeliveryOrders: onRetryDeliveryOrders,
    );
  }
}
