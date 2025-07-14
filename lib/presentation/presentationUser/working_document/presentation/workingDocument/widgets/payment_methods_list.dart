import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/working_document/presentation/workingDocument/widgets/payment_method_item.dart';
import 'package:shiftapp/presentation/shared/components/texts/underline_text.dart';

import '../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../common/components/bottom_sheet/custom_bottom_sheets.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';
import '../../../data/models/working_document_dto.dart';
import '../../../domain/entities/working_document_payment_methods.dart';
import '../../Installment_postponement/pages/installment_postponement_page.dart';
import '../../installment_with_cashift/pages/installment_with_cashift_page.dart';

///  Created by harbey on 8/26/2023.
class PaymentMethodsList extends BaseStatelessWidget {
  final List<PaymentDocument> payments;

  PaymentMethodsList({Key? key, required this.payments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UnderlineText(
          text: strings.there_many_ways_pay,
          textStyle: kTextMedium.copyWith(fontSize: 16, color: kPrimary),
        ),
        Text(
          strings.there_many_ways_pay_desc + ' :',
          style: kTextRegular.copyWith(fontSize: 12, color: kGray_8C),
        ),
        ListView.builder(
          itemCount: payments.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 16),
          itemBuilder: (context, index) {
            return PaymentMethodItem(
              icon: payments[index].icon ?? '',
              title: payments[index].name ?? '',
              subTitle: payments[index].description ?? '',
              onTap: () {
                chooseAnyPaymentMethod(context,
                    code: payments[index].code ?? '',
                    id: payments[index].id ?? 0);
              },
            );
          },
        ),
      ],
    );
  }

  chooseAnyPaymentMethod(BuildContext context,
      {required String code, required int id}) {
    switch (code) {
      case WorkingDocumentPaymentMethods.Tamara:
        showBaseBottomSheet(context, child: Container());
        break;
      case WorkingDocumentPaymentMethods.CreditCard:
        break;
      case WorkingDocumentPaymentMethods.OpportunityValue:
        showBaseBottomSheet(context,
            child: InstallmentWithCashiftPage(id: id));
        break;
      case WorkingDocumentPaymentMethods.delayPayment:
        showBaseBottomSheet(context,
            isScrollControlled: false,
            child: InstallmentPostponementPage(id: id));
        break;
      default:
    }
  }
}