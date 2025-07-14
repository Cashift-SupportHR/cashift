import 'package:json_annotation/json_annotation.dart';

part 'company_exchange_method.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CompanyExchangeMethod {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'companyId')
  String? companyId;
  @JsonKey(name: 'balance')
  num? balance;

  CompanyExchangeMethod({this.id, this.name, this.companyId});

  factory CompanyExchangeMethod.fromJson(Map<String, dynamic> json) =>
      _$CompanyExchangeMethodFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyExchangeMethodToJson(this);
}
