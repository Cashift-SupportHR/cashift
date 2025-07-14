
import '../../../data/models/loans_request/loan_type_dto.dart';

class LoanType{
  int? id;
  String? name;
  String? crmValue;
  String? loanValue;

  LoanType({this.id, this.name, this.crmValue, this.loanValue});

  factory LoanType.fromJson(LoanTypeDto json) => LoanType(
    id: json.id,
    name: json.name,
    crmValue: json.crmValue,
    loanValue: json.loanValue,
  );
}