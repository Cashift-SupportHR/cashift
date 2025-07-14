import 'package:flutter/material.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/profile/requests/data/models/confirm_reques_prams.dart';

import '../../../../../../../../../core/services/routes.dart';
import '../../../../../../../../shared/components/base_widget_bloc.dart';
import '../../../../../domain/entities/AddRequestConst.dart';
import '../bloc/confirm_user_cubit.dart';
import 'confirm_requests_user_screen.dart';

class ConfirmRequestsUserPage
    extends BaseBlocWidget<UnInitState, ConfirmRequestsUserCubit> {
  @override
  String? title(BuildContext context) {
    return strings.confirm_code;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    AddRequestConst? prams = getArguments(context);
    return ConfirmRequestsUserScreen(
      onComplete: (otp) {
        bloc.confirmRequest(ConfirmRequesPrams(
            newPhoneNumber: prams?.addRequestPrams.newPhoneNumber, code: otp));
      },
      onResendOTP: () {},
    );
  }

  @override
  void onSuccessDismissed() {
    AddRequestConst? prams = getArguments(context);
    Navigator.pushNamed(context, Routes.addFileRequestsUserPage,
        arguments: prams);
  }
}
