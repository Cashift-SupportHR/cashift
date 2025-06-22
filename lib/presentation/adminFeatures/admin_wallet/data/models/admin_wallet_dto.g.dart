// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_wallet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminWalletDto _$AdminWalletDtoFromJson(Map<String, dynamic> json) =>
    AdminWalletDto(
      design: (json['design'] as num?)?.toInt(),
      deposit: (json['deposit'] as List<dynamic>?)
          ?.map(
              (e) => DepositAdminWalletDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingPayed: (json['pendingPayed'] as List<dynamic>?)
          ?.map((e) =>
              PendingPayedAdminWalletDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminWalletDtoToJson(AdminWalletDto instance) =>
    <String, dynamic>{
      'design': instance.design,
      'deposit': instance.deposit,
      'pendingPayed': instance.pendingPayed,
    };

DepositAdminWalletDto _$DepositAdminWalletDtoFromJson(
        Map<String, dynamic> json) =>
    DepositAdminWalletDto(
      id: (json['id'] as num?)?.toInt(),
      companyName: json['companyName'] as String?,
      companyLogo: json['companyLogo'] as String?,
      date: json['date'] as String?,
      money: json['money'] as String?,
    );

Map<String, dynamic> _$DepositAdminWalletDtoToJson(
        DepositAdminWalletDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'companyLogo': instance.companyLogo,
      'date': instance.date,
      'money': instance.money,
    };

PendingPayedAdminWalletDto _$PendingPayedAdminWalletDtoFromJson(
        Map<String, dynamic> json) =>
    PendingPayedAdminWalletDto(
      header: json['header'] == null
          ? null
          : HeaderAdminWalletDto.fromJson(
              json['header'] as Map<String, dynamic>),
      body: (json['body'] as List<dynamic>?)
          ?.map((e) => BodyAdminWalletDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      footer: json['footer'] == null
          ? null
          : FooterAdminWalletDto.fromJson(
              json['footer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PendingPayedAdminWalletDtoToJson(
        PendingPayedAdminWalletDto instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
      'footer': instance.footer,
    };

HeaderAdminWalletDto _$HeaderAdminWalletDtoFromJson(
        Map<String, dynamic> json) =>
    HeaderAdminWalletDto(
      companyLogo: json['companyLogo'] as String?,
      projectName: json['projectName'] as String?,
      jobName: json['jobName'] as String?,
    );

Map<String, dynamic> _$HeaderAdminWalletDtoToJson(
        HeaderAdminWalletDto instance) =>
    <String, dynamic>{
      'companyLogo': instance.companyLogo,
      'projectName': instance.projectName,
      'jobName': instance.jobName,
    };

BodyAdminWalletDto _$BodyAdminWalletDtoFromJson(Map<String, dynamic> json) =>
    BodyAdminWalletDto(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$BodyAdminWalletDtoToJson(BodyAdminWalletDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

FooterAdminWalletDto _$FooterAdminWalletDtoFromJson(
        Map<String, dynamic> json) =>
    FooterAdminWalletDto(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$FooterAdminWalletDtoToJson(
        FooterAdminWalletDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };
