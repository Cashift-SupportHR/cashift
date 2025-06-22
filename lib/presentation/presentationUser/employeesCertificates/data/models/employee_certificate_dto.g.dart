// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_certificate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeCertificateDto _$EmployeeCertificateDtoFromJson(
        Map<String, dynamic> json) =>
    EmployeeCertificateDto(
      id: (json['id'] as num?)?.toInt(),
      titleHead: json['titleHead'] as String?,
      logoHead: json['logoHead'] as String?,
      name: json['name'] as String?,
      birthDate: json['birthDate'] as String?,
      logo: json['logo'] as String?,
      logoUser: json['logoUser'] as String?,
    );

Map<String, dynamic> _$EmployeeCertificateDtoToJson(
        EmployeeCertificateDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'titleHead': instance.titleHead,
      'logoHead': instance.logoHead,
      'name': instance.name,
      'birthDate': instance.birthDate,
      'logo': instance.logo,
      'logoUser': instance.logoUser,
    };
