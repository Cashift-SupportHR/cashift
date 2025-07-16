import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/data/models/receive_vehicle_prams.dart';
import 'package:shiftapp/presentation/presentationUser/vehiclesOperation/presentation/pages/view/screen/receive_vehicles_screen.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';
import '../../../../../../shared/components/base/stream_state_widget_v2.dart';
import '../../../../../../shared/components/pagination/custom_footer_builder.dart';
import '../../../../../../shared/components/tabview/dynamic_tab_bar_view.dart';
import '../../../../../advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../salarydefinitionrequest/requests/widgets/title_and_add_new_request.dart';
import '../../../../data/models/mainReceiveVehicleArgument.dart';
import '../../../../domain/entities/receiveVehicle.dart';
import '../../add/main_receive_vehicle_page.dart';
import '../bloc/receive_vehicles_cubit.dart';
import '../filter/pages/filter_receive_page.dart';

class ReceiveVehiclesPage
    extends BaseBlocWidget<UnInitState, ReceiveVehiclesCubit> {
  int tabIndex = 1;

  @override
  String? title(BuildContext context) {
    return strings.receive_vehicle;
  }

  @override
  bool detectRequiredTasks() {
    return false;
  }

  TextEditingController controller = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          TitleAndAddNewRequest(
            title: strings.vehicle,
            textButton: strings.receive_vehicle,
            onTap: () {
              MainReceiveVehiclePage.push(context,
                  mainReceiveVehicleArg: MainReceiveVehicleArg(
                    isEdit: false,
                  ), onSuccess: () {
                checkAndFetchInitData();
              });
            },
          ),
          Expanded(
            child: DynamicTabBarView(
              isSeparate: true,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              marginTabs: const EdgeInsets.symmetric(horizontal: 16),
              tabs: [
                DynamicItem(name: strings.complete_receipt, id: 1),
                DynamicItem(name: strings.incomplete_receipt, id: 2),
              ],
              onTap: (index) {
                tabIndex = index;
                checkAndFetchInitData();
              },
              pageWidget: Column(
                children: [
                  TextFieldSearchJob(
                    title: strings.search,
                    readOnly: false,
                    onTap: () {
                      showAppModalBottomSheet(
                          padding: EdgeInsets.all(5),
                          title: strings.filter,
                          context: context,
                          child: FilterReceivePage(
                            onSaveFilterData: (prams) {
                              prams.isComplete = tabIndex == 1 ? true : false;
                              bloc.fetchReceiveVehiclePagination(
                                  params: prams, isRefresh: true);
                            },
                          ));
                    },
                    margin: const EdgeInsets.all(16),
                  ),
                  Expanded(
                    child: buildConsumer(context),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void onRefresh() {
    bloc.fetchReceiveVehiclePagination(
      isRefresh: true,
      params: ReceiveVehiclePrams(
        isComplete: tabIndex == 1 ? true : false,
        startDate: "",
        endDate: "",
        companyId: 0,
        shiftId: 0,
        projectId: 0,
        pageSize: 20,
      ),
    );
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
  }

  void onLoading(List<ReceiveVehicleData> state) async {
    await bloc.fetchReceiveVehiclePagination(
      params: ReceiveVehiclePrams(
        isComplete: tabIndex == 1 ? true : false,
        startDate: "",
        endDate: "",
        companyId: 0,
        shiftId: 0,
        projectId: 0,
        pageSize: 20,
      ),
    );

    if (bloc.receiveVehicles.isEmpty) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return StreamStateWidgetV2<List<ReceiveVehicleData>?>(
        stream: bloc.receiveVehiclesStream,
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
            onLoading: tabIndex != 0 ? () => onLoading(snapshot!) : null,
            child: ReceiveVehiclesScreen(
              tabId: tabIndex,
              data: snapshot ?? [],
              onRefresh: () => loadInitialData(context),
            ),
          );
        });
  }

  @override
  void loadInitialData(BuildContext context) {
    checkAndFetchInitData();
  }

  bool isCheckFace = false;

  Future<void> checkAndFetchInitData() async {
    await Future.delayed(
      Duration(milliseconds: 100),
      () async {
        bloc.fetchReceiveVehiclePagination(
            params: ReceiveVehiclePrams(
              isComplete: tabIndex == 1 ? true : false,
              companyId: 0,
              shiftId: 0,
              projectId: 0,
              pageSize: 20,
            ),
            isRefresh: true);
        // if (!isCheckFace) {
        //   isCheckFace = await checkFaceRecognition(context);
        // }
        // print("isCheckFace $isCheckFace");
        // if (isCheckFace == true) {
        //   bloc.fetchReceiveVehiclePagination(
        //       params: ReceiveVehiclePrams(
        //         isComplete: tabIndex == 1 ? true : false,
        //         companyId: 0,
        //         shiftId: 0,
        //         projectId: 0,
        //         pageSize: 20,
        //       ),
        //       isRefresh: true);
        // } else {
        //   bloc.emitVerificationFaceException();
        // }
      },
    );
  }
}
