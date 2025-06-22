// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_shift_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndShiftParams _$EndShiftParamsFromJson(Map<String, dynamic> json) =>
    EndShiftParams(
      id: (json['id'] as num?)?.toInt(),
      endTimeLatitude: json['endTimeLatitude'] as String?,
      endTimeLongtude: json['endTimeLongtude'] as String?,
      projectId: json['projectId'] as String?,
    );

Map<String, dynamic> _$EndShiftParamsToJson(EndShiftParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endTimeLatitude': instance.endTimeLatitude,
      'endTimeLongtude': instance.endTimeLongtude,
      'projectId': instance.projectId,
    };
