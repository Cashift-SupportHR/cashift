// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ban_employee_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanEmployeeDetailsDto _$BanEmployeeDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    BanEmployeeDetailsDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      email: json['email'] as String?,
      idNumber: json['idNumber'] as String?,
      city: json['city'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birthDate'] as String?,
      age: json['age'] as String?,
      computerLevel: json['computerLevel'] as String?,
      currentSituation: json['currentSituation'] as String?,
      englishLevel: json['englishLevel'] as String?,
      educationLevel: json['educationLevel'] as String?,
      favourateJob: json['favourateJob'] as String?,
      freelanceApply: (json['freelanceApply'] as List<dynamic>?)
          ?.map(
              (e) => StatisticsBanEmployee.fromJson(e as Map<String, dynamic>))
          .toList(),
      numPreviousOpportunities: (json['numOpportunities'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BanEmployeeDetailsDtoToJson(
        BanEmployeeDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
      'email': instance.email,
      'idNumber': instance.idNumber,
      'city': instance.city,
      'gender': instance.gender,
      'birthDate': instance.birthDate,
      'age': instance.age,
      'computerLevel': instance.computerLevel,
      'currentSituation': instance.currentSituation,
      'englishLevel': instance.englishLevel,
      'educationLevel': instance.educationLevel,
      'favourateJob': instance.favourateJob,
      'freelanceApply': instance.freelanceApply,
      'numOpportunities': instance.numPreviousOpportunities,
    };

StatisticsBanEmployee _$StatisticsBanEmployeeFromJson(
        Map<String, dynamic> json) =>
    StatisticsBanEmployee(
      name: json['name'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
      label: json['label'] as String?,
    );

Map<String, dynamic> _$StatisticsBanEmployeeToJson(
        StatisticsBanEmployee instance) =>
    <String, dynamic>{
      'name': instance.name,
      'percentage': instance.percentage,
      'count': instance.count,
      'label': instance.label,
    };
