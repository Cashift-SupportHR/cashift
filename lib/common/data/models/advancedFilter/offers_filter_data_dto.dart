import 'package:json_annotation/json_annotation.dart';
import 'company_filter_data.dart';
import 'job_filter_data.dart';
part 'offers_filter_data_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class OffersFilterDataDto {
  @JsonKey(name: 'jobs')
  List<JobFilterData>? jobs;
  @JsonKey(name: 'company')
  List<CompanyFilterData>? company;

  OffersFilterDataDto({this.jobs, this.company});

   factory OffersFilterDataDto.fromJson(Map<String, dynamic> json) => _$OffersFilterDataDtoFromJson(json);

   Map<String, dynamic> toJson() => _$OffersFilterDataDtoToJson(this);
}




