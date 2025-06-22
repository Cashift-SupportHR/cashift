// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_project_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProjectParams _$AddProjectParamsFromJson(Map<String, dynamic> json) =>
    AddProjectParams(
      id: (json['id'] as num?)?.toInt(),
      brandId: (json['brandId'] as num?)?.toInt(),
      companyId: (json['CompanyId'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      brandName: json['brandName'] as String?,
      cityName: json['cityName'] as String?,
      nameEn: json['nameEn'] as String?,
      nameAr: json['nameAr'] as String?,
      addressEn: json['addressEn'] as String?,
      addressAr: json['addressAr'] as String?,
      latitude: json['latitude'] as String?,
      longtude: json['longtude'] as String?,
      attendanceTypeId: (json['attendanceTypeId'] as num?)?.toInt(),
      otherProject: (json['otherProject'] as List<dynamic>?)
          ?.map(
              (e) => LocationProjectParams.fromJson(e as Map<String, dynamic>))
          .toList(),
      companyName: json['companyName'] as String?,
      image: json['image'] as String?,
      imageURL: json['imageURL'] as String?,
    );

Map<String, dynamic> _$AddProjectParamsToJson(AddProjectParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'CompanyId': instance.companyId,
      'brandId': instance.brandId,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'companyName': instance.companyName,
      'brandName': instance.brandName,
      'nameEn': instance.nameEn,
      'nameAr': instance.nameAr,
      'addressEn': instance.addressEn,
      'addressAr': instance.addressAr,
      'latitude': instance.latitude,
      'longtude': instance.longtude,
      'attendanceTypeId': instance.attendanceTypeId,
      'otherProject': instance.otherProject,
      'image': instance.image,
      'imageURL': instance.imageURL,
    };
