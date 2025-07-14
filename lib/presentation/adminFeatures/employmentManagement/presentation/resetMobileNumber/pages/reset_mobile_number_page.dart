import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../../presentationUser/common/common_state.dart';
import '../../../domain/entities/reset_phone_args.dart';
import '../bloc/reset_mobile_number_cubit.dart';
import '../bloc/reset_mobile_number_state.dart';
import 'enter_mobile_number_screen.dart';
import 'verification_code_screen.dart';

class ResetMobileNumberPage
    extends BaseBlocWidget<ResetMobileNumberState, ResetMobileNumberCubit> {

  ResetMobileNumberPage({Key? key}) : super(key: key);

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  String? title(BuildContext context) => strings.reset_mobile_number;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget buildWidget(BuildContext context, ResetMobileNumberState state) {
    ResetPhoneArgs args = getArguments(context);
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        EnterMobileNumberScreen(
          state: state,
          onChangePhoneNumber: (params) {
            params.freeLanceInfoId = args.employee.freeLanceId ?? 0;
            bloc.changePhoneNumber(params);
          },
        ),
        VerificationCodeScreen(
          onResendOTP: () {
            bloc.resendChangePhoneNumberCode();
          },
          onsSend: (code) {
            bloc.checkChangePhoneNumberCode(code);
          },
        ),
      ],
    );
  }

  @override
  void buildListener(BuildContext context, state) {
    // TODO: implement buildListener
    super.buildListener(context, state);
    if (state is SuccessStateListener<int>) {
      print('implement buildListener is SuccessState');
      pageController.animateToPage(1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  @override
  void onSuccessDismissed() {
    print('implement buildListener is');
    Navigator.pop(context, true);
  }
}
