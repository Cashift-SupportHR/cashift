import 'package:flutter/cupertino.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/presentationUser/verification/pages/Verification_page.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../signup/pages/signup_screen.dart';
import '../bloc/forgetpassword_bloc.dart';
import 'resetpassword_page.dart';

import 'package:shiftapp/main_index.dart';

class ForgetPassword extends BaseBlocWidget<UnInitState, ForgetPasswordCubit> {
   String phone = '';

  @override
  bool detectRequiredTasks() {
    return false;
  }

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return buildForm(context);
  }

  @override
  Future<void> onRequestSuccess(String? message) async {
    final verified = await Navigator.pushNamed(context,  Routes.verificationPage, arguments: VerificationPageModel(phone: phone, verifyForLogin: false));
    if (verified is bool && verified == true) {
      Navigator.pushNamed(
        context,
        Routes.restPasswordPage,
        arguments: phone,
      );
    }
  }

  @override
  String? title(BuildContext context) {
    return strings.change_password;
  }

  Widget buildForm(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              strings.enter_your_phone_number_retrieve_password,
              style: kTextRegular.copyWith(fontSize: 14, color: kWarmGrey),
            ),
            Padding(
              padding: EdgeInsets.only(left: 22, right: 22, top: 75),
              child: PhoneNumberField(
                onChange: (String text) {
                  phone = text;
                },
              ),
            ),
            AppCupertinoButton(
              margin: const EdgeInsets.only(left: 22, right: 22, top: 32),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  bloc.sendRestPasswordCode(phone);
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
