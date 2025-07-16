import 'package:json_annotation/json_annotation.dart'; 

part 'add_round_trip_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddRoundTripParams {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'vehiclesZoneId')
  int? vehiclesZoneId;
  @JsonKey(name: 'roundTyepId')
  int? roundTypeId;
  @JsonKey(name: 'vehicleHandoverId')
  int? vehicleHandoverId;

  AddRoundTripParams({this.id, this.vehiclesZoneId, this.roundTypeId, this.vehicleHandoverId});

   factory AddRoundTripParams.fromJson(Map<String, dynamic> json) => _$AddRoundTripParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddRoundTripParamsToJson(this);
}

