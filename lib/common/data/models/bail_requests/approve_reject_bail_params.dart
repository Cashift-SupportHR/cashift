import 'package:json_annotation/json_annotation.dart'; 

part 'approve_reject_bail_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ApproveRejectBailParams {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'isApprove')
  bool? isApprove;
  @JsonKey(name: 'description')
  String? description;

  ApproveRejectBailParams({this.id, this.isApprove, this.description});

   factory ApproveRejectBailParams.fromJson(Map<String, dynamic> json) => _$ApproveRejectBailParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ApproveRejectBailParamsToJson(this);
}

