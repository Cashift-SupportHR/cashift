// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disclosure_required_task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisclosureRequiredTaskDto _$DisclosureRequiredTaskDtoFromJson(
        Map<String, dynamic> json) =>
    DisclosureRequiredTaskDto(
      logo: json['logo'] as String?,
      mainText: json['mainText'] as String?,
      description: json['description'] as String?,
      typeClearanceCertificate:
          (json['typeClearanceCertificate'] as List<dynamic>?)
              ?.map((e) =>
                  TypeClearanceCertificate.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$DisclosureRequiredTaskDtoToJson(
        DisclosureRequiredTaskDto instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'mainText': instance.mainText,
      'description': instance.description,
      'typeClearanceCertificate': instance.typeClearanceCertificate,
    };
