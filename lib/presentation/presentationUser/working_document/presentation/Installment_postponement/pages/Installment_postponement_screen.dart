import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/text_field/build_text_field_item.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/salarydefinitionrequest/requests/widgets/warning_widget.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';

import '../../../../../../common/components/base/base_stateless_widget.dart';


class InstallmentPostponementScreen extends BaseStatelessWidget {
  final Function(String) onAddInstallment;
  InstallmentPostponementScreen({Key? key, required this.onAddInstallment}) : super(key: key);

 TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print('InstallmentPostponementScreen');
    return Container(
      color: kWhite,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BuildTextFieldItem(
                  title: strings.what_is_reason,
                  hintText: strings.type_reason,
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                ),
               /* WarningWidget(
                  color: kPrimary,
                  margin: const EdgeInsets.only(bottom: 20),
                  warningText: strings.installment_postponement_desc,
                ),*/

                AppCupertinoButton(
                  text: strings.confirm_button,
                  radius: BorderRadius.circular(4),
                  margin: const EdgeInsets.only(top: 50),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      onAddInstallment(descriptionController.text);
                    }
                  },
                ),
              ],
            ),
        ),
      ),
    );
  }
}

