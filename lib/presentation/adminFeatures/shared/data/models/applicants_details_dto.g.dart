// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicants_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantsDetailsDto _$ApplicantsDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    ApplicantsDetailsDto(
      id: (json['id'] as num?)?.toInt(),
      employeeName: json['employeeName'] as String?,
      totalDeductions: json['totalDeductions'] as num?,
      qualification: json['qualification'] as String?,
      cityName: json['cityName'] as String?,
      idNumber: json['idNumber'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      statusName: json['statusName'] as String?,
      status: (json['status'] as num?)?.toInt(),
      amountViolation: json['amountViolation'] as num?,
      totalDeductMoneyClearanceCertificate:
          json['totalDeductMoneyClearanceCertificate'] as num?,
      totalDeductMoneyCasihftLoanByFreelanceDetails:
          json['totalDeductMoneyCasihftLoanByFreelanceDetails'] as num?,
    );

Map<String, dynamic> _$ApplicantsDetailsDtoToJson(
        ApplicantsDetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeName': instance.employeeName,
      'qualification': instance.qualification,
      'cityName': instance.cityName,
      'idNumber': instance.idNumber,
      'phoneNumber': instance.phoneNumber,
      'statusName': instance.statusName,
      'status': instance.status,
      'amountViolation': instance.amountViolation,
      'totalDeductMoneyClearanceCertificate':
          instance.totalDeductMoneyClearanceCertificate,
      'totalDeductMoneyCasihftLoanByFreelanceDetails':
          instance.totalDeductMoneyCasihftLoanByFreelanceDetails,
      'totalDeductions': instance.totalDeductions,
    };
