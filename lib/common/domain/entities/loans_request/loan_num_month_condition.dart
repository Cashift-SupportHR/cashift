import '../../../data/models/loans_request/loan_num_month_condition_dto.dart';

class LoanNumMonthCondition{
  List<TermandCondition>? loansConditions;
  List<LoansMonth>? loansMonths;

  LoanNumMonthCondition({this.loansConditions, this.loansMonths});

  factory LoanNumMonthCondition.fromJson(LoanNumMonthConditionDto json) => LoanNumMonthCondition(
    loansConditions: json.termandCondition,
    loansMonths: json.loansMonthVM,
  );
}