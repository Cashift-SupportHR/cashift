// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popup_employment_management_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopupEmploymentManagementDto _$PopupEmploymentManagementDtoFromJson(
  Map<String, dynamic> json,
) => PopupEmploymentManagementDto(
  blockDto: json['block'] == null
      ? null
      : BlockDto.fromJson(json['block'] as Map<String, dynamic>),
  faceDto: json['face'] == null
      ? null
      : FaceDto.fromJson(json['face'] as Map<String, dynamic>),
  updateDto: json['update'] == null
      ? null
      : UpdateDto.fromJson(json['update'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PopupEmploymentManagementDtoToJson(
  PopupEmploymentManagementDto instance,
) => <String, dynamic>{
  'block': instance.blockDto,
  'face': instance.faceDto,
  'update': instance.updateDto,
};

BlockDto _$BlockDtoFromJson(Map<String, dynamic> json) => BlockDto(
  headerLabel: json['headerLabel'] as String?,
  detailsLabel: json['detailsLabel'] as String?,
  icon: json['icon'] as String?,
  canelButtonName: json['canelButtonName'] as String?,
  confirmButtonName: json['confirmButtonName'] as String?,
);

Map<String, dynamic> _$BlockDtoToJson(BlockDto instance) => <String, dynamic>{
  'headerLabel': instance.headerLabel,
  'detailsLabel': instance.detailsLabel,
  'icon': instance.icon,
  'canelButtonName': instance.canelButtonName,
  'confirmButtonName': instance.confirmButtonName,
};

FaceDto _$FaceDtoFromJson(Map<String, dynamic> json) => FaceDto(
  headerLabel: json['headerLabel'] as String?,
  detailsLabel: json['detailsLabel'] as String?,
  icon: json['icon'] as String?,
  canelButtonName: json['canelButtonName'] as String?,
  confirmButtonName: json['confirmButtonName'] as String?,
);

Map<String, dynamic> _$FaceDtoToJson(FaceDto instance) => <String, dynamic>{
  'headerLabel': instance.headerLabel,
  'detailsLabel': instance.detailsLabel,
  'icon': instance.icon,
  'canelButtonName': instance.canelButtonName,
  'confirmButtonName': instance.confirmButtonName,
};

UpdateDto _$UpdateDtoFromJson(Map<String, dynamic> json) => UpdateDto(
  headerLabel: json['headerLabel'] as String?,
  detailsLabel: json['detailsLabel'] as String?,
  icon: json['icon'] as String?,
  canelButtonName: json['canelButtonName'] as String?,
  confirmButtonName: json['confirmButtonName'] as String?,
);

Map<String, dynamic> _$UpdateDtoToJson(UpdateDto instance) => <String, dynamic>{
  'headerLabel': instance.headerLabel,
  'detailsLabel': instance.detailsLabel,
  'icon': instance.icon,
  'canelButtonName': instance.canelButtonName,
  'confirmButtonName': instance.confirmButtonName,
};
