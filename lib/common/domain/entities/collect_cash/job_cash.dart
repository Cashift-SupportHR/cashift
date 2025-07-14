import 'package:json_annotation/json_annotation.dart'; 

part 'job_cash.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class JobCash {
  @JsonKey(name: 'projectId')
  final  int? projectId;
  @JsonKey(name: 'freeLanceApplyId')
  final  int? freeLanceApplyId;
  @JsonKey(name: 'money')
  final  double? money;
  @JsonKey(name: 'statusName')
  final  String? statusName;
  @JsonKey(name: 'statusCode')
  final  int? statusCode;
  @JsonKey(name: 'projectName')
  final  String? projectName;
  @JsonKey(name: 'jobName')
  final  String? jobName;
  @JsonKey(name: 'city')
  final  String? city;
  @JsonKey(name: 'freelanceName')
  final  String? freelanceName;



  JobCash({this.projectId, this.money,this.freeLanceApplyId ,  this.statusName,this.statusCode ,  this.projectName,  this.jobName, this.city, this.freelanceName});

  factory JobCash.fromJson(Map<String, dynamic> json) => _$JobCashFromJson(json);

  Map<String, dynamic> toJson() => _$JobCashToJson(this);
}

