import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cashier.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class Cashier {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'companyId')
  final  int? companyId;
  @JsonKey(name: 'companyName')
  final  String? companyName;
  @JsonKey(name: 'name')
  final  String? name;
  @JsonKey(name: 'address')
  final  String? address;
  @JsonKey(name: 'email')
  final  String? email;
  @JsonKey(name: 'cityName')
  final  String? cityName;
  @JsonKey(name: 'phone')
  final  String? phone;
  @JsonKey(name: 'latitude')
  final  double? latitude;
  @JsonKey(name: 'longtude')
  final  double? longtude;

  double getLatitude()=> latitude??0.0;
  double getLongitude()=>  longtude??0.0;
  LatLng getLatLng()=>LatLng(getLatitude(),getLongitude()) ;
  Cashier({this.id, this.companyId, this.companyName, this.name, this.address, this.email, this.cityName, this.phone, this.latitude, this.longtude});

  factory Cashier.fromJson(Map<String, dynamic> json) => _$CashierFromJson(json);

  Map<String, dynamic> toJson() => _$CashierToJson(this);
}

