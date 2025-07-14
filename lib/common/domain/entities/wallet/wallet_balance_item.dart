import 'package:json_annotation/json_annotation.dart';

part 'wallet_balance_item.g.dart';

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class WalletBalanceItem {
  @JsonKey(name: 'companyId')
  int? companyId;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'companyName')
  String? companyName;
  @JsonKey(name: 'logo')
  String? logo;
  @JsonKey(name: 'dateOperation')
  String? date;
  @JsonKey(name: 'employeeName')
  String? employeeName;
  @JsonKey(name: 'typeTransfer')
  String? typeTransfer;
  @JsonKey(name: 'statusName')
  String? statusName;
  @JsonKey(name: 'balance')
  num? balance;
  /**
   *when equal true that main there transfer in proccessed  **/
  @JsonKey(name: 'status')
  bool? status;

  /***
   * to know balance type come from freelance job
   * or though transfer from another account
   * (`1`) for come from freenlance job
   *(`2`) for come from another account transfer */
  @JsonKey(name: 'type')
  int? type;

  WalletBalanceItem(
      {this.companyId, this.companyName, this.balance, this.status , this.typeTransfer});

  factory WalletBalanceItem.fromJson(Map<String, dynamic> json) =>
      _$WalletBalanceItemFromJson(json);

  Map<String, dynamic> toJson() => _$WalletBalanceItemToJson(this);
}
