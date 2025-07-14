

import '../../data/models/installment_with_cashift_dto.dart';

class InstallmentWithCashift {
  int? id;
  String? installmentCount;
  int? certificateCost;
  String? textPercentageInstallment;
  int? paymentFees;
  int? cashiftFees;

  InstallmentWithCashift({this.id, this.installmentCount, this.certificateCost, this.textPercentageInstallment, this.paymentFees, this.cashiftFees});

   factory InstallmentWithCashift.fromDto(InstallmentWithCashiftDto json) {
    return InstallmentWithCashift(
      id: json.id,
      installmentCount: json.installmentCount,
      certificateCost: json.certificateCost,
      textPercentageInstallment: json.textPercentageInstallment,
      paymentFees: json.paymentFees,
      cashiftFees: json.cashiftFees,
    );
   }
}

