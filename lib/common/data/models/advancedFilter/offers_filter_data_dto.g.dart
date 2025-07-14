// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_filter_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersFilterDataDto _$OffersFilterDataDtoFromJson(Map<String, dynamic> json) =>
    OffersFilterDataDto(
      jobs: (json['jobs'] as List<dynamic>?)
          ?.map((e) => JobFilterData.fromJson(e as Map<String, dynamic>))
          .toList(),
      company: (json['company'] as List<dynamic>?)
          ?.map((e) => CompanyFilterData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OffersFilterDataDtoToJson(
        OffersFilterDataDto instance) =>
    <String, dynamic>{
      'jobs': instance.jobs,
      'company': instance.company,
    };
