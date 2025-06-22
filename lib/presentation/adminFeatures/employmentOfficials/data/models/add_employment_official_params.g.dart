// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_employment_official_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEmploymentOfficialParams _$AddEmploymentOfficialParamsFromJson(
        Map<String, dynamic> json) =>
    AddEmploymentOfficialParams(
      id: (json['id'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      latitude: json['latitude'] as String?,
      longtude: json['longtude'] as String?,
      timesOfWork: json['timesOfWork'] as String?,
      workDays: json['workDays'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$AddEmploymentOfficialParamsToJson(
        AddEmploymentOfficialParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cityId': instance.cityId,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'timesOfWork': instance.timesOfWork,
      'workDays': instance.workDays,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
      'email': instance.email,
    };
