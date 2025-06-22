// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_block_employee_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBlockEmployeeParams _$AddBlockEmployeeParamsFromJson(
        Map<String, dynamic> json) =>
    AddBlockEmployeeParams(
      freeLancerId: (json['freeLancerId'] as num?)?.toInt(),
      banReason: json['banReason'] as String?,
    );

Map<String, dynamic> _$AddBlockEmployeeParamsToJson(
        AddBlockEmployeeParams instance) =>
    <String, dynamic>{
      'freeLancerId': instance.freeLancerId,
      'banReason': instance.banReason,
    };
