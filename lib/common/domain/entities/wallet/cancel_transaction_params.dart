import 'package:json_annotation/json_annotation.dart'; 

part 'cancel_transaction_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CancelTransactionParams {
  @JsonKey(name: 'companyId')
  final  int? companyId;
  @JsonKey(name: 'headId')
  final  int? headId;
  @JsonKey(name: 'type')
  final  int? type;

  CancelTransactionParams({this.companyId, this.headId ,this.type});

   factory CancelTransactionParams.fromJson(Map<String, dynamic> json) => _$CancelTransactionParamsFromJson(json);

   Map<String, dynamic> toJson() => _$CancelTransactionParamsToJson(this);
}

