import 'package:json_annotation/json_annotation.dart'; 

part 'update_info_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class UpdateInfoParams {
  @JsonKey(name: 'name')
  final  String? name;
  @JsonKey(name: 'idNumber')
  final  String? idNumber;
  @JsonKey(name: 'email')
  final  String? email;

  UpdateInfoParams({this.name, this.idNumber, this.email});

  factory UpdateInfoParams.fromJson(Map<String, dynamic> json) => _$UpdateInfoParamsFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInfoParamsToJson(this);
}

