// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer_slider_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobOfferSliderDto _$JobOfferSliderDtoFromJson(Map<String, dynamic> json) =>
    JobOfferSliderDto(
      id: (json['id'] as num?)?.toInt(),
      jobName: json['jobName'] as String?,
      description: json['description'] as String?,
      mainLogo: json['mainLogo'] as String?,
      backGroundLogo: json['backGroundLogo'] as String?,
      companyLogo: json['companyLogo'] as String?,
      actionName: json['actionName'] as String?,
      header: json['header'] == null
          ? null
          : SliderHeader.fromJson(json['header'] as Map<String, dynamic>),
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => SliderDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      footer: json['footer'] == null
          ? null
          : SliderFooter.fromJson(json['footer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobOfferSliderDtoToJson(JobOfferSliderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobName': instance.jobName,
      'description': instance.description,
      'mainLogo': instance.mainLogo,
      'backGroundLogo': instance.backGroundLogo,
      'companyLogo': instance.companyLogo,
      'actionName': instance.actionName,
      'header': instance.header,
      'details': instance.details,
      'footer': instance.footer,
    };
