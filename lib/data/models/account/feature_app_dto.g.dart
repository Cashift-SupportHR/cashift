// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_app_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureAppDto _$FeatureAppDtoFromJson(Map<String, dynamic> json) =>
    FeatureAppDto(
      faceRecognitionConfig: json['faceRecognitionConfig'] == null
          ? null
          : FaceRecognitionConfig.fromJson(
              json['faceRecognitionConfig'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$FeatureAppDtoToJson(FeatureAppDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'status': instance.status,
      'faceRecognitionConfig': instance.faceRecognitionConfig,
    };

FaceRecognitionConfig _$FaceRecognitionConfigFromJson(
        Map<String, dynamic> json) =>
    FaceRecognitionConfig(
      isAllowFaceRecognition: json['isAllowFaceRecognition'] as bool?,
      eyeCheck: json['eyeCheck'] as bool?,
      moveFace: json['moveFace'] as bool?,
      smile: json['smile'] as bool?,
    );

Map<String, dynamic> _$FaceRecognitionConfigToJson(
        FaceRecognitionConfig instance) =>
    <String, dynamic>{
      'isAllowFaceRecognition': instance.isAllowFaceRecognition,
      'eyeCheck': instance.eyeCheck,
      'moveFace': instance.moveFace,
      'smile': instance.smile,
    };
