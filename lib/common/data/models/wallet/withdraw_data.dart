

import 'package:json_annotation/json_annotation.dart';

part 'withdraw_data.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class WithdrawData {

  @JsonKey(name: 'transferBalance')
  final double? transferBalance;
  @JsonKey(name: 'totalBalance')
  final double? totalBalance;
  @JsonKey(name: 'transferFee')
  final double? transferFee;

  WithdrawData(this.transferBalance, this.totalBalance, this.transferFee);

  factory WithdrawData.fromJson(Map<String, dynamic> json) =>
      _$WithdrawDataFromJson(json);


  Map<String, dynamic> toJson() => _$WithdrawDataToJson(this);
}
