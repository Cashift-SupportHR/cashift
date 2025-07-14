import 'package:json_annotation/json_annotation.dart'; 

part 'end_shift_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class EndShiftParams {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'endTimeLatitude')
  final  String? endTimeLatitude;
  @JsonKey(name: 'endTimeLongtude')
  final  String? endTimeLongtude;
  @JsonKey(name: 'projectId')
  final  String? projectId;
  EndShiftParams({this.id, this.endTimeLatitude, this.endTimeLongtude,this.projectId});

  factory EndShiftParams.fromJson(Map<String, dynamic> json) => _$EndShiftParamsFromJson(json);

  Map<String, dynamic> toJson() => _$EndShiftParamsToJson(this);
}

