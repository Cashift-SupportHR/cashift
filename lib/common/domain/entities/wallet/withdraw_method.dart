import 'package:json_annotation/json_annotation.dart';

part 'withdraw_method.g.dart';

// "name": "string",
//       "fullName": "string",
@JsonSerializable(ignoreUnannotated: false)
class WithdrawMethod {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'fullName')
  final String? fullName;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'logo')
  final String? logo;
  @JsonKey(name: 'status')
  final bool? status;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'exchangeId')
  int? exchangeId;

  WithdrawMethod(
      {this.id,
      this.name,
      this.code,
      this.status,
      this.logo,
      this.fullName,
      this.description,
      this.exchangeId});

  factory WithdrawMethod.fromJson(Map<String, dynamic> json) =>
      _$WithdrawMethodFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawMethodToJson(this);
}
