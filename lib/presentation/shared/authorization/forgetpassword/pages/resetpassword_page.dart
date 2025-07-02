import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/data/models/auth/rest_password_params.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/app_cupertino_button.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';


import '../../../components/password_field_widget.dart';
import '../../login/pages/login_page.dart';
import '../bloc/forgetpassword_bloc.dart';
import 'package:shiftapp/main_index.dart';

class RestPasswordPage extends BaseBlocWidget<UnInitState,ForgetPasswordCubit>{
   @override
  bool initializeByKoin() {
    return false;
  }
  @override
  String? title(BuildContext context) {
    return strings.change_password;
  }
  @override
  void onRequestSuccess(String? message) {
    super.onRequestSuccess(message);
    Navigator.popUntil(context, (route) => route.settings.name== Routes.login);
  }
  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return buildForm(context);
  }

  String phoneNumber(BuildContext context)=>getArguments(context);

  Widget buildForm(BuildContext context) {
    String? newPassword;

    final _formKey = GlobalKey<FormState>();

    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            PasswordFieldWidget(
              onChange: (value) {
                newPassword = value;
              },
              validator: (value) {
                if (value?.isNullOrEmpty()==true) {
                  return strings.please_enter_new_password;
                }
                return null;
              },
              margin: const EdgeInsets.only(right: 22, left: 22, top: 24),
              hintText: strings.new_password,
            ),
            PasswordFieldWidget(
              validator: (value) {
                if (value != newPassword) {
                  return strings.please_enter_match_password;
                }
                return null;
              },
              margin: const EdgeInsets.only(right: 22, left: 22, top: 24),
              hintText: strings.new_password,
            ),
            AppCupertinoButton(
              margin: const EdgeInsets.only(left: 22, right: 22, top: 32),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  bloc.restPasswordByCode(RestPasswordParams(
                    password: newPassword,
                    phoneNumber: phoneNumber(context)
                  ));
                }
              },
              text: strings.send,
            )
          ],
        ),
      ),
    );
  }

}