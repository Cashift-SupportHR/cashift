import 'package:json_annotation/json_annotation.dart'; 

part 'add_home_location_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddHomeLocationParams {
  @JsonKey(name: 'districtid')
  int? districtid;
  @JsonKey(name: 'cityId')
  int? cityId;
  @JsonKey(name: 'districtName', includeToJson: false)
  String? districtName;
  @JsonKey(name: 'cityName', includeToJson: false)
  String? cityName;
  @JsonKey(name: 'lat')
  double? lat;
  @JsonKey(name: 'lng')
  double? lng;

  AddHomeLocationParams({this.districtid, this.cityId, this.lat, this.lng, this.districtName, this.cityName});

   factory AddHomeLocationParams.fromJson(Map<String, dynamic> json) => _$AddHomeLocationParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddHomeLocationParamsToJson(this);
}

