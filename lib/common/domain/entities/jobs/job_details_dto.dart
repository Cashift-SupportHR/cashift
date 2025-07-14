import 'package:json_annotation/json_annotation.dart';
import 'package:shiftapp/common/domain/entities/job_offers/job_offer_dto.dart';
import 'package:shiftapp/common/domain/entities/jobs/company_info.dart';

part 'job_details_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class JobDetailsDto {

  @JsonKey(name: 'companyInfo')
  final  CompanyInfo? companyInfo;
  @JsonKey(name: 'opportuntyAvalibleDetail')
  final  JobOfferDto? jobInfo;
  @JsonKey(name: 'availableJob')
  final  List<JobOfferDto>? availableJob;
  @JsonKey(name: 'conditionName')
  final  List<String>? conditionName;

  JobDetailsDto({this.conditionName,this.companyInfo, this.availableJob , this.jobInfo});

  factory JobDetailsDto.fromJson(Map<String, dynamic> json) => _$JobDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$JobDetailsDtoToJson(this);
}








