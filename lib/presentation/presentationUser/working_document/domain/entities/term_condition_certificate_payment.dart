

import '../../data/models/term_condition_certificate_payment_dto.dart';

class TermConditionCertificatePayment {
  int? id;
  String? name;

  TermConditionCertificatePayment({this.id, this.name});

   factory TermConditionCertificatePayment.fromDto(TermConditionCertificatePaymentDto json) {
    return TermConditionCertificatePayment(
      id: json.id,
      name: json.name,
    );
   }
}

