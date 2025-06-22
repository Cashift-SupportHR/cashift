// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmployeeDataDto _$EmployeeDataDtoFromJson(Map<String, dynamic> json) =>
    EmployeeDataDto(
      name: json['name'] as String?,
      image: json['image'] as String?,
      mobile: json['mobile'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmployeeDataDtoToJson(EmployeeDataDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'mobile': instance.mobile,
      'image': instance.image,
    };
