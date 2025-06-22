// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_edit_classification_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEditClassificationPrams _$AddEditClassificationPramsFromJson(
        Map<String, dynamic> json) =>
    AddEditClassificationPrams(
      id: (json['id'] as num?)?.toInt(),
      companyId: (json['CompanyId'] as num?)?.toInt(),
      nameAr: json['nameAr'] as String?,
      nameEn: json['nameEn'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AddEditClassificationPramsToJson(
        AddEditClassificationPrams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CompanyId': instance.companyId,
      'nameAr': instance.nameAr,
      'nameEn': instance.nameEn,
      'description': instance.description,
    };
