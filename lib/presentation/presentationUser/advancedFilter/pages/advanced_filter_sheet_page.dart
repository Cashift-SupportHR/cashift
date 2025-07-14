import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/base_widget_bloc.dart';
import 'package:shiftapp/common/data/models/advancedFilter/index.dart';

import '../../../../core/services/routes.dart';

import '../../common/common_state.dart';
import '../../joboffers/jobs_list/jobs_list_page.dart';
import '../bloc/advanced_filter_cubit.dart';
import 'advanced_filter_sheet_screen.dart';

class AdvancedFilterSheetPage extends BaseBlocWidget<InitializedAdvancedFilter, AdvancedFilterCubit> {
  AdvancedFilterSheetPage({Key? key}) : super(key: key);

  // @override
  // bool initializeByKoin() {
  //   return false;
  // }

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchJobsCompanyByOpp();
  }

  @override
  Widget buildWidget(BuildContext context, InitializedAdvancedFilter state) {
    return AdvancedFilterSheetScreen(
        fetchProject: (companyId, cityId) {
          bloc.fetchProject(cityId: cityId, companyId: companyId);
        },
        jobsCompanyByOpp: state.jobsCompanyByOp,
        cities: state.cities,
        projects: bloc.projectsStream,
        advancedFilterData: state.advancedFilterData,
        onClearFilterData: () {
          bloc.clearAdvancedFilterData();
          bloc.fetchJobsCompanyByOpp();
        },
        onSaveFilterData: (SearchOpportunitiesAvailableParams filterData) {
          bloc.saveAdvancedFilterData(filterData);
          Navigator.pop(context);
        },
        onFetchDataWithFilter: (SearchOpportunitiesAvailableParams params) {
          bloc.fetchJobsCompanyByOppWithFilter(params);
        });
  }

  @override
  void buildListener(BuildContext context, state) {
    super.buildListener(context, state);
    if (state is SuccessStateListener<List<JobOfferDto>>) {
      navigateToOffersPage(state.data ?? []);
    }
  }

  void navigateToOffersPage(List<JobOfferDto> offers) {
    // Navigator.pop(context);
    Navigator.pushNamed(context, Routes.jobsListPage,
        arguments: JobsPageModel(
          strings.view_search_results,
          offers,
          special: false,
        ));
  }
}
