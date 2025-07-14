import 'package:json_annotation/json_annotation.dart';

part 'current_balance.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CurrentBalance {
  @JsonKey(name: 'totalBalance')
  final num? totalBalance;
  @JsonKey(name: 'withdrawnBalance')
  final num? withdrawnBalance;

  CurrentBalance({this.totalBalance, this.withdrawnBalance});

  factory CurrentBalance.fromJson(Map<String, dynamic> json) =>
      _$CurrentBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentBalanceToJson(this);

  num remainingBalance() {
    return (totalBalance ?? 0) - (withdrawnBalance ?? 0);
  }
}
