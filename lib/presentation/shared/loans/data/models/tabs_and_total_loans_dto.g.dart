// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabs_and_total_loans_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabsAndTotalLoansDto _$TabsAndTotalLoansDtoFromJson(
        Map<String, dynamic> json) =>
    TabsAndTotalLoansDto(
      totalLoans: (json['totalLoans'] as List<dynamic>?)
          ?.map((e) => TotalLoanDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      tabs: (json['tabs'] as List<dynamic>?)
          ?.map((e) => TabLoansDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TabsAndTotalLoansDtoToJson(
        TabsAndTotalLoansDto instance) =>
    <String, dynamic>{
      'totalLoans': instance.totalLoans,
      'tabs': instance.tabs,
    };

TotalLoanDto _$TotalLoanDtoFromJson(Map<String, dynamic> json) => TotalLoanDto(
      label: json['label'] as String?,
      value: json['value'] as num?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$TotalLoanDtoToJson(TotalLoanDto instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'icon': instance.icon,
    };

TabLoansDto _$TabLoansDtoFromJson(Map<String, dynamic> json) => TabLoansDto(
      name: json['name'] as String?,
      value: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TabLoansDtoToJson(TabLoansDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.value,
    };
