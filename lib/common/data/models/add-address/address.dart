import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddressDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'langitude')
  String? langitude;
  @JsonKey(name: 'latitude')
  String? latitude;
  @JsonKey(name: 'details')
  String? details;
  @JsonKey(name: 'name')
  String? name;

  AddressDto({this.id, this.langitude, this.latitude, this.details, this.name});

   factory AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

   Map<String, dynamic> toJson() => _$AddressDtoToJson(this);


  LatLng getLatLng() {
    return LatLng(
      double.parse(latitude ?? '0'),
      double.parse(langitude ?? '0'),
    );
  }

}

