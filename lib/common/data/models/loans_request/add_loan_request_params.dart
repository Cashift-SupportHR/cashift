import 'package:json_annotation/json_annotation.dart'; 

part 'add_loan_request_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddLoanRequestParams {
  @JsonKey(name: 'idNumber')
  String? idNumber;
  @JsonKey(name: 'loanType')
  int? loanType;
  @JsonKey(name: 'crmValue')
  String? crmValue;
  @JsonKey(name: 'loansAmount')
  int? loansAmount;
  @JsonKey(name: 'monthNumber')
  int? monthNumber;

  AddLoanRequestParams({this.idNumber, this.loanType, this.crmValue, this.loansAmount, this.monthNumber});

   factory AddLoanRequestParams.fromJson(Map<String, dynamic> json) => _$AddLoanRequestParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddLoanRequestParamsToJson(this);
}

