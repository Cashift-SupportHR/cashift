// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_logistics_prams.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddLogisticPrams _$AddLogisticPramsFromJson(Map<String, dynamic> json) =>
    AddLogisticPrams(
      jobOfferCarTypeId: (json['jobOfferCarTypeId'] as num?)?.toInt(),
      license: json['license'] == null
          ? null
          : License.fromJson(json['license'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      preferredDistrictIds: (json['preferredDistrictIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      termsAccepted: json['termsAccepted'] as bool?,
         );

Map<String, dynamic> _$AddLogisticPramsToJson(AddLogisticPrams instance) =>
    <String, dynamic>{
      'jobOfferCarTypeId': instance.jobOfferCarTypeId,
      'license': instance.license,
      'location': instance.location,
      'preferredDistrictIds': instance.preferredDistrictIds,
      'termsAccepted': instance.termsAccepted,
     };

License _$LicenseFromJson(Map<String, dynamic> json) => License(
      licenseNumber: json['licenseNumber'] as String?,
      expiryDate: json['expiryDate'] as String?,
    );

Map<String, dynamic> _$LicenseToJson(License instance) => <String, dynamic>{
      'licenseNumber': instance.licenseNumber,
      'expiryDate': instance.expiryDate,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      cityId: (json['cityId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'cityId': instance.cityId,
    };
