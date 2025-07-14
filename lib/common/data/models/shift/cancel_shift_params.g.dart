// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_shift_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelShiftParams _$CancelShiftParamsFromJson(Map<String, dynamic> json) =>
    CancelShiftParams(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$CancelShiftParamsToJson(CancelShiftParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
    };
