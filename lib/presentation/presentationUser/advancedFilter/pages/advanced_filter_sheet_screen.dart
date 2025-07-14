import 'package:flutter/material.dart';
import 'package:shiftapp/common/data/repositories/advancedFilter/select_model.dart';
import 'package:shiftapp/common/domain/entities/advancedFilter/index.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
  import 'package:shiftapp/common/data/models/advancedFilter/index.dart';


import '../../../../common/domain/entities/resume/index.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
 import '../../common/common_state.dart';
import '../widgets/buttons_actions_widget.dart';
import '../widgets/custom_range_slider.dart';
import '../widgets/select_widget.dart';
import '../widgets/text_field_city_picker.dart';
import '../widgets/text_field_date_picker_filter.dart';
import '../widgets/text_field_project.dart';

class AdvancedFilterSheetScreen extends BaseStatelessWidget {
  final OffersFilterData jobsCompanyByOpp;
  final List<CityItem> cities;
  final StreamState<List<ProjectFiltter>> projects;
  final SearchOpportunitiesAvailableParams? advancedFilterData;
  final Function(SearchOpportunitiesAvailableParams) onFetchDataWithFilter;
  final Function(int companyId, int cityId) fetchProject;
  final void Function()? onClearFilterData;
  final void Function(SearchOpportunitiesAvailableParams)? onSaveFilterData;

  AdvancedFilterSheetScreen(
      {Key? key,
      required this.projects,
      required this.fetchProject,
      required this.jobsCompanyByOpp,
      required this.cities,
      this.advancedFilterData,
      this.onClearFilterData,
      required this.onFetchDataWithFilter,
      this.onSaveFilterData})
      : super(key: key);

  int? companyId;
  int? jobId;
  CityItem? city;
  ProjectFiltter? projectId;
  int? fromSalary;
  int? toSalary;
  String? fromDate;
  String? toDate;

  @override
  Widget build(BuildContext context) {
    companyId = advancedFilterData?.companyId ?? 0;
    jobId = advancedFilterData?.jobId ?? 0;

    return Material(
      color: kWhite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectWidget(
              title: strings.select_job,
              items: jobsCompanyByOpp.jobs!.map((e) => SelectModel.fromJson(e.toJson())).toList(),
              initialValue: advancedFilterData?.jobId ?? 0,
              onSelected: (value, name) {
                jobId = value;
                print(jobId);
              },
            ),
            const Divider(),
            SelectWidget(
              title: strings.select_company,
              items: jobsCompanyByOpp.company!.map((e) => SelectModel.fromJson(e.toJson())).toList(),
              initialValue: advancedFilterData?.companyId ?? 0,
              onSelected: (value, name) {
                companyId = value;
                print(companyId);
                onFetchProject(companyId: companyId ?? 0, cityId: city?.id ?? 0);
              },
            ),
            const Divider(),
            TextFieldCityPicker(
              cities: cities,
              initialCity: advancedFilterData?.cityId,
              onSelectCity: (value) {
                city = CityItem(
                  id: value.index,
                  nameAr: value.value,
                );
                onFetchProject(companyId: companyId!, cityId: value.index);
              },
            ),
            TextFieldProjectPicker(
              onSelectProject: (value) {
                projectId = ProjectFiltter(
                  id: value.index,
                  name: value.value,
                );
              },
              projects: projects,
              initialProject: advancedFilterData?.projectId,
            ),
            const Divider(height: 40),
            TextFieldDatePicker(
              fromDate: advancedFilterData?.fromDate ?? '',
              toDate: advancedFilterData?.toDate ?? '',
              onChanged: (start, end) {
                fromDate = start;
                toDate = end;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(height: 40),
            CustomRangeSlider(
              start: advancedFilterData?.fromSalary,
              end: advancedFilterData?.toSalary,
              onChanged: (start, end) {
                fromSalary = start;
                toSalary = end;
              },
            ),
            AllButtonsActions(
              saveAdvancedFilterData: saveAdvancedFilterData,
              clearAdvancedFilterData: clearAdvancedFilterData,
              onFetchDataWithFilter: () => fetchDataWithFilter(context),
            ),
          ],
        ),
      ),
    );
  }

  onFetchProject({required int companyId, required int cityId}) {
    if (companyId != 0 && cityId != 0) {
      fetchProject(companyId, cityId);
    }
  }

  saveAdvancedFilterData() {
    SearchOpportunitiesAvailableParams filterData = createFilterQuery();
    onSaveFilterData!(filterData);
  }

  clearAdvancedFilterData() {
    onClearFilterData!();
  }

  fetchDataWithFilter(BuildContext context) {
    onFetchDataWithFilter(createFilterQuery());
  }

  SearchOpportunitiesAvailableParams createFilterQuery() {
    return SearchOpportunitiesAvailableParams(
      projectId: projectId?.id ?? advancedFilterData?.projectId ?? 0,
      companyId: companyId ?? advancedFilterData?.companyId ?? 0,
      cityId: city?.id ?? advancedFilterData?.cityId ?? 0,
      fromDate: fromDate ?? advancedFilterData?.fromDate ?? '',
      toDate: toDate ?? advancedFilterData?.toDate ?? '',
      jobId: jobId ?? advancedFilterData?.jobId ?? 0,
      fromSalary: fromSalary ?? advancedFilterData?.fromSalary ?? 0,
      toSalary: toSalary ?? advancedFilterData?.toSalary ?? 0,
    );
  }
}


