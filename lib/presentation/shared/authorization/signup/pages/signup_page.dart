import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/splash/splash_page.dart';
import 'package:shiftapp/presentation/presentationUser/verification/pages/Verification_page.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import '../../login/bloc/login_bloc.dart';
import 'signup_screen.dart';
import 'package:shiftapp/main_index.dart';

class SignupPage extends BaseBlocWidget<UnInitState, LoginBloc> {
  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return SignupScreen(
      performLogin: (loginParams) {
        bloc.register(loginParams);
      },
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.register;
  }

  @override
  Future<void> buildListener(BuildContext context, state) async {
    super.buildListener(context, state);
    if (state is VerificationCodeSentListener) {
      final isVerified = await Navigator.pushNamed(
          context, Routes.verificationPage,
          arguments: VerificationPageModel(
              phone: state.phoneNumber!, verifyForLogin: true));
      if (isVerified is bool && isVerified == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.splash, (route) => false);
      }
    }
  }
}
