import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/adminFeatures/employeeMap/presentation/widgets/emp_map_widget.dart';

import '../../../../../../common/domain/entities/resume/city_item.dart';
import '../../../../../presentationUser/resources/colors.dart';
import '../../../../../../common/components/buttons/app_cupertino_button.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../common/components/dropdown/dropdown_filed.dart';
import '../../../../../../common/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../projectsManagement/data/models/job_dto.dart';
import '../../../data/models/fetch_emp_map_prams.dart';

class FilterEmployeeMapScreen extends BaseStatelessWidget {
  Function(FetchEmpMapPrams, String cityName, String  jobName) onFilter;
  final List<CityItem> citys;
  final List<JobDto> jobs;
  FilterEmployeeMapScreen(
      {super.key,
      required this.jobs,
      required this.citys,
      required this.onFilter});

  int? cityId;
  String? cityName;
  int? jobId;
  String? jobName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          BottomSheetTextFieldRectangle(
            title: strings.city,
            hintText: strings.select_city,
            isScrollControlled: true,
            setSearch: true,
            searchHint: strings.search_city_name,
            items: citys
                .map((e) => Item(index: e.id ?? 0, value: e.nameAr ?? ''))
                .toList(),
            onSelectItem: (item) async {
              cityId = item.index;
              cityName = item.value;
            },
          ),
          BottomSheetTextFieldRectangle(
            title: strings.job,
            hintText: strings.select_job,
            isScrollControlled: true,
            setSearch: true,
            searchHint: strings.search_city_name,
            items: jobs
                .map((e) => Item(index: e.id ?? 0, value: e.jobName ?? ''))
                .toList(),
            onSelectItem: (item) async {
              jobId = item.index;
              jobName = item.value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          AppCupertinoButton(
            onPressed: () {
              onFilter(FetchEmpMapPrams(jobId: jobId, cityId: cityId),cityName??strings.all_city,jobName??strings.all_job);
            },
            text: strings.save_button,
            elevation: 0,
            backgroundColor: kPrimary,
            radius: BorderRadius.circular(5),
            padding: const EdgeInsets.symmetric(vertical: 11),
          ),
        ],
      ),
    );
  }
}
