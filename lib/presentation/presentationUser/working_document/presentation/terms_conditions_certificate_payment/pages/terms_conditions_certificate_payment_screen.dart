import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/icons/icon_text.dart';

import '../../../../../../utils/app_icons.dart';
import '../../../../../../common/components/base/app_widgets.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/checkbox/warning_check_box_widget.dart';
import '../../../../common/common_state.dart';
import '../../../../resources/constants.dart';
import '../../../domain/entities/term_condition_certificate_payment.dart';
import '../widgets/term_condition_certificate_payment_list.dart';


class TermsConditionsCertificatePaymentScreen extends BaseStatelessWidget {
  final List<TermConditionCertificatePayment> data;
  TermsConditionsCertificatePaymentScreen({Key? key, required this.data}) : super(key: key);

  StreamStateInitial<bool> isAcceptStream = StreamStateInitial<bool>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: saveButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            TermsConditionsCertificatePaymentList(
              data: data,
            ),
            WarningCheckBoxWidget(
              activeColor: kPrimary,
              backgroundColor: kBackground,
              padding: EdgeInsets.zero,
              textStyle: kTextMedium.copyWith(fontSize: 14, color: kPrimary),
              margin: const EdgeInsetsDirectional.only(start: 6, top: 5),
              text: strings.terms_and_conditions_message,

              onChanged: (value) {
                isAcceptStream.setData(value ?? false);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget header(){
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
      child: IconText(
        icon: AppIcons.working_document,
        text: strings.copy_rights_title,
        sizedBoxWidth: 10,
        textStyle: kTextSemiBold.copyWith(fontSize: 24, color: kYellow_00),
      ),
    );
  }

  saveButton(){
    return StreamBuilder<bool>(
        initialData: false,
        stream: isAcceptStream.stream,
      builder: (context, snapshot) {
        return AppCupertinoButton(
          text: strings.seen,
          radius: BorderRadius.circular(4),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          onPressed: snapshot.data! ? () {
            Navigator.pop(context, true);
          } : null
        );
      }
    );
  }
}
