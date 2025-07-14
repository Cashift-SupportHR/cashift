import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shiftapp/common/components/base/base_widget_bloc.dart';

import '../../../../presentationUser/common/common_state.dart';
import '../../../../../common/components/base/stream_state_widget_v2.dart';
import '../../../../../common/components/pagination/custom_footer_builder.dart';
import '../../../../../common/components/tabview/dynamic_tab_bar_view.dart';
import '../../data/models/admin_wallet_prams.dart';
import '../../domain/entities/admin_wallet.dart';
import '../../domain/entities/filterAndTaps.dart';
import '../cubit/admin_wallet_bloc.dart';
import '../widgets/header_wallet.dart';
import 'admin_wallet_screen.dart';

class AdminWalletPage extends BaseBlocWidget<Initialized<FilterAndTaps>, AdminWalletCubit> {
   String? dateFilter;
  AdminWalletPage({Key? key}) : super(key: key);
  ScrollController scrollController = ScrollController();
  int? typeStatus;
  @override
  void loadInitialData(BuildContext context) {
    checkAndFetchInitData();
  }

   @override
   bool detectRequiredTasks() {
     return false;
   }

   AdminWalletPrams? dataChangeFilter;
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  Widget buildWidget(BuildContext context, Initialized<FilterAndTaps> state) {
    return Column(
      children: [
        HeaderAdminWalletWidget(
          walletBalanceStream: bloc.walletBalanceStream,
        ),
        Expanded(
          child: DynamicTabBarView(
            isSeparate: true,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(0),
            marginTabs: const EdgeInsets.symmetric(horizontal: 0),
            onTap: (index) {
              typeStatus = index;
              dateFilter = null;
              onRefresh(
                filterId: 0,
              );
            },
            tabs: state.data.tabs?.map((e) => DynamicItem(name: e.name!, id: e.id!)).toList() ?? [],
            pageWidget: StreamStateWidgetV2<AdminWallet?>(
              stream: bloc.walletDataStream,
              onReload: () {
                dateFilter = null;
                loadInitialData(context);
              },
              builder: (context, data) {
                return SmartRefresher(
                  enablePullUp: true,
                  scrollController: scrollController,
                  footer: CustomFooterBuilder(),
                  controller: _refreshController,
                  onRefresh: () => onRefresh(),
                  onLoading: () => onLoading(data ?? AdminWallet()),
                  child: AdminWalletScreen(
                    dateFilter: dateFilter,
                    scrollController: scrollController,
                    type: typeStatus ?? 1,
                    tabsAndFilter: state.data,
                    adminWallet: data ?? AdminWallet(),
                    onChange: ({required AdminWalletPrams adminWalletPrams}) {
                      dataChangeFilter = adminWalletPrams;
                      dateFilter = "${adminWalletPrams.nameFilter ?? ''} ${adminWalletPrams.dateFilter ?? ''} ";
                      onRefresh(filterId: adminWalletPrams.filterId ?? 0, startDate: adminWalletPrams.startDate, endDate: adminWalletPrams.endDate);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void onLoading(AdminWallet wallet) async {
    await bloc.fetchWalletDataPagination(
      tabId: typeStatus ?? 1,
      filterId: dataChangeFilter?.filterId != 0 ? dataChangeFilter?.filterId : 0,
      startDate: dataChangeFilter?.startDate != null ? dataChangeFilter?.startDate : null,
      endDate: dataChangeFilter?.endDate != null ? dataChangeFilter?.endDate : null,
    );
    cheekData(wallet);
  }

  onRefresh({int? filterId, String? endDate, String? startDate}) async {
    bloc.fetchWalletDataPagination(tabId: typeStatus ?? 1, isRefresh: true, filterId: filterId, endDate: endDate, startDate: startDate);
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
  }

  cheekData(AdminWallet wallet) {
    if (wallet.design == 1) {
      if (bloc.deposit.isEmpty) {
        _refreshController.loadNoData();
      } else {
        _refreshController.loadComplete();
      }
    } else {
      if (bloc.pendingPayed.isEmpty) {
        _refreshController.loadNoData();
      } else {
        _refreshController.loadComplete();
      }
    }
  }

  @override
  onClickReload() {
    loadInitialData(context);
  }

   Future<void> checkAndFetchInitData() async {
     await Future.delayed(
       Duration(milliseconds: 100),
           () async {
         final checkFace = await checkFaceRecognition(context);
         if (checkFace == true) {
           bloc.fetchWalletBalanceStream();
           bloc.fetchLoadingData(filterId: 0);
         } else {
           bloc.emitVerificationFaceException();
         }
       },
     );
   }
}
