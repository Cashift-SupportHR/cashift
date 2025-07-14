import 'package:injectable/injectable.dart';
import 'package:shiftapp/common/data/repositories/joboffers/job_offers_repository.dart';
import 'package:shiftapp/common/data/repositories/user/user_repository.dart';

import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../common/data/datasources/remote/resume_not_complete_exception.dart';
import '../../../../common/data/datasources/remote/unauthorized_exception.dart';
import '../../../../common/data/models/advancedFilter/index.dart';
import '../../../../common/data/models/terms/index.dart';
import '../../../../common/domain/entities/job_offers/check_working_document.dart';
import '../../../../common/domain/entities/jobs/index.dart';
import '../../../../core/bloc/base_cubit.dart';
import '../widgets/job_offers_widget_helper.dart';
import 'opportunity_states.dart';

@Injectable()
class JobOffersCubit extends BaseCubit {
  final JobOffersRepository _offersRepository;
  final UserRepository _userRepository;

  JobOffersCubit(this._offersRepository, this._userRepository);

  bool isLogged() => _userRepository.isLogged();

  void createDynamicLink(int id) async {
    emit(LoadingStateListener());
    try {
      final shortLink =
          await JobOfferWidgetHelper.createDynamicLink(id.toString());
      emit(ShareDialogState(url: shortLink));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  void applyOpportunities(int id) async {
    emit(LoadingStateListener());
    try {
      if (_userRepository.getUser()?.isCompeleteProfile == true) {
        final response = await _offersRepository.applyOpportunities(id);
        emit(OpportunityJoinedSuccess(data: response));
      } else if (_userRepository.getUser() == null) {
        emit(FailureStateListener(UnAuthorizedException()));
      } else {
        emit(FailureStateListener(ResumeNotCompletedException()));
      }
    } catch (e, s) {
      print('ErrorDialogState' + s.toString());
      emit(FailureStateListener(e));
    }
  }

  void checkCertificateJob(int id) async {
    emit(LoadingStateListener());
    try {
      final response = await _offersRepository.checkCertificateJob(id);
      if (response.payload != null) {
        final checkWorkingDocument =
            CheckWorkingDocument.fromDto(response.payload!);
        emit(OpportunityRequiredWorkingDocuments(data: checkWorkingDocument));
      } else {
        emit(AuthorizedToJoinOpportunity());
      }
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  void fetchOpportunityDetails(String jobOfferId, bool special) {
    executeBuilder(() => _offersRepository.fetchOpportunityDetails(jobOfferId),
        onSuccess: (data) {
      final JobDetail jobDetail = JobDetail(
          companyInfo: data!.companyInfo!,
          special: special,
          conditionName: data.conditionName,
          jobOffer: data.jobInfo ?? JobOfferDto(),
          availableJob: data.availableJob);
      emit(Initialized<JobDetail>(data: jobDetail));
    });
  }

  fetchTermsAndConditionByCompanyId(CompanyTermsParams params) async {
    executeEmitterData(
        () => _offersRepository.fetchTermsAndConditionByCompanyId(params));
  }

  void requestToJobInterview(String companyId) async{
    emit(LoadingStateListener());
    try {
      final response =
      await _offersRepository.requestToJobInterview(companyId);
      if (response.payload != null) {
        emit(SuccessStateListener<InterviewInfo>(data: response.payload));
      } else {
        emit(SuccessStateListener(data: response.message));
      }
    } catch (e, s) {
      print('ErrorDialogState' + s.toString());
      emit(LoadingStateListener());
    }
  }

  void fetchOffers(){
    executeEmitterData(() => isLogged() ? _offersRepository.fetchOpportunities() : _offersRepository.fetchOpportunitiesUnAuth());
  }
}
