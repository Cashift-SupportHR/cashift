import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../../common/components/base/base_widget_bloc.dart';
import '../../../../../../common/components/error_handler_widget.dart';
import '../../../../../../common/components/loading_widget.dart';
import '../../../../../../common/components/pagination/custom_footer_builder.dart';
import '../../../../../../common/components/tabview/tab_bar_view_widget_line.dart';
import '../../../domain/entities/ban_employee.dart';
import '../bloc/ban_employees_cubit.dart';
import 'ban_employees_screen.dart';

class BanEmployeesPage extends BaseBlocWidget<InitializedEmployeesBanTabsData, BanEmployeesCubit> {

  BanEmployeesPage({Key? key}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  TextEditingController searchController = TextEditingController();

  @override
  bool detectRequiredTasks() {
    return false;
  }

  int tabIndex = 1;
  String search = '';

  @override
  void loadInitialData(context) {
    bloc.fetchStaffBanTab('', tabIndex);
    searchController.clear();
  }

  @override
  String? title(context) => strings.block_emp;

  Widget build(BuildContext context) {
    return mainFrame(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextFieldSearchJob(
            title: strings.search,
            readOnly: false,
            onTap: () {},
            controller: searchController,
            onChanged: (value) {
              search = value;
              bloc.fetchEmployeesDataPagination(isRefresh: true, type: tabIndex, search: search);
            },
          ),
        ),
        Expanded(child: buildConsumer(context))
      ],
    ));
  }

  @override
  Widget buildWidget(BuildContext context, InitializedEmployeesBanTabsData state) {
    return TabBarViewWidgetLine(
      initialIndex: tabIndex - 1,
      tabs: state.tabs
          .map((e) => TabLineModel(
                id: 0,
                text: e.name ?? '',
                count: e.total ?? 0,
              ))
          .toList(),
      onTabChange: (index, id) {
        tabIndex = index + 1;
        onRefresh();
      },
      pageWidget: StreamBuilder<List<BanEmployee>?>(
        stream: bloc.employeeDataStream.stream,
        builder: (context, snapshot) {
          print('snapshot.hasError ${snapshot.error}');
          return snapshot.data == null
              ? const LoadingView()
              : (snapshot.error != null || snapshot.data!.isEmpty)
                  ? ErrorPlaceHolderWidget(
                      error: snapshot.data!.isEmpty ? strings.not_found_applicants : null,
                      exception: snapshot.error,
                      onClickReload: () {
                        onRefresh();
                      },
                    )
                  : SmartRefresher(
                      enablePullUp: true,
                      footer: CustomFooterBuilder(),
                      controller: _refreshController,
                      onRefresh: () => onRefresh(),
                      onLoading: () => onLoading(snapshot.data ?? []),
                      child: BanEmployeesScreen(
                        data: snapshot.data ?? [],
                        type: tabIndex,
                        onUpdateEmployeeStatus: (params) {
                          bloc.updateEmployeeBanStatus(params);
                        },
                      ),
                    );
        },
      ),
    );
  }

  void onLoading(List<BanEmployee> employees) async {
    await bloc.fetchEmployeesDataPagination(type: tabIndex, search: search);
    if (bloc.employees.isEmpty) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  onRefresh() async {
    bloc.fetchEmployeesDataPagination(isRefresh: true, type: tabIndex, search: '');
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
    searchController.clear();
    search = '';
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context);
  }
}
