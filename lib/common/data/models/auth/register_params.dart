import 'package:json_annotation/json_annotation.dart'; 

part 'register_params.g.dart'; 
/*{
  "phone": "string",
  "password": "string",
  "confirmPassword": "string",
  "appId": "string"
}
**/
@JsonSerializable(ignoreUnannotated: false)
class RegisterParams {
  @JsonKey(name: 'name')
  final  String? name;
  @JsonKey(name: 'phone')
  final  String? phone;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'confirmPassword')
  final String? confirmPassword;
  @JsonKey(name: 'appId')
  final String? appId;


  factory RegisterParams.fromJson(Map<String, dynamic> json) => _$RegisterParamsFromJson(json);

  RegisterParams({this.name, this.phone, this.appId ,this.password, this.confirmPassword});


  Map<String, dynamic> toJson() => _$RegisterParamsToJson(this);
}

