import 'package:json_annotation/json_annotation.dart';

part 'apply_details.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ApplyDetails {
  @JsonKey(name: 'companyName')
  final  String ? companyName;
  @JsonKey(name: 'jobName')
  final  String? jobName;
  @JsonKey(name: 'money')
  final  int? money;
  @JsonKey(name: 'startShiftDate')
  final  String? startShiftDate;
  @JsonKey(name: 'endShiftDate')
  final  String? endShiftDate;
//////////////////////////////////
  @JsonKey(name: 'loanType')
  final  String? loanType;
  @JsonKey(name: 'numberInstall')
  final  int? numberInstall;
  @JsonKey(name: 'installment')
  final  num? installment;
  @JsonKey(name: 'totalLoanAmount')
  final  num? totalLoanAmount;
  @JsonKey(name: 'createdDate')
  final  String? createdDate;



  factory ApplyDetails.fromJson(Map<String, dynamic> json) => _$ApplyDetailsFromJson(json);

  ApplyDetails(this.companyName, this.jobName, this.money, this.startShiftDate, this.loanType,this.createdDate ,this.installment,
      this.numberInstall,this.endShiftDate,this.totalLoanAmount);

  Map<String, dynamic> toJson() => _$ApplyDetailsToJson(this);
}