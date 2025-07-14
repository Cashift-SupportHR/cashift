import 'package:json_annotation/json_annotation.dart'; 

part 'login_params.g.dart'; 
/*
* {
{
  "phoneNumber": "string",
  "password": "string",
  "appId": "string",
  "device_Id": "string",
  "device_Info": "string"
}
}*/
@JsonSerializable(ignoreUnannotated: false)
class LoginParams {

  @JsonKey(name: 'phoneNumber')
  String? phone;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'appId')
  String? appId;

  LoginParams({ this.phone ,this.password, this.appId});

  factory LoginParams.fromJson(Map<String, dynamic> json) => _$LoginParamsFromJson(json);

  Map<String, dynamic> toJson() => _$LoginParamsToJson(this);
}

