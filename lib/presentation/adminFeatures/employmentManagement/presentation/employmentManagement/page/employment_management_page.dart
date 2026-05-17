import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../presentationUser/common/common_state.dart';
import '../../../../../shared/components/base_widget_bloc.dart';
import '../../../../../shared/components/tabview/tab_bar_view_widget.dart';
import '../../../../../shared/components/tabview/tab_bar_view_widget_line.dart';
import '../../../domain/entities/employee_data.dart';
import '../bloc/employment_management_cubit.dart';
import 'employment_management_screen.dart';

class EmploymentManagementPage extends BaseBlocWidget<
    InitializedEmploymentTabsData, EmploymentManagementCubit> {

  EmploymentManagementPage({Key? key}) : super(key: key);

  @override
  bool initializeByKoin() {
    return false;
  }

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  TextEditingController searchController = TextEditingController();

  StreamStateInitial<bool> isNestedTabsStream = StreamStateInitial();

  @override
  bool detectRequiredTasks() {
    return false;
  }

  int tabIndex = 0;
  int tabId = 1;
  String search = '';
  int successApprovedLevel = 1;
  Timer? _debounce;

  @override
  void loadInitialData(context) {
    bloc.fetchEmploymentManagementTabsData('', type: tabId, successApprovedLevel: successApprovedLevel);
    searchController.clear();
  }

  @override
  String? title(context) => strings.employment_management;

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
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                bloc.fetchEmployeesDataPagination(
                    isRefresh: true, type: tabId, search: search);
              });
            },
          ),
        ),
        Expanded(child: buildConsumer(context)),
      ],
    ));
  }

  @override
  Widget buildWidget(
      BuildContext context, InitializedEmploymentTabsData state) {
    return StreamBuilder<bool>(
        initialData: false,
        stream: isNestedTabsStream.stream,
        builder: (context, snapshot) {
          print('snapshot.data ${snapshot.data}');
          return TabBarViewWidgetLine(
            initialIndex: state.tabs.indexWhere((element) => element.id == tabId),
            tabs: state.tabs
                .map((e) => TabLineModel(
                      id: e.id ?? 0,
                      text: e.name ?? '',
                      count: e.totalFreelance ?? 0,
                    ))
                .toList(),
            onTabChange: (index, id) {
              tabIndex = index;
              tabId = id;
              if(state.tabs[tabIndex].successApprovedLevel != null && state.tabs[tabIndex].successApprovedLevel!.isNotEmpty){
                successApprovedLevel = state.tabs[tabIndex].successApprovedLevel![0].id ?? 1;
               isNestedTabsStream.setData(true);
              } else {
                successApprovedLevel = 0;
                isNestedTabsStream.setData(false);
              }
              onRefresh();
            },
            children: state.tabs
                .map((e) => TabBarViewWidget(
                      isSeparate: true,
              isScrollable: true,
                      padding: EdgeInsets.zero,
                      marginTabs: EdgeInsets.only(top: 5, left: 16, right: 16),
                      tabs: e.successApprovedLevel
                              ?.map((e) => e.name.toString())
                              .toList() ??
                          [],
                      onTap: (index) {
                        successApprovedLevel = e.successApprovedLevel![index].id ?? 1;
                        onRefresh();
                      },
                      pageWidget: employmentManagementScreen(state),
                    ))
                .toList(),
            pageWidget: snapshot.data == true
                ? null : employmentManagementScreen(state),
          );
        });
  }

  Widget employmentManagementScreen(InitializedEmploymentTabsData state) {
    return EmploymentManagementScreen(
      popups: state.popups,
      refreshController: _refreshController,
      employeeDataStream: bloc.employeeDataStream,
      onRefresh: () {
        loadInitialData(context);
      },
      onLoading: (employees) {
        onLoading(employees);
      },
        onBlockEmployee: (value) {
          bloc.addBlockEmployee(value);
        },
      onAllowEditFaceRecognition: (id) {
        bloc.allowEditFaceRecognition(id);
      },
    );
  }

  void onLoading(List<EmployeeData> employees) async {
    await bloc.fetchEmployeesDataPagination(type: tabId, search: search, successApprovedLevel: successApprovedLevel);
    if (bloc.employees.isEmpty) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

  onRefresh() async {
    print('_refreshController onRefresh');
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    bloc.fetchEmployeesDataPagination(
        isRefresh: true, type: tabId, search: '', successApprovedLevel: successApprovedLevel);
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
    searchController.clear();
    search = '';
  }
}
