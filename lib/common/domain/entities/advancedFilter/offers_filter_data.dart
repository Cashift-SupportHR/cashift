
import 'package:shiftapp/common/data/models/advancedFilter/company_filter_data.dart';
import 'package:shiftapp/common/data/models/advancedFilter/job_filter_data.dart';

import '../../../data/models/advancedFilter/index.dart';

class OffersFilterData{
  List<JobFilterData>? jobs;
  List<CompanyFilterData>? company;

  OffersFilterData({
    required Map<String , dynamic> jsonMap,
    this.jobs, this.company});

  factory OffersFilterData.fromDto(OffersFilterDataDto dto) {
    return OffersFilterData(
     company: dto.company!.map((e) => CompanyFilterData.fromJson(e.toJson())).toList(),
      jobs: dto.jobs!.map((e) => JobFilterData.fromJson(e.toJson())).toList(),
      jsonMap: dto.toJson(),
    );
  }

}