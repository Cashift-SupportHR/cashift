// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bail_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BailRequestDto _$BailRequestDtoFromJson(Map<String, dynamic> json) =>
    BailRequestDto(
      id: (json['id'] as num?)?.toInt(),
      freelanceName: json['freelanceName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      descriptionRequest: json['descriptionRequest'] as String?,
      totalMoney: (json['totalMoney'] as num?)?.toInt(),
      totalInstallment: (json['totalInstallment'] as num?)?.toInt(),
      statusName: json['statusName'] as String?,
      descriptionReject: json['descriptionReject'] as String?,
    );

Map<String, dynamic> _$BailRequestDtoToJson(BailRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'freelanceName': instance.freelanceName,
      'phoneNumber': instance.phoneNumber,
      'descriptionRequest': instance.descriptionRequest,
      'totalMoney': instance.totalMoney,
      'totalInstallment': instance.totalInstallment,
      'statusName': instance.statusName,
      'descriptionReject': instance.descriptionReject,
    };
