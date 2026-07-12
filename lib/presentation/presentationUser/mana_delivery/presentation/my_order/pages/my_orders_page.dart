import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
 import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/presentationUser/mana_delivery/presentation/my_order/cubit/my_order_cubit.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';

import '../../../../../../data/exceptions/empty_list_exception.dart';
 import '../../../../../shared/components/app_widgets.dart';
import '../../../../../shared/components/base/stream_state_widget_v2.dart';
 import '../../../../../shared/components/error_handler_widget.dart';
import '../../../../../shared/components/pagination/custom_footer_builder.dart';
import '../../../../../shared/components/tabview/tab_bar_view_widget.dart';
import '../../../data/models/my_order_prams.dart';
import '../../../domain/entities/const_data.dart' show complete, notComplete;
import '../../../domain/entities/my_order.dart';
import 'my_order_screen.dart';

class MyOrderPage extends BaseBlocWidget<UnInitState, MyOrderCubit> {
  late int tabId = 0;
  MyOrderPrams? params;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchMyOrderPagination(
      params: MyOrderPrams(key: notComplete, pageSize: 10),
    );
  }

  @override
  onClickReload() {
    loadInitialData(context);
    controller.clear();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(title: strings.my_order, body: buildConsumer(context));
  }

  ScrollController _scrollController = ScrollController();
  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return TabBarViewWidget(
      isSeparate: true,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      labelPadding: const EdgeInsets.symmetric(horizontal: 3),
      marginTabs: const EdgeInsets.only(left: 16, right: 10, top: 10),
      tabs: [strings.not_collected, strings.collected],
      onTap: (index) {
        controller.clear();
        tabId = index;
        onRefresh();
      },
      pageWidget: Column(children: [myOrderWidget()]),
    );
  }

  void onRefresh() {
    bloc.fetchMyOrderPagination(
      isRefresh: true,
      params: MyOrderPrams(
        key: tabId == 0 ? notComplete : complete,
        pageSize: 10,
      ),
    );
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
  }

  void onLoading(List<MyOrderItemEntity> state) async {
    await bloc.fetchMyOrderPagination(
      params: params ?? MyOrderPrams(key: notComplete, pageSize: 10),
    );
    if (bloc.myOrders.isEmpty) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  Widget myOrderWidget() {
    return Expanded(
      child: StreamStateWidgetV2<List<MyOrderItemEntity>?>(
        stream: bloc.myOrderStream,
        onReload: () {
          onRefresh();
          controller.clear();
        },
        builder: (context, snapshot) {
          return SmartRefresher(
            enablePullUp: true,
            footer: CustomFooterBuilder(),
            controller: _refreshController,
            onRefresh: () => onRefresh(),
            scrollController: _scrollController,
            onLoading: tabId != 0 ? () => onLoading(snapshot!) : null,
            child: snapshot!.isEmpty
                ? ErrorPlaceHolderWidget(
                    exception: EmptyListException(),
                    onClickReload: () {
                      onRefresh();
                    },
                  )
                : MyOrderScreen(data: snapshot ?? [],onRefresh:(){
              onRefresh();
              controller.clear();
            }),
          );
        },
      ),
    );
  }
}
