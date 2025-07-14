import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:shiftapp/common/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/widgets/shift_base_widget.dart';
import 'package:shiftapp/presentation/presentationUser/appliedoffers/widgets/shift_item_widget.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';

import '../../../../core/services/routes.dart';

class AppliedOffersListPage
    extends ShiftBaseWidget<Initialized<List<AppliedOffer>>> {
  final bool activeOffers;

  AppliedOffersListPage({required this.activeOffers, Key? key});

  @override
  bool initializeByKoin() {
    return false;
  }
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchAppliedOpportunities(activeOffers);
  }

  @override
  Widget buildWidget(
      BuildContext context, Initialized<List<AppliedOffer>> state) {
    return RefreshIndicator(
      onRefresh: () {
        loadInitialData(context);
        return bloc.stream.firstWhere((element) => element is! LoadingState);
      },
      child: AppliedOffersListScreen(
        appliedOffers: state.data,
        isActive: activeOffers,
        onChangeStatus: (shift) {
          performAttendance(shift);
        },
        onRefresh: () {
          loadInitialData(context);
        }, onClickCancel: (AppliedOffer shift) {
          cancelShift(shift.id!);
      },
      ),
    );
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }

  @override
  AppliedOffer shift() {
    // TODO: implement shift
    throw UnimplementedError();
  }
}

class AppliedOffersListScreen extends StatelessWidget {
  final List<AppliedOffer> appliedOffers;
  final bool? isActive;
  final Function(AppliedOffer shift) onChangeStatus;
  final Function(AppliedOffer shift) onClickCancel;
  final Function() onRefresh;
  const AppliedOffersListScreen(
      {Key? key,
      required this.appliedOffers,
      required this.onRefresh,
        required this.onClickCancel,
      required this.onChangeStatus,
      this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimationLimiter(
        child: ListView.builder(
            itemCount: appliedOffers.length,
            itemBuilder: (con, pos) {
              final item = appliedOffers[pos];
              return AnimationConfiguration.staggeredList(
                position: pos,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: ShiftItemWidget(
                      item,
                      onClickDetails: () async {
                        final isChanged = await Navigator.pushNamed(
                            context, Routes.appliedOfferDetailsScreenV2,
                            arguments: item);
                        if (isChanged == true) {
                          onRefresh();
                        }
                      },
                      isActive: isActive,
                      onClickChange: (shift) {
                        onChangeStatus(shift);
                      }, onClickCancel:onClickCancel,),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
