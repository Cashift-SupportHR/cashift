import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/domain/entities/jobs/interview_info.dart';
import 'package:shiftapp/common/domain/entities/terms/terms_item.dart';

part 'job_terms.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class JobTerms {

  /**
   * when value equale to `1` this main this terms is main terms and
   * user just needed to read and accept
   *
   * * when value equale to `2` this main this terms is specific conditions  for this jobs
   * user needed to make interview
   *
   * 3
   * **/
  @JsonKey(name: 'statusId')
  final  int? statusId;
  @JsonKey(name: 'companyLogo')
  final  String? companyLogo;
  @JsonKey(name: 'supLogo')
  final  String? supLogo;
  @JsonKey(name: 'mainLabel')
  final  String? mainLabel;
  @JsonKey(name: 'subMainLabel')
  final  String? subMainLabel;
  @JsonKey(name: 'companyName')
  final  String? companyName;
  @JsonKey(name: 'recruitment')
  final  InterviewInfo? interviewInfo;

  @JsonKey(name: 'conditionName')
  final  List<String>? conditions;

  JobTerms({this.statusId , this.companyLogo, this.supLogo, this.mainLabel, this.subMainLabel, this.companyName, this.conditions ,this.interviewInfo});


  bool requiredInterview(){
    return statusId ==2 ;
  }
  bool hasPreviousRequestInterview(){
    return statusId ==3 ;
  }

  List<TermsItem> ? toTermsObject()=>conditions?.map((e) => TermsItem(conditionName: e)).toList();

  factory JobTerms.fromJson(Map<String, dynamic> json) => _$JobTermsFromJson(json);

  Map<String, dynamic> toJson() => _$JobTermsToJson(this);
}

