import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/overview/presentation/bloc/admin_overview_state.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';
import '../widgets/admin_app_notification_list_widget.dart';
import '../widgets/slider_opportunities_list.dart';

class AdminOverviewScreen extends BaseStatelessWidget {
  final AdminOverviewState state;
  final Function() onRefresh;

  AdminOverviewScreen(
      {required this.state,
      required this.onRefresh});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 24,
        ),
        SliderOpportunitiesList(
          tabsWithOpportunitiesStream: state.tabsWithOpportunitiesStream,
          onRefresh: onRefresh,
        ),

      ],
    );
  }


  Widget inAppRequirementNotification() {
    return AdminAppNotificationListWidget(
      inAppNotificationStream: state.inAppNotificationStream,
    );
  }

}
