import 'dart:convert';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
 import 'package:flutter/material.dart';
 import 'package:get_it/get_it.dart';
import 'package:shiftapp/presentation/adminFeatures/admin_wallet/presentation/pages/admin_wallet_page.dart';
import 'package:shiftapp/presentation/shared/components/error_handler_widget.dart';
import '../../../../core/services/routes.dart';
import '../../../../main.dart';
import '../../../adminFeatures/available_opportunities/presentation/opportunities/pages/available_opportunities_page.dart';
import '../../../adminFeatures/available_opportunities/presentation/opportunities/pages/available_opportunities_page.dart';
import '../../../../config.dart';
import '../../../adminFeatures/di/injector.dart';
import '../../../adminFeatures/employeeMap/presentation/pages/search_employee_map_page.dart';
import '../../../adminFeatures/employees/presentation/employees/pages/employees_page.dart';
import '../../../adminFeatures/gasStations/presentation/pages/view/screen/gas_stations_page.dart';
import '../../../adminFeatures/jobUniform/presentation/pages/add_job_uniform_page.dart';
import '../../../adminFeatures/maintenanceAndBreakdowns/presentation/view/pages/maintenance_breakdowns_page.dart';
import '../../../adminFeatures/notifications/presentation/view/pages/notification_screen.dart';
import '../../../adminFeatures/notifications/presentation/view/pages/notifications_page.dart';
import '../../../adminFeatures/overview/presentation/pages/admin_overview_page.dart';
import '../../../adminFeatures/vehicles/presentation/vehicleTracking/widgets/show_image_violation_build.dart';
import '../../../presentationUser/joboffers/job_offer_details/job_offer_details_page.dart';
import '../../../presentationUser/mainnavigation/jobmap/jobs_map_page.dart';
import '../../../presentationUser/mainnavigation/overview/overview_page.dart';
import '../../../presentationUser/mainnavigation/wallet/pages/wallet_page.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/transactions/presentation/view/pages/transactions_page.dart';
import '../../../presentationUser/vehiclesOperation/presentation/currentTourMap/view/bloc/current_tour_map_state.dart';
import '../../../presentationUser/vehiclesOperation/presentation/pages/view/screen/receive_vehicles_page.dart';
import '../../../adminFeatures/vehicles/presentation/vehicleTracking/pages/vehicles_tracking_page.dart';
import '../../components/camera_streaming/hls_player_widget.dart';
import '../../components/offline_place_holder/offline_place_holder_widget.dart';
import '/generated/assets.dart';
import '/presentation/presentationUser/common/common_state.dart';
import '/presentation/presentationUser/profile/index.dart';
import '/presentation/shared/components/base_stateful_widget.dart';
import '/presentation/shared/components/consumer_builder.dart';
import '/presentation/shared/components/dialogs_manager.dart';
import '/presentation/shared/components/loading_widget.dart';
import '/presentation/shared/home/bloc/home_bloc.dart';
import '/presentation/shared/home/widgets/bottom_navigation_widget.dart';
import '/presentation/shared/services/pages/services_page.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends BaseState<MyHomeScreen> {
  late HomeBloc homeBloc;
  // FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  List<BottomNavigationWidgetModel> getNavigationItemsList() {
    final List<BottomNavigationWidgetModel> _widgetOptions =
        <BottomNavigationWidgetModel>[
      BottomNavigationWidgetModel(
          widget: OverviewPage(),
          label: strings.home,
          iconPath: 'images/home.svg'),
      BottomNavigationWidgetModel(
          widget: JobsMapPage(),
          label: strings.map,
          iconPath: 'images/map.svg'),
      BottomNavigationWidgetModel(
          widget: ServicesPage(),
          label: strings.services,
          iconPath: 'images/services.svg'),
      BottomNavigationWidgetModel(
          widget: WalletPage(),
          label: strings.mywallet,
          icon: const Icon(Icons.account_balance_wallet)),
      BottomNavigationWidgetModel(
          widget: ProfilePage(),
          label: strings.profile,
          iconPath: Assets.imagesProfile),
    ];
    return _widgetOptions;
  }


  List<BottomNavigationWidgetModel> adminNavigationItemsList() {
    final List<BottomNavigationWidgetModel> _widgetOptions =
        <BottomNavigationWidgetModel>[
      BottomNavigationWidgetModel(
          widget: AdminOverviewPage(),
          label: strings.home,
          iconPath: 'images/home.svg'),
      BottomNavigationWidgetModel(
          widget: AvailableOpportunitiesListPageV2(
            showTitle: false,
          ),
          label: strings.the_opportunities,
          iconPath: 'images/available_opportunity.svg'),
      BottomNavigationWidgetModel(
          widget: ServicesPage(),
          label: strings.services,
          iconPath: 'images/services.svg'),
      BottomNavigationWidgetModel(
          widget: AdminWalletPage(),
          label: strings.mywallet,
          icon: const Icon(Icons.account_balance_wallet)),
      BottomNavigationWidgetModel(
          widget: ProfilePage(),
          label: strings.profile,
          iconPath: Assets.imagesProfile),
    ];
    return _widgetOptions;
  }

  // Future<void> initDynamicLinks(BuildContext context) async {
  //   final PendingDynamicLinkData? data =
  //       await FirebaseDynamicLinks.instance.getInitialLink();
  //
  //   handleLink(data, context);
  //
  //   dynamicLinks.onLink.listen((dynamicLinkData) {
  //     handleLink(dynamicLinkData, context);
  //   });
  //   FirebaseMessaging.instance.getInitialMessage().then((value) async {
  //     if (value != null) {
  //       String valueMap = json.encode(value.data);
  //       onSelectNotification(valueMap, context);
  //     }
  //   });
  // }

  handleLink(PendingDynamicLinkData? pendingDynamicLinkData,
      BuildContext context) async {
    try {
      if (pendingDynamicLinkData != null) {
        final link = pendingDynamicLinkData.link;
        final offerId = link.queryParameters['offer'];
        if (offerId != null) {
          print('initDynamicLinks handleLink $offerId , $link');
          navigateToRoute(Routes.jobOfferDetails, context,
              arguments: JobOfferDetailsPageArgs(int.parse(offerId)));
        }
      }
    } catch (e) {}
  }

  navigateToRoute(String routeName, BuildContext context, {dynamic arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  @override
  void initState() {
    homeBloc = GetIt.instance.get<HomeBloc>();
    if (mounted) {
      if (Config.isTestVersion == false) homeBloc.fetchAppVersion();
      // homeBloc.fetchAppVersion();
      print('checkUserRolePrivilege initState');
      homeBloc.checkUserRolePrivilege();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // initDynamicLinks(context);
      });
    }
    homeBloc.fetchCurrentTrip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConsumerBuilder(
      builder: (CommonState state) {
        print('ConsumerBuilder HOME ${state}');
        if (state is InitializedUser) {
          return userBottomNavigationWidget();
        }
        if (state is InitializedAdmin) {
          return adminBottomNavigationWidget();
        }
        if (state is LoadingState) {
          return LoadingView(color: kBackground);
        }
        if (state is OfflineState) {
          return offlineErrorPlaceHolder();
        }
        return LoadingView(color: kBackground);
      },
      listener: (CommonState state) {
        if (state is NewUpdateAvailable) {
          if (state.checkOfAppUpdate.needToUpdate == true) {
            DialogsManager.showNewVersionDialog(state.checkOfAppUpdate, context,
                onDismiss: () {});
          }
        }
        if (state is CurrentTourMapState) {
          navigateToCurrentTourMapPage();
        }
      },
      bloc: homeBloc,
    );
  }

  Widget userBottomNavigationWidget() {
    return BottomNavigationWidget(items: getNavigationItemsList());
  }

  Widget adminBottomNavigationWidget() {
    return BottomNavigationWidget(items: adminNavigationItemsList());
  }

  Widget offlineErrorPlaceHolder() {
    return OfflinePlaceHolderWidget();
  }

  void navigateToCurrentTourMapPage() {
    Navigator.pushReplacementNamed(context, Routes.currentTourMapPage);
  }
}
