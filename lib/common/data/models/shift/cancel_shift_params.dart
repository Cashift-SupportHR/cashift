import 'package:json_annotation/json_annotation.dart'; 

part 'cancel_shift_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CancelShiftParams {
  @JsonKey(name: 'id')
  final  int id;
  @JsonKey(name: 'description')
  final  String description;

  CancelShiftParams({required this.id, required this.description});

  factory CancelShiftParams.fromJson(Map<String, dynamic> json) => _$CancelShiftParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CancelShiftParamsToJson(this);
}

