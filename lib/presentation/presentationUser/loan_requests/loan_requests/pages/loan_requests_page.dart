import 'package:flutter/material.dart';

import '../../../../../common/domain/entities/loans_request/loan_request.dart';
import '../../../../../common/components/base/base_widget_bloc.dart';
import '../../../common/common_state.dart';
import '../bloc/loan_requests_cubit.dart';
import 'loan_requests_screen.dart';

class LoanRequestsPage extends BaseBlocWidget<
    Initialized<List<LoanRequest>>, LoanRequestsCubit> {
  final int type;

  LoanRequestsPage({Key? key, required this.type})
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
      BuildContext context, Initialized<List<LoanRequest>> state) {
    return LoanRequestsScreen(
      requests: state.data,
      type: type,
    );
  }
}
