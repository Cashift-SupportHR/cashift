import 'package:json_annotation/json_annotation.dart'; 

part 'loan_request_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class LoanRequestDto {
  @JsonKey(name: 'typeLoans')
  String? typeLoans;
  @JsonKey(name: 'loanAmount')
  String? loanAmount;
  @JsonKey(name: 'installAmount')
  String? installAmount;
  @JsonKey(name: 'createdOn')
  String? createdOn;
  @JsonKey(name: 'totalMonth')
  String? totalMonth;
  @JsonKey(name: 'description')
  String? description;


  LoanRequestDto({this.typeLoans, this.loanAmount, this.installAmount, this.createdOn, this.totalMonth, this.description});

   factory LoanRequestDto.fromJson(Map<String, dynamic> json) => _$LoanRequestDtoFromJson(json);

   Map<String, dynamic> toJson() => _$LoanRequestDtoToJson(this);
}

