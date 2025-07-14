import 'package:json_annotation/json_annotation.dart'; 

part 'balance_by_exchange_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class BalanceByExchangeParams {
  @JsonKey(name: 'companyId')
  int? companyId;
  @JsonKey(name: 'exchangeId')
  int? exchangeId;
  @JsonKey(name: 'type')
  int? type;
  @JsonKey(name: 'headId')
  int? headId;

  BalanceByExchangeParams({this.companyId, this.exchangeId , this.type,this.headId});

   factory BalanceByExchangeParams.fromJson(Map<String, dynamic> json) => _$BalanceByExchangeParamsFromJson(json);

   Map<String, dynamic> toJson() => _$BalanceByExchangeParamsToJson(this);
}

