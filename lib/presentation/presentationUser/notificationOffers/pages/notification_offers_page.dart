import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shiftapp/main_index.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import '../../../../common/data/models/notification_offers/index.dart';
import '../../../../common/domain/entities/job_offers/index.dart';
import '../../../../common/components/base/base_widget_bloc.dart';
import '../../joboffers/jobs_list/jobs_list_screen.dart';
import '../bloc/notification_offers_cubit.dart';

class NotificationOffersPage extends BaseBlocWidget<
    Initialized<List<JobOfferDto>>, NotificationOffersCubit> {

  NotificationOffersPage({Key? key}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  void loadInitialData(BuildContext context) {
    print('getArguments ${getArguments(context) }');
    if(getArguments(context) is NotificationOfferParams) {
      bloc.fetchNotificationOffers(getArguments(context));
    }
  }

  @override
  String? title(BuildContext context) {
    return strings.offers;
  }
  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<JobOfferDto>> state) {
    return JobsListScreen(
      state.data,
      onApplyOffer: (offer) {},
    );
  }
}
