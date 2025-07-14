import 'package:flutter/material.dart';
import 'package:shiftapp/extensions/extensions.dart';
import 'package:shiftapp/presentation/adminFeatures/attendanceNotificationsReports/presentation/pages/screen/search/filter_attendance_notifications_reports_page.dart';
import 'package:shiftapp/presentation/adminFeatures/attendanceNotificationsReports/presentation/pages/widgets/empity_notifications.dart';

 import '../../../../../../presentationUser/common/stream_data_state.dart';
import '../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../common/components/error_handler_widget.dart';
import '../../../../../../../common/components/helper_widgets.dart';
import '../../../../../../../common/components/text_field/text_field_search.dart';
import '../../../../../../../common/components/underline_widget.dart';
import '../../../../data/models/emp_attendance_rports_prams.dart';
import '../../../../domain/entities/EmpAttendanceRportsDto.dart';
import '../../widgets/attendance_notifications_reports_item.dart';
import '../../widgets/count_item_widget.dart';

class AttendanceNotificationsReportsScreen extends BaseStatelessWidget {
  final Function(EmpAttendanceRportsPrams empAttendanceRportsPrams) onSearch;
  final EmpAttendanceRports? empReport;
  AttendanceNotificationsReportsScreen(
      {super.key, required this.empReport, required this.onSearch, a});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldSearch(
          margin: const EdgeInsets.only(left: 8, right: 8, top: 12),
          onTap: () {
            showAppModalBottomSheet(
                context: context,
                padding: EdgeInsets.zero,
                isDivider: false,
                title: strings.filter,
                child: FilterAttendanceNotificationsReportsPage(
                  onSearch: onSearch,
                ));
          },
        ),
        empReport == null
            ? EmptyAttendanceNotificationsReports(
                onSearch: onSearch,
              )
            : empReport?.scheduleEmpAttendanceList?.length == 0
                ? ErrorPlaceHolderWidget(
                    exception: empReport?.emptyListException,
                    color: kBackground,
                  )
                : Expanded(
                    child: Column(
                      children: [
                        headerWidget(empReport
                                ?.scheduleEmpAttendanceList?.length
                                .toString() ??
                            "0"),
                        SizedBox(
                          height: 10,
                        ),
                        CountItemWidget(
                            emp: empReport?.totalScheduleEmpAttendance ?? 0,
                            power: empReport?.totalContractualNumber ?? 0),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                empReport?.scheduleEmpAttendanceList?.length,
                            itemBuilder: (context, index) =>
                                AttendanceNotificationsReportsItem(
                                    scheduleEmpAttendanceList: empReport!
                                        .scheduleEmpAttendanceList![index]),
                          ),
                        ),
                      ],
                    ),
                  ),
      ],
    );
  }

  headerWidget(String numbEmp) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Text(
                strings.employees,
                style: kTextBold.copyWith(fontSize: 14, color: kPrimary),
              ),
              UnderlineWidget(width: 60),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            "${numbEmp} ${strings.employee}",
            style: kTextRegular.copyWith(fontSize: 12, color: kPrimary),
          )
        ],
      ),
    );
  }
}
