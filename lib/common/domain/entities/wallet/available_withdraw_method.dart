import 'package:json_annotation/json_annotation.dart';

part 'available_withdraw_method.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class AvailableWithdrawMethod {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'exchangeId')
  int? exchangeId;

  AvailableWithdrawMethod({this.id, this.name, this.exchangeId});

  factory AvailableWithdrawMethod.fromJson(Map<String, dynamic> json) =>
      _$AvailableWithdrawMethodFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableWithdrawMethodToJson(this);
}
