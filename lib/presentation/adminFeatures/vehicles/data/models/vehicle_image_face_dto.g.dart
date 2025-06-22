// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_image_face_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleImageFaceDto _$VehicleImageFaceDtoFromJson(Map<String, dynamic> json) =>
    VehicleImageFaceDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      imageFace: json['imageFace'] as String?,
    );

Map<String, dynamic> _$VehicleImageFaceDtoToJson(
        VehicleImageFaceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageFace': instance.imageFace,
    };
