import 'package:json_annotation/json_annotation.dart'; 

part 'confirm_activity_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ConfirmActivityParams {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'statusId')
  final  int? statusId;
//  "description": "string"
  @JsonKey(name: 'description')
  final  String? description;
  @JsonKey(name: 'latitude')
  final  double? latitude;
  @JsonKey(name: 'longtude')
  final  double? longitude;

  ConfirmActivityParams({this.id, this.statusId ,this.description , this.latitude , this.longitude});

  factory ConfirmActivityParams.fromJson(Map<String, dynamic> json) => _$ConfirmActivityParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmActivityParamsToJson(this);
}



