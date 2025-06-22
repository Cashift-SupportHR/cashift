// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'free_lance_info_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FreeLanceInfoParams _$FreeLanceInfoParamsFromJson(Map<String, dynamic> json) =>
    FreeLanceInfoParams(
      isWeb: json['isWeb'] as bool?,
      oppId: (json['oppId'] as num?)?.toInt(),
      freeLanceId: (json['freeLanceId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FreeLanceInfoParamsToJson(
        FreeLanceInfoParams instance) =>
    <String, dynamic>{
      'isWeb': instance.isWeb,
      'oppId': instance.oppId,
      'freeLanceId': instance.freeLanceId,
    };
