// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pledge_generalization_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PledgeGeneralizationDto _$PledgeGeneralizationDtoFromJson(
        Map<String, dynamic> json) =>
    PledgeGeneralizationDto(
      id: (json['id'] as num?)?.toInt(),
      logo: json['logo'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      clearanceText: json['clearanceText'] as String?,
      statusText: json['statusText'] as String?,
      clearanceDate: json['clearanceDate'] as String?,
      hasAction: json['hasAction'] as bool?,
      confirmMessage: json['confirmMessage'] as String?,
    );

Map<String, dynamic> _$PledgeGeneralizationDtoToJson(
        PledgeGeneralizationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo': instance.logo,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'clearanceText': instance.clearanceText,
      'statusText': instance.statusText,
      'clearanceDate': instance.clearanceDate,
      'hasAction': instance.hasAction,
      'confirmMessage': instance.confirmMessage,
    };
