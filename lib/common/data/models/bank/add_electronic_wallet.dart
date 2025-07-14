import 'package:json_annotation/json_annotation.dart'; 

part 'add_electronic_wallet.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddElectronicWalletParams {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'phone')
  final  String? phone;
  @JsonKey(name: 'providerId')
  final  int? providerId;

  AddElectronicWalletParams({this.id, this.phone, this.providerId});

   factory AddElectronicWalletParams.fromJson(Map<String, dynamic> json) => _$AddElectronicWalletParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddElectronicWalletParamsToJson(this);
}

