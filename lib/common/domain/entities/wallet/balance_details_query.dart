import 'package:json_annotation/json_annotation.dart'; 

part 'balance_details_query.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class BalanceDetailsQuery {
  @JsonKey(name: 'statusId')
  final  int? statusId;
  @JsonKey(name: 'companyId')
  final  int? companyId;
  @JsonKey(name: 'headId')
  final  int? headId;
  @JsonKey(name: 'type')
  final  int? type;

  BalanceDetailsQuery({this.statusId, this.companyId, this.headId ,this.type});

   factory BalanceDetailsQuery.fromJson(Map<String, dynamic> json) => _$BalanceDetailsQueryFromJson(json);

   Map<String, dynamic> toJson() => _$BalanceDetailsQueryToJson(this);
}

