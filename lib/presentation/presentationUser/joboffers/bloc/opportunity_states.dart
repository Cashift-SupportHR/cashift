import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../common/domain/entities/job_offers/index.dart';
import '../../../../common/domain/entities/jobs/index.dart';

class AuthorizedToJoinOpportunity extends SuccessStateListener{
  AuthorizedToJoinOpportunity();

}
class OpportunityJoinedSuccess extends SuccessStateListener<String>{
  OpportunityJoinedSuccess({required super.data});
}
class OpportunityRequiredWorkingDocuments extends SuccessStateListener<CheckWorkingDocument>{
  OpportunityRequiredWorkingDocuments({required super.data});
}

class OpportunityRequiredInterview extends SuccessStateListener<InterviewInfo>{
  OpportunityRequiredInterview({required super.data});
}