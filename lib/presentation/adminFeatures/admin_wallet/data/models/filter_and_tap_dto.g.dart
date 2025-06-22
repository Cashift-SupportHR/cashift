// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_and_tap_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterAndTapDto _$FilterAndTapDtoFromJson(Map<String, dynamic> json) =>
    FilterAndTapDto(
      filters: (json['filters'] as List<dynamic>?)
          ?.map(
              (e) => FiltersAdminWalletDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tabs: (json['tabs'] as List<dynamic>?)
          ?.map((e) => TabAdminWalletDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterAndTapDtoToJson(FilterAndTapDto instance) =>
    <String, dynamic>{
      'filters': instance.filters,
      'tabs': instance.tabs,
    };

FiltersAdminWalletDto _$FiltersAdminWalletDtoFromJson(
        Map<String, dynamic> json) =>
    FiltersAdminWalletDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FiltersAdminWalletDtoToJson(
        FiltersAdminWalletDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TabAdminWalletDto _$TabAdminWalletDtoFromJson(Map<String, dynamic> json) =>
    TabAdminWalletDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TabAdminWalletDtoToJson(TabAdminWalletDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
