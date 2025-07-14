
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/common/domain/entities/shift/index_shift.dart';

 import '../../../../../common/domain/entities/user_overview/job_offer_slider.dart';


abstract class OverviewState extends Initialized {
  final StreamState<List<JobOfferDto>?> offers;
  final StreamState<List<JobOfferSlider>> jobOffersSliders;

  OverviewState(
    this.offers, {
    required this.jobOffersSliders,
  }) : super(data: offers);

  Stream<int> numOfJob() => offers.stream.map((event) => event?.length ?? 0);
}

class OverviewPreLoginState extends OverviewState {
  final StreamState<List<JobOfferSlider>> jobOffersSliders;

  OverviewPreLoginState(StreamState<List<JobOfferDto>?> offers,
      {required this.jobOffersSliders})
      : super(
          offers,
          jobOffersSliders: jobOffersSliders,
        );
}

class OverviewPostLoginState extends OverviewState {
  final StreamState<List<JobOfferDto>> vipOffers;
  final StreamState<List<JobOfferDto>> favoritesOffers;
  final StreamState<List<JobOfferDto>> specialOffers;
  final StreamState<List<AppliedOffer>?> workingHours;
  final StreamState<AppliedOffer> currentShift;
  final StreamState<List<InAppRequiredTask>> inAppNotificationStream;
  final bool haveAdminPrivilege;

  final StreamState<List<JobOfferSlider>> jobOffersSliders;

  OverviewPostLoginState(
    StreamState<List<JobOfferDto>?> offers, {
    required this.vipOffers,
    required this.specialOffers,
    required this.favoritesOffers,
    required this.currentShift,
    required this.workingHours,
    required this.haveAdminPrivilege,
    required this.inAppNotificationStream,
    required this.jobOffersSliders,
  }) : super(
          offers,
          jobOffersSliders: jobOffersSliders,
        );
}
