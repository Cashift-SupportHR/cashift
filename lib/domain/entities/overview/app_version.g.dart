// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVersion _$AppVersionFromJson(Map<String, dynamic> json) => AppVersion(
      androidVersoin: json['androidVersoin'] as int?,
      androidForceUpdate: json['androidForceUpdate'] as bool?,
      iosVersoin: json['iosVersoin'] as int?,
      iosForceUpdate: json['iosForceUpdate'] as bool?,
    );

Map<String, dynamic> _$AppVersionToJson(AppVersion instance) =>
    <String, dynamic>{
      'androidVersoin': instance.androidVersoin,
      'androidForceUpdate': instance.androidForceUpdate,
      'iosVersoin': instance.iosVersoin,
      'iosForceUpdate': instance.iosForceUpdate,
    };
