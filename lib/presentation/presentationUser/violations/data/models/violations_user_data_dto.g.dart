// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violations_user_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViolationsUserDataDto _$ViolationsUserDataDtoFromJson(
  Map<String, dynamic> json,
) => ViolationsUserDataDto(
  description: json['description'] as String?,
  apply: (json['apply'] as List<dynamic>?)
      ?.map((e) => ViolationUserDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ViolationsUserDataDtoToJson(
  ViolationsUserDataDto instance,
) => <String, dynamic>{
  'description': instance.description,
  'apply': instance.apply,
};
