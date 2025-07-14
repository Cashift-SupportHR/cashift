import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../../common/components/base/base_widget_bloc.dart';
import '../bloc/change_password_cubit.dart';
import 'change_password_screen.dart';

class ChangePasswordPage extends BaseBlocWidget<UnInitState, ChangePasswordCubit> {
  static const String routeName = '/changePasswordScreen';
  ChangePasswordPage({Key? key})
      : super(key: key);


  @override
  void onSuccessDismissed() {
    super.onSuccessDismissed();
    Navigator.pop(context);
  }

  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    return ChangePasswordScreen(
      onChangePassword: (params) {
        bloc.changePassword(params);
      },
    );
  }
}
