import 'package:flutter/material.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/adminFeatures/available_opportunities/presentation/widgets/text_field_project.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/image_builder.dart';

import '../../../../../common/data/repositories/advancedFilter/select_model.dart';
import '../../../../../common/domain/entities/advancedFilter/offers_filter_data.dart';
import '../../../../../utils/app_icons.dart';
import '../../../../presentationUser/advancedFilter/widgets/select_widget.dart';
 import '../../../../presentationUser/advancedFilter/widgets/text_field_date_picker_filter.dart';
 import '../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/helper_widgets.dart';
import '../../../shared/data/models/pagination_opportunity_params.dart';
import '../../../shared/domain/entities/opportunities/ProjectFiterOpportunity.dart';

class FilterOpportunity extends BaseStatelessWidget {
  final OffersFilterData jobsCompanyByOpp;
  final List<ProjectFiterOpportunity> projects;
  final void Function(PaginationOpportunityParams params ,String searchText) onFilterData;

  FilterOpportunity({
    Key? key,
    required this.projects,
    required this.type,
    required this.jobsCompanyByOpp,
    required this.onFilterData,
  }) : super(key: key);

  int? projectId;
  String? projectName;
  int type;
  String? typeName;
  String? jobName;
  int? jobId;

  ProjectFiterOpportunity? projectData;

  String? fromDate;
  String? toDate;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectWidget(
              title: strings.select_profession,
              items: jobsCompanyByOpp.jobs!.map((e) => SelectModel.fromJson(e.toJson())).toList(),
              initialValue: 0,
              onSelected: (value, name) {
                jobId = value;
                jobName = name ?? '';
                print(jobId);
              },
            ),
            const Divider(),
            TextFieldProjectOpportunityPicker(
              projects: projects,
              onSelectCity: (value) {
                projectData = ProjectFiterOpportunity(
                  id: value.index,
                  name: value.value,
                );
                projectName = projectData?.name ?? '';
              },
            ),
            const Divider(height: 40),
            TextFieldDatePicker(
              fromDate: '',
              toDate: '',
              onChanged: (start, end) {
                fromDate = start;
                toDate = end;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: AppCupertinoButton(
                text: strings.view_search_results,
                radius: BorderRadius.circular(10),
                textStyle: kTextSemiBold.copyWith(color: kWhite, fontSize: 16),
                onPressed: () {
                  final text = " ${jobName ?? ''},  ${projectName ?? ''}, ${typeName ?? ''}, ${fromDate ?? ''}, ${toDate ?? ''}";
                  onFilterData(PaginationOpportunityParams(
                    startDate: fromDate == '' ? null : fromDate ?? null,
                    endDate: toDate == '' ? null : toDate ?? null,
                    jobId: jobId ?? 0,
                    projectId: projectData?.id ?? 0,
                    pageSize: 10,
                    type: type,
                    page: 0,
                  ),text);
                },
              ),
            ),
            // _AllButtonsActions(
            //   saveAdvancedFilterData: () {},
            //   clearAdvancedFilterData: clearAdvancedFilterData,
            //   onFetchDataWithFilter: () {},
            // ),
          ],
        ),
      ),
    );
  }


  static show(BuildContext context, {required OffersFilterData jobsCompanyByOpp, required List<ProjectFiterOpportunity> projects, required int tabId, required void Function(PaginationOpportunityParams params,String text) onFilterData}){
    showAppModalBottomSheet(
      context: context,
      title: context.getStrings().search_filtering,
      padding: EdgeInsets.zero,
      radius: 12,
      isDivider: false,
      child: FilterOpportunity(
        jobsCompanyByOpp: jobsCompanyByOpp,
        type: tabId,
        onFilterData: (params,text) {
          Navigator.pop(context);
          onFilterData(params,text);
        },
        projects: projects,
      ),
    );
  }

}

class _AllButtonsActions extends BaseStatelessWidget {
  final void Function() saveAdvancedFilterData;
  final void Function() clearAdvancedFilterData;
  final void Function() onFetchDataWithFilter;

  _AllButtonsActions({Key? key, required this.saveAdvancedFilterData, required this.clearAdvancedFilterData, required this.onFetchDataWithFilter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Row(
        children: [
          TextButton.icon(
            icon: kLoadSvgInCirclePath(AppIcons.filter, color: kYellow_2),
            label: Text(
              strings.save_filter,
              style: kTextSemiBold.copyWith(color: kYellow_2),
            ),
            onPressed: saveAdvancedFilterData,
          ),
          const Spacer(),
          TextButton(
            child: Text(
              strings.delete_all,
              style: kTextSemiBold.copyWith(color: kPrimary),
            ),
            onPressed: clearAdvancedFilterData,
          ),
          AppCupertinoButton(
            text: strings.view_search_results,
            radius: BorderRadius.circular(10),
            textStyle: kTextSemiBold.copyWith(color: kWhite, fontSize: 16),
            onPressed: onFetchDataWithFilter,
          ),
        ],
      ),
    );
  }


}
