
import '../../../data/models/loans_request/loan_request_dto.dart';

class LoanRequest{
  final String? id;
  final String? typeLoans;
  final String? loanAmount;
  final String? installAmount;
  final String? createdOn;
  final String? totalMonth;
  final String? description;

  LoanRequest({
    this.id,
    this.typeLoans,
    this.loanAmount,
    this.installAmount,
    this.createdOn,
    this.totalMonth,
    this.description,
  });


  factory LoanRequest.fromJson(LoanRequestDto json) {
    return LoanRequest(
      id: 'json.id',
      typeLoans: json.typeLoans,
      loanAmount: json.loanAmount,
      installAmount: json.installAmount,
      createdOn: json.createdOn,
      totalMonth: json.totalMonth,
    );
  }
}