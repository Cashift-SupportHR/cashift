// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_terms_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestTermsParams _$UserRequestTermsParamsFromJson(
        Map<String, dynamic> json) =>
    UserRequestTermsParams(
      requestTypeCode: json['requestTypeCode'] as int?,
      requestStatusCode: json['requestStatusCode'] as int?,
    );

Map<String, dynamic> _$UserRequestTermsParamsToJson(
        UserRequestTermsParams instance) =>
    <String, dynamic>{
      'requestTypeCode': instance.requestTypeCode,
      'requestStatusCode': instance.requestStatusCode,
    };
