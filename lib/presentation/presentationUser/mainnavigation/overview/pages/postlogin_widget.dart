import 'package:flutter/material.dart';

import 'package:shiftapp/data/models/activity_log/confirm_activity_params.dart';
import 'package:shiftapp/domain/entities/shift/applied_offer.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/joboffers/jobs_list/jobs_list_page.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/base_stateless_widget.dart';
import 'package:shiftapp/presentation/shared/components/horizontal_days_widgets.dart';
import 'package:shiftapp/presentation/shared/components/material_text.dart';

import '../../../../../main_index.dart';
import '../../../../shared/components/options_menu_button.dart';
import '../../../advancedFilter/widgets/text_field_search_job.dart';
import '../bloc/overview_bloc.dart';
import '../bloc/overview_state.dart';
import '../widgets/app_requierment_notificationslist_widget.dart';
import '../widgets/carousel_slider_overView.dart';
import '../widgets/cashifter_code_cart.dart';
import '../widgets/current_date_widget.dart';
import '../widgets/job_offers_sliders.dart';
import '../widgets/mana_order_widget.dart';
import '../widgets/opportunity_slider.dart';
import '../widgets/shifts_slider.dart';
import '../widgets/tab_view_shift_overView.dart';

class PostLoginWidget extends BaseStatelessWidget {
  final OverviewPostLoginState postLoginState;
  final Function onRefresh;
  final Function(DateTime? dateTime) onChangeDate;
  final Function(OverviewEvents event) onRequestEvent;
  final Function(int) onApplyJobNow;
  final Function() canSubmitLogistics;
  final Function(int) onCheckCertificateJob;
  final VoidCallback onRetryDeliveryOrders;

  StreamStateInitial<OffersViewType> offersViewTypeController =
      StreamStateInitial<OffersViewType>();
  PostLoginWidget({
    required this.onRefresh,
    required this.onChangeDate,
    required this.postLoginState,
    required this.canSubmitLogistics,
    required this.onRequestEvent,
    required this.onApplyJobNow,
    required this.onCheckCertificateJob,
    required this.onRetryDeliveryOrders,
  });
  @override
  Widget build(BuildContext context) {
    return buildPostLogin(context);
  }

