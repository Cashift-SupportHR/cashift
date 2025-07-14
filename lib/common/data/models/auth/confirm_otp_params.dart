import 'package:json_annotation/json_annotation.dart'; 

part 'confirm_otp_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ConfirmOtpParams {
  @JsonKey(name: 'code')
  final  String? code;
  @JsonKey(name: 'phone')
  final  String? phone;


  ConfirmOtpParams({this.code, this.phone});

  factory ConfirmOtpParams.fromJson(Map<String, dynamic> json) => _$ConfirmOtpParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmOtpParamsToJson(this);
}

