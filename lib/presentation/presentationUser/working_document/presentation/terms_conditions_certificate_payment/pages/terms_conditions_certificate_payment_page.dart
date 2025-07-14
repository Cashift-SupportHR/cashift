import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/working_document/presentation/terms_conditions_certificate_payment/pages/terms_conditions_certificate_payment_screen.dart';

import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../common/common_state.dart';
import '../../../domain/entities/term_condition_certificate_payment.dart';
import '../bloc/terms_conditions_certificate_payment_cubit.dart';


class TermsConditionsCertificatePaymentPage extends BaseBlocWidget<
    Initialized<List<TermConditionCertificatePayment>>, TermsConditionsCertificatePaymentCubit> {

  TermsConditionsCertificatePaymentPage({Key? key})
      : super(key: key);


  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }
  @override
  void loadInitialData(context) {
    int? paymentId = getArguments(context) as int?;
    bloc.fetchTermsConditionsCertificatePayment(paymentId ?? 0);
  }

  @override
  String? title(context) => strings.copy_rights_title;

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<TermConditionCertificatePayment>> state) {
    return TermsConditionsCertificatePaymentScreen(
      data: state.data,
    );
  }
}