  Widget buildPostLogin(context) {
    print('buildPostLogin $postLoginState');
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        inAppRequirementNotification(),
        getCurrentDateWidget(),

        getCountOfJobsWidget(postLoginState.numOfJob()),
        buildDateTabsWidget(),
        const SizedBox(height: 8),
        CashifterCodeWidget(
          cashifterCodeStream: postLoginState.cashifterCodeStream,
        ),
        const SizedBox(height: 8),
        TextFieldSearchJob(),
        const SizedBox(height: 16),
        JobOffersSlidersWidget(
          onApplyJobNow: (id) {
            onApplyJobNow(id);
          },
          canSubmitLogistics: () {
            canSubmitLogistics();
          },
          jobOffersSliders: postLoginState.jobOffersSliders,
        ),
        buildOffersSliderSection(
          postLoginState.specialOffers.stream,
          name: strings.special_offer,
          special: true,
        ),
        CarouselSliderSection(
          stream: postLoginState.offers.stream,
          onTapViewAll: (List<JobOfferDto> offers) {
            onTapViewAllOffers(context, strings.special_jobs, offers);
          },
          onCheckCertificateJob: (id) {
            onCheckCertificateJob(id);
          },
        ),
        appliedShiftSliderStream(postLoginState.workingHours),
        TabViewOverView(
          onTabChange: (int index) {
            if (index == 0) {
              offersViewTypeController.setData(OffersViewType.all);
            }
            if (index == 1) {
              offersViewTypeController.setData(OffersViewType.vip);
            }
            if (index == 2) {
              offersViewTypeController.setData(OffersViewType.favorite);
            }
          },
        ),
        StreamBuilder<OffersViewType>(
          stream: offersViewTypeController.stream,
          initialData: OffersViewType.all,
          builder: (context, AsyncSnapshot<OffersViewType> snapshot) {
            return (snapshot.requireData == OffersViewType.favorite)
                ? buildOffersSliderSection(
                  postLoginState.favoritesOffers.stream,
                  name: strings.favorite_jobs,
                  showPlaceHolder: true,
                )
                : (snapshot.requireData == OffersViewType.vip)
                ? buildOffersSliderSection(
                  postLoginState.vipOffers.stream,
                  name: strings.vip_offers,
                  showPlaceHolder: true,
                )
                : buildOffersSliderSection(
                  postLoginState.offers.stream,
                  name: strings.all_jobs,
                  showPlaceHolder: true,
                );
          },
        ),
        const SizedBox(height: 16),
        ManaOrderWidget(
          deliveryOrdersStream: postLoginState.deliveryOrdersStream,
          onRetry: onRetryDeliveryOrders,
        ),
      ],
    );
  }

  Widget buildOffersSliderSection(
    Stream<List<JobOfferDto>?> stream, {
    required String name,
    bool? special,
    bool? showPlaceHolder,
  }) {
    return OpportunitySlider(
      header: null,
      stream: stream,
      showPlaceHolder: showPlaceHolder,
      onRefresh: () {
        onRefresh();
      },
      special: special,
      name: name ?? '',
      showViewAllButton: special == false,
      onCheckCertificateJob: (id) {
        onCheckCertificateJob(id);
      },
    );
  }

  Widget getCurrentDateWidget() {
    return CurrentDateWidget(
      onToggleAdmin: () {
        onRequestEvent(ToggleAdminPanelEvent());
      },
      isAdmin: false,
      haveAdminPrivilege: postLoginState.haveAdminPrivilege,
    );
  }

  Widget buildDateTabsWidget() {
    return SizedBox(
      height: 80,
      child: HorizontalDaysWidget(
        onSelect: (DateTime? dateTime) {
          onChangeDate(dateTime);
        },
      ),
    );
  }

  Widget getCountOfJobsWidget(Stream<int> numOfJob) {
    return StreamBuilder<int>(
      stream: numOfJob,
      builder: (context, snapshot) {
        return Text(
          (snapshot.data ?? 0) > 0
              ? '${snapshot.data} ${strings.jobs_in_waiting} '
              : '',
          style: kTextRegular.copyWith(fontSize: 12, color: kSilverTwo),
        );
      },
    );
  }

  Widget inAppRequirementNotification() {
    return AppRequirementNotificationListWidget(
      inAppNotificationStream: postLoginState.inAppNotificationStream,
      currentShift: postLoginState.currentShift,
      onUpdate: onRefresh,
      onRequestEvent: (ConfirmActivityParams params) {
        onRequestEvent(ConfirmJob(params));
      },
    );
  }

  Widget options(String name) {
    print('OptionsMenuButton $name');
    return OptionsMenuButton(
      optionsString: [
        strings.all_jobs,
        strings.vip_offers,
        strings.favorite_jobs,
      ],
      onSelect: (int index) {
        if (index == 0) {
          offersViewTypeController.setData(OffersViewType.all);
        }
        if (index == 1) {
          offersViewTypeController.setData(OffersViewType.vip);
        }
        if (index == 2) {
          offersViewTypeController.setData(OffersViewType.favorite);
        }
      },
      title: MaterialText(
        name,
        endIcon: const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: kPrimaryDark,
        ),
        style: kTextMedium.copyWith(fontSize: 15, color: kBlackGrey),
      ),
    );
  }

  List<Widget> optionItems() {
    final items = <Widget>[];
    items.add(menuItem('All'));
    items.add(menuItem('VIP'));
    items.add(menuItem('Favorites'));
    return items;
  }

  Widget menuItem(String name) {
    return Text(
      name,
      style: kTextRegular.copyWith(fontSize: 16, color: kGreyishBrown),
    );
  }

  Widget viewAll(
    BuildContext context,
    List<JobOfferDto> offers,
    String titlePage,
  ) {
    return TextButton(
      onPressed: () async {
        onTapViewAllOffers(context, titlePage, offers);
      },
      child: Text(
        strings.view_all,
        style: kTextRegular.copyWith(color: kBrownishGrey, fontSize: 12),
      ),
    );
  }

  Widget appliedShiftSliderStream(
    StreamState<List<AppliedOffer>?> workingHours,
  ) {
    return ShiftSlider(stream: workingHours.stream, onRefresh: onRefresh);
  }

  Future<void> onTapViewAllOffers(
    BuildContext context,
    String title,
    List<JobOfferDto> offers,
  ) async {
    final isUpdated = await Navigator.pushNamed(
      context,
      Routes.jobsListPage,
      arguments: JobsPageModel(title, offers, special: false),
    );
    if (isUpdated == true) {
      onRefresh();
    }
  }
}

enum OffersViewType { all, favorite, vip }
