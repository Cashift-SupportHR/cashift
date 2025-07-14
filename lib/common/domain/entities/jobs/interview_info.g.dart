// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterviewInfo _$InterviewInfoFromJson(Map<String, dynamic> json) =>
    InterviewInfo(
      cityName: json['cityName'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longtude: (json['longtude'] as num?)?.toDouble(),
      timesOfWork: json['timesOfWork'] as String?,
      workDays: json['workDays'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
      companyName: json['companyName'] as String?,
      companyLogo: json['companyLogo'] as String?,
    );

Map<String, dynamic> _$InterviewInfoToJson(InterviewInfo instance) =>
    <String, dynamic>{
      'cityName': instance.cityName,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'timesOfWork': instance.timesOfWork,
      'workDays': instance.workDays,
      'description': instance.description,
      'email': instance.email,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
    };
