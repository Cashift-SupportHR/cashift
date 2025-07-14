import 'package:flutter/material.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/constants.dart';
import '../../../domain/entities/term_condition_certificate_payment.dart';

///  Created by harbey on 8/26/2023.
class TermsConditionsCertificatePaymentList extends StatelessWidget {
  final List<TermConditionCertificatePayment> data;

  const TermsConditionsCertificatePaymentList({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: data.length,
      shrinkWrap:   true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return  TermConditionCertificatePaymentItem(
          title: data[index].name ?? '',
        );
      },
    );
  }
}

class TermConditionCertificatePaymentItem extends StatelessWidget {
  final String title;
  const TermConditionCertificatePaymentItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = kTextRegular.copyWith(fontSize: 14, color: kBlack.withOpacity(0.7));
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 8, start: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: textStyle,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 3),
              child: Text(
                title,
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

