
import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/data/models/terms/company_terms_params.dart';
import 'package:shiftapp/common/domain/entities/job_offers/job_offer_dto.dart';
import 'package:shiftapp/common/domain/entities/jobs/job_terms.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/bloc/job_offers_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/terms_conditions/job_terms_condition_screen.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../common/domain/entities/job_offers/index.dart';
import '../../../../common/domain/entities/jobs/index.dart';

import '../widgets/interview_info_widget_v2.dart';

class JobTermsAndConditionPage
    extends BaseBlocWidget<Initialized<JobTerms>, JobOffersCubit> {

  @override
  String? title(BuildContext context) {
    return strings.activate_client;
  }
  @override
  bool initializeByKoin() {
    return false;
  }
  @override
  Widget buildWidget(BuildContext context, Initialized<JobTerms> state) {
    final job = getArguments<JobOfferDto>(context);

    return state.data.hasPreviousRequestInterview()
        ? InterviewInfoWidgetV2(job: state.data, matchHeight: true,)
        : JobTermsAndConditionScreen(
            state.data,
            onRequestInterview: () {
              bloc.requestToJobInterview(job!.companyId.toString());
            },
          );
  }

  @override
  void buildListener(BuildContext context, state) {
    print('buildListener state: $state');
    if (state is SuccessStateListener<JobTerms>) {
      InterviewInfoWidgetV2.show(context, state.data!);
    }
    if (state is SuccessStateListener<InterviewInfo>) {
      loadInitialData(context);
    }
    super.buildListener(context, state);
  }

  @override
  void onRequestSuccess(String? message) {
    showSuccessMessage(message ?? '', onDismiss: () {
      Navigator.pop(context, false);
    });
  }

  CompanyTermsParams createTermsParams(BuildContext context) {
    final job = getArguments<JobOfferDto>(context);
    return CompanyTermsParams(id: job!.id.toString());
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchTermsAndConditionByCompanyId(createTermsParams(context));
  }
}
