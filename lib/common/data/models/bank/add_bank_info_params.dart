import 'package:json_annotation/json_annotation.dart'; 

part 'add_bank_info_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddBankInfoParams {
  @JsonKey(name: 'bankId')
  final  int bankId;
  @JsonKey(name: 'iban')
  final  String iban;

  AddBankInfoParams({required this.bankId, required this.iban});

  factory AddBankInfoParams.fromJson(Map<String, dynamic> json) => _$AddBankInfoParamsFromJson(json);

  Map<String, dynamic> toJson() => _$AddBankInfoParamsToJson(this);
}

