import 'package:json_annotation/json_annotation.dart'; 

part 'send_verification_message_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class SendVerificationMessageParams {
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'deviceId')
  String? deviceId;
  @JsonKey(name: 'firebaseToken')
  String? firebaseToken;

  SendVerificationMessageParams({this.phoneNumber, this.deviceId, this.firebaseToken});

  factory SendVerificationMessageParams.fromJson(Map<String, dynamic> json) => _$SendVerificationMessageParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SendVerificationMessageParamsToJson(this);
}

