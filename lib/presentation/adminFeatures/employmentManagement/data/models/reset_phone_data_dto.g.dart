// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_phone_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPhoneDataDto _$ResetPhoneDataDtoFromJson(Map<String, dynamic> json) =>
    ResetPhoneDataDto(
      freeLanceId: (json['freeLanceId'] as num?)?.toInt(),
      pageHeaderLabel: json['pageHeaderLabel'] as String?,
      subHeaderLabel: json['subHeaderLabel'] as String?,
      inputPhoneNumberLabel: json['inputPhoneNumberLabel'] as String?,
      detailsLabel: json['detailsLabel'] as String?,
      icon: json['icon'] as String?,
      uploadLabel: json['uploadLabel'] as String?,
      uploadIcon: json['uploadIcon'] as String?,
      button: json['button'] as String?,
    );

Map<String, dynamic> _$ResetPhoneDataDtoToJson(ResetPhoneDataDto instance) =>
    <String, dynamic>{
      'freeLanceId': instance.freeLanceId,
      'pageHeaderLabel': instance.pageHeaderLabel,
      'subHeaderLabel': instance.subHeaderLabel,
      'inputPhoneNumberLabel': instance.inputPhoneNumberLabel,
      'detailsLabel': instance.detailsLabel,
      'icon': instance.icon,
      'uploadLabel': instance.uploadLabel,
      'uploadIcon': instance.uploadIcon,
      'button': instance.button,
    };
