// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_gate_project_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationGateProjectDto _$LocationGateProjectDtoFromJson(
        Map<String, dynamic> json) =>
    LocationGateProjectDto(
      companyName: json['companyName'] as String?,
      projectName: json['projectName'] as String?,
      mainLocation: json['mainLocation'] == null
          ? null
          : MainLocation.fromJson(json['mainLocation'] as Map<String, dynamic>),
      projectCode: json['projectCode'] as String?,
      locationsProject: (json['locationsProject'] as List<dynamic>?)
          ?.map((e) => LocationsProject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationGateProjectDtoToJson(
        LocationGateProjectDto instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'projectName': instance.projectName,
      'mainLocation': instance.mainLocation,
      'projectCode': instance.projectCode,
      'locationsProject': instance.locationsProject,
    };

MainLocation _$MainLocationFromJson(Map<String, dynamic> json) => MainLocation(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$MainLocationToJson(MainLocation instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

LocationsProject _$LocationsProjectFromJson(Map<String, dynamic> json) =>
    LocationsProject(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      name: json['name'] as String?,
      locationProjectCode: json['locationProjectCode'] as String?,
      countOfEmployee: (json['countOfEmployee'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LocationsProjectToJson(LocationsProject instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'locationProjectCode': instance.locationProjectCode,
      'countOfEmployee': instance.countOfEmployee,
    };
