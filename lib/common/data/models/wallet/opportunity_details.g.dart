// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpportunityDetails _$OpportunityDetailsFromJson(Map<String, dynamic> json) =>
    OpportunityDetails(
      json['companyName'] as String?,
      json['opportunityName'] as String?,
      json['deservedAmount'] as String?,
      json['startWork'] as String?,
      json['endWork'] as String?,
    );

Map<String, dynamic> _$OpportunityDetailsToJson(OpportunityDetails instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'opportunityName': instance.opportunityName,
      'deservedAmount': instance.deservedAmount,
      'startWork': instance.startWork,
      'endWork': instance.endWork,
    };
