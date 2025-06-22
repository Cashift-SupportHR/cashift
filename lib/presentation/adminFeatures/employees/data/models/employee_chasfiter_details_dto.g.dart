// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_chasfiter_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeChasfiterDetailsDto _$EmployeeChasfiterDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    EmployeeChasfiterDetailsDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      idNumber: json['idNumber'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      age: (json['age'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      cityName: json['cityName'] as String?,
      computerLevel: json['computerLevel'] as String?,
      englishLevel: json['englishLevel'] as String?,
      currentSituation: json['currentSituation'] as String?,
      qualificationName: json['qualificationName'] as String?,
      profileImagePath: json['profileImagePath'] as String?,
      favoriteJobs: (json['favoriteJobs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$EmployeeChasfiterDetailsDtoToJson(
        EmployeeChasfiterDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'idNumber': instance.idNumber,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'age': instance.age,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'computerLevel': instance.computerLevel,
      'englishLevel': instance.englishLevel,
      'currentSituation': instance.currentSituation,
      'qualificationName': instance.qualificationName,
      'profileImagePath': instance.profileImagePath,
      'favoriteJobs': instance.favoriteJobs,
    };
