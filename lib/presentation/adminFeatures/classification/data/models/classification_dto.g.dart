// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassificationDto _$ClassificationDtoFromJson(Map<String, dynamic> json) =>
    ClassificationDto(
      id: (json['id'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      nameAr: json['nameAr'] as String?,
      companyId: (json['companyId'] as num?)?.toInt(),
      nameEn: json['nameEn'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$ClassificationDtoToJson(ClassificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'nameAr': instance.nameAr,
      'companyName': instance.companyName,
      'nameEn': instance.nameEn,
      'description': instance.description,
      'code': instance.code,
      'icon': instance.icon,
    };
