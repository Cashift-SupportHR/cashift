// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_employee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftEmployeeDto _$ShiftEmployeeDtoFromJson(Map<String, dynamic> json) =>
    ShiftEmployeeDto(
      shiftId: (json['shiftId'] as num?)?.toInt(),
      shiftName: json['shiftName'] as String?,
    );

Map<String, dynamic> _$ShiftEmployeeDtoToJson(ShiftEmployeeDto instance) =>
    <String, dynamic>{
      'shiftId': instance.shiftId,
      'shiftName': instance.shiftName,
    };
