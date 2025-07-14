import 'package:json_annotation/json_annotation.dart'; 

part 'with_draw_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class WithDrawParams {
  @JsonKey(name: 'projectId')
  final  int projectId;
  @JsonKey(name: 'bankCode')
  final  String bankCode;
  @JsonKey(name: 'transactionType')
  final  int transactionType;
  @JsonKey(name: 'transferId')
  final  int? transferId;
  WithDrawParams({required this.projectId, required this.bankCode, required this.transactionType ,required this.transferId});

  factory WithDrawParams.fromJson(Map<String, dynamic> json) => _$WithDrawParamsFromJson(json);

  Map<String, dynamic> toJson() => _$WithDrawParamsToJson(this);
}

