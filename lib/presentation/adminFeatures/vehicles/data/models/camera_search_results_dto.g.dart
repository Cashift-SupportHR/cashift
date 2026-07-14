// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_search_results_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CameraSearchResultsDto _$CameraSearchResultsDtoFromJson(
  Map<String, dynamic> json,
) => CameraSearchResultsDto(
  cameraName: json['cameraName'] as String?,
  vehiclePlatNo: json['vehiclePlatNo'] as String?,
  url: json['url'] as String?,
  endTime: json['endTime'] as String?,
);

Map<String, dynamic> _$CameraSearchResultsDtoToJson(
  CameraSearchResultsDto instance,
) => <String, dynamic>{
  'cameraName': instance.cameraName,
  'vehiclePlatNo': instance.vehiclePlatNo,
  'url': instance.url,
  'endTime': instance.endTime,
};
