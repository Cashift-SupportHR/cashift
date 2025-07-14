// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resume _$ResumeFromJson(Map<String, dynamic> json) => Resume(
      id: (json['id'] as num?)?.toInt(),
      phoneNumber: json['phoneNumber'] as String?,
      whatsAppNumber: json['whatsAppNumber'] as String?,
      cityId: (json['cityId'] as num?)?.toInt(),
      birthDateHijri: json['birthDateHijri'] as String?,
      idNumber: json['idNumber'] as String?,
      birthDateString: json['birthDateString'] as String?,
      qualificationId: (json['qualificationData'] as num?)?.toInt(),
      length: (json['length'] as num?)?.toInt(),
      wieght: (json['wieght'] as num?)?.toInt(),
      englishLevel: (json['englishLevelId'] as num?)?.toInt(),
      computerLevel: (json['computerLevelId'] as num?)?.toInt(),
      idBank: json['idBank'] as String?,
      gender: json['gender'] as bool?,
      name: json['nameAr'] as String?,
      email: json['email'] as String?,
      jobs: (json['listOfJob'] as List<dynamic>?)
          ?.map((e) => JobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentSituation: (json['currentSituation'] as num?)?.toInt(),
      qualificationName: json['qualificationName'] as String?,
      isHijri: json['isHijri'] as bool?,
      haveInterView: json['haveInterView'] as bool?,
      districtId: (json['districtId'] as num?)?.toInt(),
      favourateHours: (json['favourateHours'] as num?)?.toInt(),
      timeWorkId: (json['timeWorkId'] as num?)?.toInt(),
    )
      ..cityName = json['cityName'] as String?
      ..qualificationDataName = json['qualificationDataName'] as String?
      ..englishLevelName = json['englishLevelName'] as String?
      ..computerLevelName = json['computerLevelName'] as String?
      ..genderName = json['genderName'] as String?;

Map<String, dynamic> _$ResumeToJson(Resume instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'nameAr': instance.name,
      'email': instance.email,
      'whatsAppNumber': instance.whatsAppNumber,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'idNumber': instance.idNumber,
      'birthDateString': instance.birthDateString,
      'birthDateHijri': instance.birthDateHijri,
      'qualificationData': instance.qualificationId,
      'currentSituation': instance.currentSituation,
      'qualificationDataName': instance.qualificationDataName,
      'qualificationName': instance.qualificationName,
      'length': instance.length,
      'wieght': instance.wieght,
      'englishLevelId': instance.englishLevel,
      'computerLevelId': instance.computerLevel,
      'englishLevelName': instance.englishLevelName,
      'computerLevelName': instance.computerLevelName,
      'idBank': instance.idBank,
      'genderName': instance.genderName,
      'gender': instance.gender,
      'listOfJob': instance.jobs,
      'isHijri': instance.isHijri,
      'haveInterView': instance.haveInterView,
      'districtId': instance.districtId,
      'favourateHours': instance.favourateHours,
      'timeWorkId': instance.timeWorkId,
    };
