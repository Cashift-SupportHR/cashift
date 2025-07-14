import 'package:json_annotation/json_annotation.dart'; 

part 'withdraw_by_phone_wallet_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class WithdrawByPhoneWalletParams {
  @JsonKey(name: 'providerId')
  final  int? providerId;
  @JsonKey(name: 'projectId')
  final  int? projectId;
  @JsonKey(name: 'bankCode')
  final  String? bankCode;
  @JsonKey(name: 'type')
  final  int? type;
  @JsonKey(name: 'transferId')
  final  int? transferId;

  WithdrawByPhoneWalletParams({this.providerId, this.projectId, this.bankCode, this.type, this.transferId});

   factory WithdrawByPhoneWalletParams.fromJson(Map<String, dynamic> json) => _$WithdrawByPhoneWalletParamsFromJson(json);

   Map<String, dynamic> toJson() => _$WithdrawByPhoneWalletParamsToJson(this);
}

