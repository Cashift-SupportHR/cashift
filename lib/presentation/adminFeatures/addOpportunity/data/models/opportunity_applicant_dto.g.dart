// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_applicant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityApplicantDto _$OpportunityApplicantDtoFromJson(
  Map<String, dynamic> json,
) => OpportunityApplicantDto(
  freeLanceApplys: (json['freeLanceApplys'] as List<dynamic>?)
      ?.map((e) => AppliedDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  navItems: (json['navItems'] as List<dynamic>?)
      ?.map((e) => NavItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OpportunityApplicantDtoToJson(
  OpportunityApplicantDto instance,
) => <String, dynamic>{
  'freeLanceApplys': instance.freeLanceApplys,
  'navItems': instance.navItems,
};
