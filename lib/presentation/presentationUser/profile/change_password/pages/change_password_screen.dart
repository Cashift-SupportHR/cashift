import 'package:flutter/material.dart';

import 'package:shiftapp/common/data/models/auth/change_password_params.dart';
import 'package:shiftapp/presentation/shared/components/app_button.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/material_text_field.dart';
import 'package:shiftapp/presentation/presentationUser/common/extensions.dart';

class ChangePasswordScreen extends BaseStatelessWidget {
  final Function(ChangePasswordParams) onChangePassword;

  ChangePasswordScreen({required this.onChangePassword});

  @override
  Widget build(BuildContext context) {
    String? newPassword;
    String? oldPassword;

    final _formKey = GlobalKey<FormState>();

    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            MaterialTextField(
              onChanged: (value) {
                oldPassword = value;
                print('ON SET NEW PASSWORD $newPassword');
              },
              validator: (value) {
                if (value.isNullOrEmpty()) {
                  return 'من فضلك قم بإدخال كلمة المرور الحالية ';
                }
                return null;
              },
              obscureText: true,
              margin: const EdgeInsets.only(right: 22, left: 22, top: 24),
              inputDecoration: const InputDecoration(
                hintText: 'كلمة المرور الحالية',
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            MaterialTextField(
              onChanged: (value) {
                newPassword = value;
                print('ON SET NEW PASSWORD $newPassword');
              },
              validator: (value) {
                if (value.isNullOrEmpty()) {
                  return 'من فضلك قم بإدخال كلمة السر الجديدة';
                }
                return null;
              },
              margin: const EdgeInsets.only(right: 22, left: 22, top: 24),
              inputDecoration: const InputDecoration(
                hintText: 'كلمة المرور الجديدة',
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            MaterialTextField(
              validator: (value) {
                if (value != newPassword) {
                  return 'من فضلك قم بإدخال كلمة المرور متطابقة';
                }
                return null;
              },
              obscureText: true,
              margin: const EdgeInsets.only(right: 22, left: 22, top: 24),
              inputDecoration: const InputDecoration(
                hintText: 'تأكيد كلمة المرور ',
              ),
            ),
            AppButton(
              margin: const EdgeInsets.only(left: 22, right: 22, top: 32),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  onChangePassword(
                    ChangePasswordParams(
                      oldPassword: oldPassword,
                      newPassword: newPassword,
                    ),
                  );
                }
              },
              text: 'إرسال',
            )
          ],
        ),
      ),
    );
  }
}
