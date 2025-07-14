import 'package:flutter/material.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../domain/entities/TermsAndConditionsRequests.dart';
import '../bloc/term_and_condation_request_cubit.dart';
import 'term_and_condation_request_screen.dart';

class TermCondationRequestsUserPage extends BaseBlocWidget<
    Initialized<List<TermsAndConditionsRequests>>,
    TermCondationRequestsUserCubit> {
  final String typeCode;
  TermCondationRequestsUserPage({required this.typeCode});
  @override
  void loadInitialData(BuildContext context) {
    // TODO: implement loadInitialData
    bloc.fetchTermsAndConditionsRequests(typeCode);
  }

  @override
  Widget buildWidget(BuildContext context,
      Initialized<List<TermsAndConditionsRequests>> state) {
    return TermCondationRequestsUserScreen(data: state.data);
  }
}
