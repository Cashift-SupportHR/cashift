import 'package:json_annotation/json_annotation.dart';

part 'search_opportunities_available_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class SearchOpportunitiesAvailableParams {
  @JsonKey(name: 'cityId')
  int? cityId;
  @JsonKey(name: 'projectId')
  int? projectId;
  @JsonKey(name: 'jobId')
  int? jobId;
  @JsonKey(name: 'companyId')
  int? companyId;
  @JsonKey(name: 'fromDate')
  String? fromDate;
  @JsonKey(name: 'toDate')
  String? toDate;
  @JsonKey(name: 'fromSalary')
  int? fromSalary;
  @JsonKey(name: 'toSalary')
  int? toSalary;

  SearchOpportunitiesAvailableParams({this.cityId, this.projectId, this.jobId, this.companyId, this.fromDate, this.fromSalary, this.toSalary, this.toDate});

  factory SearchOpportunitiesAvailableParams.fromJson(Map<String, dynamic> json) => _$SearchOpportunitiesAvailableParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchOpportunitiesAvailableParamsToJson(this);
}
