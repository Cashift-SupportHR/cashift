import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:shiftapp/presentation/adminFeatures/shared/domain/entities/opportunities/opportunity.dart';
import 'package:shiftapp/presentation/presentationUser/common/common_state.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/presentation/shared/components/helper_widgets.dart';

import '../../../../../presentationUser/advancedFilter/widgets/text_field_search_job.dart';
import '../../../../../shared/components/app_widgets.dart';
import '../../../../../../common/components/base/stream_state_widget_v2.dart';
import '../../../../../shared/components/draggable_button/draggable_button.dart';
import '../../../../../shared/components/pagination/custom_footer_builder.dart';
import '../../../../../shared/components/tabview/tab_bar_view_widget.dart';
import '../../../../addOpportunity/presentations/pages/add_new_opportunity_page.dart';
import '../../../../shared/data/models/pagination_opportunity_params.dart';
import '../../../../shared/domain/entities/opportunities/PercentageOpportunty.dart';
import '../../widgets/filter_opportunity.dart';
import '../../widgets/statistic_widget.dart';
import '../bloc/available _opportunities_cubit.dart';
import 'available_opportunities_list.dart';


class AvailableOpportunitiesListPageV2 extends BaseBlocWidget<InitializedOpportunityTabsData, AvailableOpportunitiesCubit> {
   final bool ? showTitle;

  AvailableOpportunitiesListPageV2({this.showTitle = true});
   @override
   String? title(context) => showTitle ==true ? strings.the_opportunities:null ;

  late int   tabId  ;

  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  @override
  void loadInitialData(BuildContext context) {
    controller.clear();
    bloc.fetchOpportunityTab();
  }


   @override
   bool detectRequiredTasks() {
     return false;
   }

  @override
  onClickReload() {
    loadInitialData(context);
    controller.clear();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: title(context),
      body: buildConsumer(context),
      floatingActionButton: DraggableButton(
        icon: Icons.add,
        onPressed: () {
          AddNewOpportunityPage.push(context, onSuccess: () {
            loadInitialData(context);
          });
        },
      ),
    );
  }
  ScrollController _scrollController = ScrollController();
  @override
  Widget buildWidget(BuildContext context, InitializedOpportunityTabsData state) {
    tabId = state.tabs.first.id!;
    return TabBarViewWidget(
      isSeparate: true,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
        labelPadding: const EdgeInsets.symmetric(horizontal: 3),
      marginTabs: const EdgeInsets.only(left: 16, right: 10, top: 10),
      tabs: state.tabs.map((e) => (e.name ?? '')).toList(),
      onTap: (index) {
        controller.clear();
        tabId = state.tabs[index].id!;
        onRefresh();
      },
      pageWidget: Column(
        children: [
          searchFieldWidget(state),
          opportunitiesWidget()
        ],
      ),
    );
  }

  void onRefresh() {
    bloc.fetchOpportunityDataPagination(
      isRefresh: true,
      params: PaginationOpportunityParams(
        type: tabId,
        startDate: null,
        endDate: null,
        jobId: 0,
        projectId: 0,
        pageSize: 10,
      ),
    );
    bloc.fetchPercentageOpportunty(tabIndex: tabId);
    _refreshController.refreshCompleted();
    _refreshController.loadComplete();
  }

  void onLoading(List<Opportunity> state) async {
    await bloc.fetchOpportunityDataPagination(
      params: PaginationOpportunityParams(
        type: tabId,
        startDate: null,
        endDate: null,
        jobId: 0,
        projectId: 0,
        pageSize: 10,
      ),
    );
    bloc.fetchPercentageOpportunty(tabIndex: tabId);
    if (bloc.opportunityes.isEmpty) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
  }

 Widget searchFieldWidget(InitializedOpportunityTabsData state) {
   return  Padding(
      padding: const EdgeInsets.all(16),
      child: TextFieldSearchJob(
        title: strings.search_for_job,
        controller: controller,
        readOnly: true,
        onTap: () {
          FilterOpportunity.show(
            context,
            jobsCompanyByOpp: state.job,
            tabId: tabId,
            onFilterData: (params,text) {
              controller.text = text.replaceAll(' ,', '');
              bloc.fetchOpportunityDataPagination(params: params, isRefresh: true);
              bloc.fetchOpportunityDataPagination(params: params, isRefresh: true);
            },
            projects: state.projects,
          );
        },
        onChanged: (value) {
          if (value.isEmpty) {
            loadInitialData(context);
            return;
          }
        },
      ),
    );
  }

 Widget opportunitiesWidget() {
    return  Expanded(
      child: StreamStateWidgetV2<List<Opportunity>?>(
          stream: bloc.opportunityStream,
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
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    StreamStateWidgetV2<List<PercentageOpportunty>?>(
                        stream: bloc.percentageOpportuntyStream,
                        builder: (context, snapshot2) {
                          return StatisticWidget(percentageOpportunty: snapshot2!);
                        }),
                    AvailableOpportunitiesList(
                      opportunity: snapshot ?? [],
                      navItem: bloc.navItem??[],
                      scrollController: _scrollController,
                      onNavigatorToEdit: () {
                        AddNewOpportunityPage.push(context, opportunity: snapshot?.first, onSuccess: () {
                          loadInitialData(context);
                        });
                      },
                      loadInitialData: () {
                        loadInitialData(context);
                      },
                      type: this.tabId,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
