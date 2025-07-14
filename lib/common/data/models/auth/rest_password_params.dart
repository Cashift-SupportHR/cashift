import 'package:json_annotation/json_annotation.dart'; 

part 'rest_password_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class RestPasswordParams {
  @JsonKey(name: 'phoneNumber')
  final  String? phoneNumber;
  @JsonKey(name: 'code')
  final  String? code;
  @JsonKey(name: 'password')
  final  String? password;

  RestPasswordParams({this.phoneNumber, this.code, this.password});

   factory RestPasswordParams.fromJson(Map<String, dynamic> json) => _$RestPasswordParamsFromJson(json);

   Map<String, dynamic> toJson() => _$RestPasswordParamsToJson(this);
}

