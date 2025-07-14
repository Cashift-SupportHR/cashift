import 'package:json_annotation/json_annotation.dart'; 

part 'withdraw_to_another_account_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class WithdrawToAnotherAccountParams {
  @JsonKey(name: 'companyId')
  final  int? companyId;
  @JsonKey(name: 'idNumber')
  final  String? idNumber;
  @JsonKey(name: 'transferType')
  final  int? type;
  @JsonKey(name: 'id')
  final  int? id;

  WithdrawToAnotherAccountParams({this.companyId, this.idNumber,this.type,this.id});

   factory WithdrawToAnotherAccountParams.fromJson(Map<String, dynamic> json) => _$WithdrawToAnotherAccountParamsFromJson(json);

   Map<String, dynamic> toJson() => _$WithdrawToAnotherAccountParamsToJson(this);
}

