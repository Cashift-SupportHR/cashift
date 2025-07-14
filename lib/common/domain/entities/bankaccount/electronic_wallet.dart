import 'package:json_annotation/json_annotation.dart'; 

part 'electronic_wallet.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ElectronicWallet {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'providerId')
  final  int? providerId;
  @JsonKey(name: 'providerName')
  final  String? providerName;
  @JsonKey(name: 'providerImage')
  final  String? providerImage;
  @JsonKey(name: 'phone')
  final  String? phone;

  ElectronicWallet({this.id, this.providerId, this.providerName, this.providerImage, this.phone});

   factory ElectronicWallet.fromJson(Map<String, dynamic> json) => _$ElectronicWalletFromJson(json);

   Map<String, dynamic> toJson() => _$ElectronicWalletToJson(this);
}

