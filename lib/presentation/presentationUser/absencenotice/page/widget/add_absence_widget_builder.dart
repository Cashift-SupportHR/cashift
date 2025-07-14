import 'package:flutter/material.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/date_picker_textfield_widget.dart';
import '../../../../../common/data/models/absence_notation/add_absence_notice_params.dart';
import '../../../resources/colors.dart';
import '../../../resources/constants.dart';

import '../../../../../common/components/base/base_widget_bloc.dart';

import '../../../../../common/components/material_text_field.dart';
import '../../bloc/absencenotice_cubit.dart';

class AddAbsenceWidgetBuilder
    extends BaseBlocWidget<dynamic, AbsenceNoticeCubit> {
  AddAbsenceWidgetBuilder({Key? key}) : super(key: key);
  @override
  bool initializeByKoin() {
    return false;
  }
  @override
  Widget buildWidget(BuildContext context, dynamic state) {
    TextEditingController dateAbsenceController = TextEditingController();
    TextEditingController resonController = TextEditingController();

    var _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              strings.date_absence,
              style: kTextMedium.copyWith(
                color: kPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DatePickerTextFieldWidget(
              validator: (String? value) {
                if (value!.isEmpty) {
                  return strings.validate_date;
                }
                return null;
              },
              hintText: strings.select_date_absence,
              controller: dateAbsenceController,
              dateAbsenceController: dateAbsenceController,
              isHijri: false,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              strings.reasons_for_absence,
              style: kTextMedium.copyWith(
                color: kPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialTextFieldWithCard(
              maxLines: 4,
              controller: resonController,
              validator: (String? value) {
                if(value!.isEmpty){
                  return strings.validate_resone;
                }
                return null;

              },
              hintText: strings.reasons_for_absence,
            ),
            const Spacer(),
            AppCupertinoButton(
              radius: BorderRadius.circular(10),
              text: strings.absence_registration,
              backgroundColor: kPrimary,
              textStyle: kTextMedium.copyWith(
                color: kWhite,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  kHideKeyboard();
                  bloc.addAbsenceNotice(
                      addAbsenceNoticeParams: AddAbsenceNoticeParams(
                          requestDate: dateAbsenceController.text ,
                          notes: resonController.text,
                      ));
                //  Navigator.pop(context);
                }
              },
              height: 40,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
