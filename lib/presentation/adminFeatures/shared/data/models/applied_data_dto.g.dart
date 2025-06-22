// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applied_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppliedDataDto _$AppliedDataDtoFromJson(Map<String, dynamic> json) =>
    AppliedDataDto(
      id: (json['id'] as num?)?.toInt(),
      employeeName: json['employeeName'] as String?,
      freelanceIcon: json['freelanceIcon'] as String?,
      qualification: json['qualification'] as String?,
      cityName: json['cityName'] as String?,
      idNumber: json['idNumber'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      statusName: json['statusName'] as String?,
      status: (json['status'] as num?)?.toInt(),
      deservedAmount: (json['deservedAmount'] as num?)?.toDouble(),
      listAllowEditOpp: (json['listAllowEditOpp'] as List<dynamic>?)
          ?.map((e) => ListAllowEditOppDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppliedDataDtoToJson(AppliedDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeName': instance.employeeName,
      'freelanceIcon': instance.freelanceIcon,
      'qualification': instance.qualification,
      'cityName': instance.cityName,
      'idNumber': instance.idNumber,
      'phoneNumber': instance.phoneNumber,
      'statusName': instance.statusName,
      'status': instance.status,
      'deservedAmount': instance.deservedAmount,
      'listAllowEditOpp': instance.listAllowEditOpp,
    };

ListAllowEditOppDto _$ListAllowEditOppDtoFromJson(Map<String, dynamic> json) =>
    ListAllowEditOppDto(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ListAllowEditOppDtoToJson(
        ListAllowEditOppDto instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'description': instance.description,
    };
