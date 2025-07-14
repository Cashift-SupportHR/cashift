import 'package:json_annotation/json_annotation.dart'; 

part 'wallet_provider_item.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class WalletProviderItem {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'providerName')
  final  String? providerName;
  @JsonKey(name: 'providerLogo')
  final  String? providerLogo;
  @JsonKey(name: 'providerCode')
  final  String? providerCode;

  WalletProviderItem({this.id, this.providerName, this.providerLogo, this.providerCode});

   factory WalletProviderItem.fromJson(Map<String, dynamic> json) => _$WalletProviderItemFromJson(json);

   Map<String, dynamic> toJson() => _$WalletProviderItemToJson(this);
}

