// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emp_attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmpAttendanceDto _$EmpAttendanceDtoFromJson(Map<String, dynamic> json) =>
    EmpAttendanceDto(
      scheduleEmpWorkId: (json['scheduleEmpWorkId'] as num?)?.toInt(),
      scheduleEmpWorkName: json['scheduleEmpWorkName'] as String?,
      scheduleEmpWorkPhoneNumber: json['scheduleEmpWorkPhoneNumber'] as String?,
      scheduleEmpWorkProfileIamge:
          json['scheduleEmpWorkProfileIamge'] as String?,
      status: json['status'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      shiftId: (json['shiftId'] as num?)?.toInt(),
      shiftName: json['shiftName'] as String?,
      paymentPeriodTypeId: (json['paymentPeriodTypeId'] as num?)?.toInt(),
      paymentPeriodTypeName: json['paymentPeriodTypeName'] as String?,
      transactionsList: (json['transactionsList'] as List<dynamic>?)
          ?.map((e) => TransactionsListDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmpAttendanceDtoToJson(EmpAttendanceDto instance) =>
    <String, dynamic>{
      'scheduleEmpWorkId': instance.scheduleEmpWorkId,
      'scheduleEmpWorkName': instance.scheduleEmpWorkName,
      'scheduleEmpWorkPhoneNumber': instance.scheduleEmpWorkPhoneNumber,
      'scheduleEmpWorkProfileIamge': instance.scheduleEmpWorkProfileIamge,
      'status': instance.status,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'shiftId': instance.shiftId,
      'shiftName': instance.shiftName,
      'paymentPeriodTypeId': instance.paymentPeriodTypeId,
      'paymentPeriodTypeName': instance.paymentPeriodTypeName,
      'transactionsList': instance.transactionsList,
    };

TransactionsListDto _$TransactionsListDtoFromJson(Map<String, dynamic> json) =>
    TransactionsListDto(
      vactionType: json['vactionType'] as String?,
      projectName: json['projectName'] as String?,
      shiftName: json['shiftName'] as String?,
      fullDates: json['fullDates'] as String?,
      checkIn: json['checkIn'] as String?,
      checkOut: json['checkOut'] as String?,
    );

Map<String, dynamic> _$TransactionsListDtoToJson(
        TransactionsListDto instance) =>
    <String, dynamic>{
      'projectName': instance.projectName,
      'shiftName': instance.shiftName,
      'vactionType': instance.vactionType,
      'fullDates': instance.fullDates,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
    };
