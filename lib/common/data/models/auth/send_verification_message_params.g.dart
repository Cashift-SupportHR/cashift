// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_verification_message_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendVerificationMessageParams _$SendVerificationMessageParamsFromJson(
        Map<String, dynamic> json) =>
    SendVerificationMessageParams(
      phoneNumber: json['phoneNumber'] as String?,
      deviceId: json['deviceId'] as String?,
      firebaseToken: json['firebaseToken'] as String?,
    );

Map<String, dynamic> _$SendVerificationMessageParamsToJson(
        SendVerificationMessageParams instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'deviceId': instance.deviceId,
      'firebaseToken': instance.firebaseToken,
    };
