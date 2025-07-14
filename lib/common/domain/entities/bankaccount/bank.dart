import 'package:json_annotation/json_annotation.dart'; 

part 'bank.g.dart'; 
/*  "bankLogo": "string",
      "isContractBank": true**/
@JsonSerializable(ignoreUnannotated: false)
class Bank {
  @JsonKey(name: 'id')
  final  int id;
  @JsonKey(name: 'bankName')
  final  String bankName;
  @JsonKey(name: 'bankLogo')
  final  String  ? bankLogo;
@JsonKey(name: 'isContractBank')
  final  bool ? isContractBank;

  Bank({required this.id, required this.bankName ,required this.bankLogo , this.isContractBank});

  factory Bank.fromJson(Map<String, dynamic> json) => _$BankFromJson(json);

  Map<String, dynamic> toJson() => _$BankToJson(this);
}

