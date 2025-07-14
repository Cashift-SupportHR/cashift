import 'package:flutter/cupertino.dart';
import 'package:shiftapp/common/domain/entities/jobs/job_details.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/bloc/job_offers_cubit.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/job_offer_details/job_offer_details_screen.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/components/dialogs_manager.dart';

import '../../../../core/services/routes.dart';
import '../../../../common/domain/entities/job_offers/index.dart';
import '../../../../common/domain/entities/jobs/index.dart';
import '../../working_document/presentation/workingDocument/widgets/working_document_alert_dialog.dart';
import '../bloc/opportunity_states.dart';

class JobOfferDetailsPageArgs {
  final int offerId;
  final bool ?special ;
  JobOfferDetailsPageArgs(this.offerId, {this.special});
}

class JobOfferDetailsPage
    extends BaseBlocWidget<Initialized<JobDetail>, JobOffersCubit> {
   late JobOfferDetailsPageArgs args;
  late JobDetail jobOffer;


  static Future push(BuildContext context,
      {required JobOfferDetailsPageArgs args}) async {
    return Navigator.pushNamed(context, Routes.jobOfferDetails, arguments: args);
  }

  @override
  Widget buildWidget(BuildContext context, Initialized<JobDetail> state) {
    jobOffer = state.data;
    args=model(context);
    return JobOfferDetailsScreenV2(
      onClickApply: () async {
        if (bloc.isLogged()) {
          bloc.checkCertificateJob(state.data.jobOffer.id ?? 0);
        } else {
          DialogsManager.showAskLoginDialog(context, onLogin: () {});
        }

      },
      jobDetail: state.data,
      onClickShare: () {
        bloc.createDynamicLink(state.data.jobOffer.id ?? 0);
      },
    );
  }

  JobOfferDetailsPageArgs model(BuildContext context) => getArguments(context);
  @override
  void loadInitialData(BuildContext context) {
    final JobOfferDetailsPageArgs args = model(context);
    bloc.fetchOpportunityDetails(args.offerId.toString(),args.special==true);
  }

  @override
  void onRequestSuccess(String? message) {
    showSuccessMessage(message ?? '', onDismiss: () {
      Navigator.pushNamedAndRemoveUntil(context,  Routes.home, (route) => false);
    });
  }

  @override
  void onSuccessState(SuccessStateListener state) {
    if(state is OpportunityRequiredWorkingDocuments){
      showWorkingDocumentDialog(
        context,
        jobId: args.offerId,
        data: state.data!,
      );
    }
    if(state is AuthorizedToJoinOpportunity){
      joinToOpportunity();
    }
    if(state is OpportunityJoinedSuccess){
      onRequestSuccess(state.data.toString());
    }
  }



  @override
  String? title(BuildContext context) {
    return strings.offer_details;
  }

  Future<void> joinToOpportunity() async {
    final accept = await Navigator.pushNamed(
        context, Routes.jobTermsAndConditionPage,
        arguments: jobOffer.jobOffer);
    if (accept is bool && accept == true) {
      bloc.applyOpportunities(args.offerId);
    }
  }
}
