// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_resume_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResumeParams _$UpdateResumeParamsFromJson(Map<String, dynamic> json) =>
    UpdateResumeParams(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      cityId: (json['cityId'] as num?)?.toInt(),
      otherCity: json['otherCity'] as String?,
      idNumber: json['idNumber'] as String?,
      birthDate: json['birthDate'] as String?,
      englishLevel: (json['englishLevel'] as num?)?.toInt(),
      computerLevel: (json['computerLevel'] as num?)?.toInt(),
      email: json['email'] as String?,
      gender: json['gender'] as bool?,
      currentSituation: (json['currentSituation'] as num?)?.toInt(),
      qualificationData: (json['qualificationData'] as num?)?.toInt(),
      qualificationName: json['qualificationName'] as String?,
      listOfJob: (json['listOfJob'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      isHijri: json['isHijri'] as bool?,
      length: (json['length'] as num?)?.toInt(),
      weight: (json['wieght'] as num?)?.toInt(),
      districtId: (json['districtId'] as num?)?.toInt(),
      favourateHours: (json['favourateHours'] as num?)?.toInt(),
      timeWorkId: (json['timeWorkId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateResumeParamsToJson(UpdateResumeParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cityId': instance.cityId,
      'otherCity': instance.otherCity,
      'idNumber': instance.idNumber,
      'birthDate': instance.birthDate,
      'englishLevel': instance.englishLevel,
      'computerLevel': instance.computerLevel,
      'email': instance.email,
      'gender': instance.gender,
      'currentSituation': instance.currentSituation,
      'qualificationData': instance.qualificationData,
      'qualificationName': instance.qualificationName,
      'listOfJob': instance.listOfJob,
      'isHijri': instance.isHijri,
      'length': instance.length,
      'wieght': instance.weight,
      'districtId': instance.districtId,
      'favourateHours': instance.favourateHours,
      'timeWorkId': instance.timeWorkId,
    };
