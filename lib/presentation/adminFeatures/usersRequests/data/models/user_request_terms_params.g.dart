// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_terms_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestTermsParams _$UserRequestTermsParamsFromJson(
        Map<String, dynamic> json) =>
    UserRequestTermsParams(
      requestTypeCode: (json['requestTypeCode'] as num?)?.toInt(),
      requestStatusCode: (json['requestStatusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserRequestTermsParamsToJson(
        UserRequestTermsParams instance) =>
    <String, dynamic>{
      'requestTypeCode': instance.requestTypeCode,
      'requestStatusCode': instance.requestStatusCode,
    };
