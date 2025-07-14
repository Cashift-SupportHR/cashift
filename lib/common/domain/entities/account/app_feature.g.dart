// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppFeature _$AppFeatureFromJson(Map<String, dynamic> json) => AppFeature(
      bankAccountEnable: json['bankAccountEnable'] as bool,
      isAllowFaceRecognition: json['isAllowFaceRecognition'] as bool?,
      rateEnable: json['rateEnable'] as bool?,
      adminEnable: json['adminEnable'] as bool?,
    );

Map<String, dynamic> _$AppFeatureToJson(AppFeature instance) =>
    <String, dynamic>{
      'bankAccountEnable': instance.bankAccountEnable,
      'rateEnable': instance.rateEnable,
      'adminEnable': instance.adminEnable,
      'isAllowFaceRecognition': instance.isAllowFaceRecognition,
    };
