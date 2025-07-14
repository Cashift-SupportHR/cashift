import 'package:json_annotation/json_annotation.dart';

part 'opportunity_details.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class OpportunityDetails {

  @JsonKey(name: 'companyName')
  final String? companyName;
  @JsonKey(name: 'opportunityName')
  final String? opportunityName;
  @JsonKey(name: 'deservedAmount')
  final String? deservedAmount;
  @JsonKey(name: 'startWork')
  final String? startWork;
  @JsonKey(name: 'endWork')
  final String? endWork;

  OpportunityDetails(this.companyName, this.opportunityName,
      this.deservedAmount, this.startWork, this.endWork);

  factory OpportunityDetails.fromJson(Map<String, dynamic> json) =>
      _$OpportunityDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$OpportunityDetailsToJson(this);
}
