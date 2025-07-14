import 'package:flutter/material.dart';

import '../../../../../common/components/base/base_widget_bloc.dart';
import '../../../common/common_state.dart';
import '../../domain/entities/pledge_generalization.dart';
import '../bloc/pledges_and_generalization_cubit.dart';
import 'pledges_and_generalization_screen.dart';

class PledgesAndGeneralizationPage extends BaseBlocWidget<
    Initialized<List<PledgeGeneralization>>, PledgesAndGeneralizationCubit> {
  final int type;

  PledgesAndGeneralizationPage({Key? key, required this.type})
      : super(key: key);


  @override
  bool initializeByKoin() {
    return false;
  }


  @override
  void loadInitialData(context) {
    bloc.fetchLoansRequests(type);
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<PledgeGeneralization>> state) {
    return PledgesAndGeneralizationScreen(
      data: state.data,
      type: type,
      onReset: (id) {
        bloc.resetPledgesAndGeneralization(id);
      },
    );
  }

  @override
   onRequestSuccess( message) {
    Navigator.pop(context);
    bloc.fetchLoansRequests(type);
  }

  @override
   onSuccessRequiredTasks() async {
    print('onSuccessRequiredTasks');
   await bloc.fetchLoansRequests(type);
  }
}
