import 'package:flutter/material.dart';
import 'package:shiftapp/common/data/repositories/advancedFilter/select_model.dart';
import 'package:shiftapp/common/domain/entities/advancedFilter/index.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/data/models/advancedFilter/index.dart';

import '../../../../../../../adminFeatures/employees/domain/entities/shift_employee.dart';
import '../../../../../../../adminFeatures/projectsManagement/presentation/addNewProject/pages/addProject/widgets/company_picker.dart';
import '../../../../../../../adminFeatures/usersManagement/domain/entities/company.dart';
import '../../../../../../../shared/components/app_cupertino_button.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/dropdown_filed.dart';
import '../../../../../../../shared/components/text_field/bottom_sheet_text_field_rectangle.dart';
import '../../../../../../../shared/models/common_list_item.dart';
import '../../../../../../advancedFilter/widgets/select_widget.dart';
import '../../../../../../advancedFilter/widgets/text_field_date_picker_filter.dart';
import '../../../../../../common/common_state.dart';
import '../../../../../../resources/constants.dart';
import '../../../../../data/models/receive_vehicle_prams.dart';

class FilterReceiveScreen extends BaseStatelessWidget {
  final List<Company> company;
  StreamStateInitial<List<CommonListItem>?> projectsStream;
  final void Function(ReceiveVehiclePrams) onSaveFilterData;
  final void Function(int companyId) onFetchProject;
  final void Function(int projectId) onFetchShift;
  StreamStateInitial<List<ShiftEmployee>?> shiftsStream;

  int companyId=0;
  int? projectId=0;
  int? shiftId=0;
  String? fromDate;
  String? toDate;

  FilterReceiveScreen(
      {super.key,
      required this.projectsStream,
      required this.shiftsStream,
      required this.onFetchShift,
      required this.company,
      required this.onSaveFilterData,
      required this.onFetchProject});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kWhite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),

               child: CompanyProjectPicker(
                label: strings.company_name,
                hintText: strings.select_company_name,
                items: company,
                onSelectItem: (item) {
                  companyId = item.index;
                  onFetchProject(
                    companyId ?? 0,
                  );
                },
                           ),
             ),
            projectWidget(),
            shiftWidget(),
            TextFieldDatePicker(
              title: strings.date,
              fromDate: '',
              toDate: '',
              onChanged: (start, end) {
                fromDate = start;
                toDate = end;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            AppCupertinoButton(
              text: strings.view_search_results,
              radius: BorderRadius.circular(10),
              textStyle: kTextSemiBold.copyWith(color: kWhite, fontSize: 16),
              onPressed: () {
                Navigator.pop(context);
                onSaveFilterData(ReceiveVehiclePrams(
                  pageSize: 20,
                  page: 0,
                  shiftId: shiftId,
                  companyId: companyId,
                  projectId: projectId,
                  endDate: toDate,
                  startDate: fromDate,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  projectWidget() {
    return StreamBuilder<List<CommonListItem>?>(
        stream: projectsStream.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BottomSheetTextFieldRectangle(
                    title: strings.project,
                    hintText: strings.select_project,
                    isScrollControlled: true,
                    setSearch: true,
                    items: snapshot.data!
                        .map((e) => Item(
                            index: e.id ?? 0,
                            description: e.name.toString(),
                            value: e.name.toString()))
                        .toList(),
                    onSelectItem: (items) async {
                      projectId =
                          items.index; // projectController.text = items.value;
                      onFetchShift(items.index);
                    },
                  ),
              )
              : SizedBox();
        });
  }

  shiftWidget() {
    return StreamBuilder<List<ShiftEmployee>?>(
        stream: shiftsStream.stream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BottomSheetTextFieldRectangle(
                    title: strings.working_period,
                    hintText: strings.select_working_period,
                    isScrollControlled: true,
                    setSearch: true,
                    items: snapshot.data!
                        .map((e) => Item(
                            index: e.shiftId ?? 0,
                            description: e.shiftName.toString(),
                            value: e.shiftName.toString()))
                        .toList(),
                    onSelectItem: (items) async {
                      shiftId = items.index;
                    },
                  ),
              )
              : SizedBox();
        });
  }
}
