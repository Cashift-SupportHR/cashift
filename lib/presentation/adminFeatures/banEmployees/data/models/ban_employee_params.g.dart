// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ban_employee_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanEmployeeParams _$BanEmployeeParamsFromJson(Map<String, dynamic> json) =>
    BanEmployeeParams(
      type: (json['type'] as num?)?.toInt(),
      search: json['search'] as String?,
      pageNumber: (json['pageNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BanEmployeeParamsToJson(BanEmployeeParams instance) =>
    <String, dynamic>{
      'type': instance.type,
      'search': instance.search,
      'pageNumber': instance.pageNumber,
    };
