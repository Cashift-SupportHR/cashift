import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_info.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CompanyInfo {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'companyName')
  final  String? companyName;
  @JsonKey(name: 'fieldType')
  final  String? fieldType;
  @JsonKey(name: 'section')
  final  String? section;
  @JsonKey(name: 'description')
  final  String? description;
  @JsonKey(name: 'address')
  final  String? address;
  @JsonKey(name: 'longtude')
  final  double? longtude;
  @JsonKey(name: 'latitude')
  final  double? latitude;

  CompanyInfo({this.id, this.companyName, this.fieldType, this.section, this.description, this.address, this.longtude, this.latitude});

  factory CompanyInfo.fromJson(Map<String, dynamic> json) => _$CompanyInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyInfoToJson(this);

  LatLng location()  =>LatLng(latitude!,longtude!);
}