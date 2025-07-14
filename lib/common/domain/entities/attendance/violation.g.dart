// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Violation _$ViolationFromJson(Map<String, dynamic> json) => Violation(
      violationName: json['violationName'] as String?,
      violationDescription: json['violationDescription'] as String?,
      violationDate: json['violationDate'] as String?,
      violationRepeated: json['violationRepeated'] as String?,
    );

Map<String, dynamic> _$ViolationToJson(Violation instance) => <String, dynamic>{
      'violationName': instance.violationName,
      'violationDescription': instance.violationDescription,
      'violationDate': instance.violationDate,
      'violationRepeated': instance.violationRepeated,
    };
