// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ban_employee_tab_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BanEmployeeTabDto _$BanEmployeeTabDtoFromJson(Map<String, dynamic> json) =>
    BanEmployeeTabDto(
      name: json['name'] as String?,
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BanEmployeeTabDtoToJson(BanEmployeeTabDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'total': instance.total,
    };
