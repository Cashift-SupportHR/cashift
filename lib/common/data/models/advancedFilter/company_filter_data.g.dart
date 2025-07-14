// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_filter_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyFilterData _$CompanyFilterDataFromJson(Map<String, dynamic> json) =>
    CompanyFilterData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$CompanyFilterDataToJson(CompanyFilterData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
