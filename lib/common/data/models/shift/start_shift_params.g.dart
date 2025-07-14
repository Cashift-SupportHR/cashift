// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_shift_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartShiftParams _$StartShiftParamsFromJson(Map<String, dynamic> json) =>
    StartShiftParams(
      id: (json['id'] as num?)?.toInt(),
      startTimeLatitude: json['startTimeLatitude'] as String?,
      startTimeLongtude: json['startTimeLongtude'] as String?,
      projectId: json['projectId'] as String?,
      isMock: json['isMock'] as bool?,
    );

Map<String, dynamic> _$StartShiftParamsToJson(StartShiftParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startTimeLatitude': instance.startTimeLatitude,
      'startTimeLongtude': instance.startTimeLongtude,
      'projectId': instance.projectId,
      'isMock': instance.isMock,
    };
