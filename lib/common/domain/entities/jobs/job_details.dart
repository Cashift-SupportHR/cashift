import 'package:shiftapp/common/domain/entities/job_offers/job_offer_dto.dart';
import 'package:shiftapp/common/domain/entities/jobs/company_info.dart';

class JobDetail {
  final CompanyInfo companyInfo;
  final JobOfferDto jobOffer;
  final List<JobOfferDto>? availableJob;
  final List<String>? conditionName;
  final bool ?  special ;

  JobDetail(
      {required this.companyInfo,
      required this.jobOffer,
        this.special ,
        this.conditionName ,
      required this.availableJob});
}
