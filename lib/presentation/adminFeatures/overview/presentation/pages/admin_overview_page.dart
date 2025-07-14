import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/overview/presentation/bloc/admin_overview_cubit.dart';
import 'package:shiftapp/presentation/adminFeatures/overview/presentation/bloc/admin_overview_state.dart';
import 'package:shiftapp/presentation/adminFeatures/overview/presentation/pages/admin_overview_screen.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';
import 'package:shiftapp/common/components/toolbar/home_toolbar_widget.dart';
import 'package:shiftapp/presentation/shared/home/pages/home_screen.dart';

import '../../../../../core/services/routes.dart';
import '../../../../../common/components/draggable_button/draggable_button.dart';
import '../../domain/entities/view_filter.dart';
import '../../../addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import '../widgets/admin_app_notification_list_widget.dart';

class AdminOverviewPage
    extends BaseBlocWidget<AdminOverviewState, AdminOverviewCubit> {
  @override
  bool initializeByKoin() {
    return false;
  }

  @override
  Widget buildWidget(BuildContext context, state) {
    print('AdminOverviewState uild ${state}');
    return AdminOverviewScreen(
      state: state,

      onRefresh: () {
        loadInitialData(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: DraggableButton(
        onPressed: () {
          AddNewOpportunityPage.push(context, onSuccess: () {
            print('onSuccess');
            bloc.loadInitial();
          });
        },
        icon: Icons.add,
      ),
      body: Column(
        children: [
          AdminAppNotificationListWidget(
            inAppNotificationStream: bloc.inAppNotificationStream,
          ),
          HomeToolbarWidget(
              onToggleAdmin: () {
                bloc.toggleToUserView();
              },
              isAdmin: true,
              haveAdminPrivilege: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
              child: RefreshIndicator(
                  onRefresh: () async {
                    bloc.loadInitial();
                    return await Future.delayed(const Duration(seconds: 1));
                  },
                  child: buildConsumer(context)))
        ],
      ),
    );
  }

  @override
  void buildListener(BuildContext context, state) {
    super.buildListener(context, state);
    if (state is ToggledUserState) {
      Navigator.pushReplacementNamed(context,  Routes.home);
    }
  }

  @override
  void loadInitialData(BuildContext context) {
    bloc.loadInitial();
  }
}
