// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_official_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentOfficialDto _$EmploymentOfficialDtoFromJson(
        Map<String, dynamic> json) =>
    EmploymentOfficialDto(
      id: (json['id'] as num?)?.toInt(),
      cityName: json['cityName'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      timesOfWork: json['timesOfWork'] as String?,
      workDays: json['workDays'] as String?,
      description: json['description'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      latitude: json['latitude'] as String?,
      longtude: json['longtude'] as String?,
      descriptionAr: json['descriptionAr'] as String?,
      descriptionEn: json['descriptionEn'] as String?,
      email: json['email'] as String?,
      cityId: (json['cityId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmploymentOfficialDtoToJson(
        EmploymentOfficialDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'timesOfWork': instance.timesOfWork,
      'workDays': instance.workDays,
      'description': instance.description,
      'isDeleted': instance.isDeleted,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'descriptionAr': instance.descriptionAr,
      'descriptionEn': instance.descriptionEn,
      'email': instance.email,
    };
