// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeChashifterDataDto _$EmployeeChashifterDataDtoFromJson(
        Map<String, dynamic> json) =>
    EmployeeChashifterDataDto(
      id: (json['id'] as num?)?.toInt(),
      freelanceId: (json['freelanceId'] as num?)?.toInt(),
      idNumber: json['idNumber'] as String?,
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      qualificationDataName: json['qualificationDataName'] as String?,
      favourateJob: json['favourateJob'] as String?,
      age: json['age'] as String?,
      cityName: json['cityName'] as String?,
      national: json['national'] as String?,
      length: json['length'] as String?,
      wieght: json['wieght'] as String?,
    );

Map<String, dynamic> _$EmployeeChashifterDataDtoToJson(
        EmployeeChashifterDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'freelanceId': instance.freelanceId,
      'idNumber': instance.idNumber,
      'name': instance.name,
      'logo': instance.logo,
      'phone': instance.phone,
      'email': instance.email,
      'qualificationDataName': instance.qualificationDataName,
      'favourateJob': instance.favourateJob,
      'age': instance.age,
      'cityName': instance.cityName,
      'national': instance.national,
      'length': instance.length,
      'wieght': instance.wieght,
    };
