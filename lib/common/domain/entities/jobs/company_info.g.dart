// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) => CompanyInfo(
      id: (json['id'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      fieldType: json['fieldType'] as String?,
      section: json['section'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      longtude: (json['longtude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CompanyInfoToJson(CompanyInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'fieldType': instance.fieldType,
      'section': instance.section,
      'description': instance.description,
      'address': instance.address,
      'longtude': instance.longtude,
      'latitude': instance.latitude,
    };
