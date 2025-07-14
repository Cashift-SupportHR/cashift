import 'package:json_annotation/json_annotation.dart'; 

part 'bank_account_info.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class BankAccountInfo {
  @JsonKey(name: 'id')
  final  int id;
  @JsonKey(name: 'bankId')
  final  int bankId;
  @JsonKey(name: 'bankName')
  final  String bankName;
  @JsonKey(name: 'iban')
  final  String iban;

  BankAccountInfo({required this.id, required this.bankId, required this.bankName, required this.iban});

  factory BankAccountInfo.fromJson(Map<String, dynamic> json) => _$BankAccountInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountInfoToJson(this);
}

