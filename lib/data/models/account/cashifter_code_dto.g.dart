// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashifter_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashifterCodeDto _$CashifterCodeDtoFromJson(Map<String, dynamic> json) =>
    CashifterCodeDto(
      header: json['header'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CashifterCodeDtoToJson(CashifterCodeDto instance) =>
    <String, dynamic>{
      'header': instance.header,
      'code': instance.code,
      'description': instance.description,
    };
