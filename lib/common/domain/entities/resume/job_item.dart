import 'package:json_annotation/json_annotation.dart'; 

part 'job_item.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class JobItem {
  @JsonKey(name: 'id')
  final  int? id;
  @JsonKey(name: 'jobName')
  final  String? jobName;
  @JsonKey(name: 'imagePath')
  final  String? imagePath;

  JobItem({this.id,this.jobName, this.imagePath});

  factory JobItem.fromJson(Map<String, dynamic> json) => _$JobItemFromJson(json);

  Map<String, dynamic> toJson() => _$JobItemToJson(this);
}

