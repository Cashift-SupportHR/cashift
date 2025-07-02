import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/index.dart';
import '../../../../../../core/utils/app_images.dart';
 import '../../../data/models/emp_attendance_rports_prams.dart';
import '../screen/search/filter_attendance_notifications_reports_page.dart';

class EmptyAttendanceNotificationsReports extends BaseStatelessWidget {
    Function(EmpAttendanceRportsPrams empAttendanceRportsPrams) onSearch;
   EmptyAttendanceNotificationsReports(
      {super.key,

      required this.onSearch,
       });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Image.asset(
          AppImages.st,
          width: 130,
          height: 130,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          strings.no_employee,
          style: kTextMedium,
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          strings.no_employee_decr,
          style: kTextRegular.copyWith(fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: AppCupertinoButton(
            onPressed: () {
              showAppModalBottomSheet(
                  context: context,
                  padding: EdgeInsets.zero,
                  isDivider: false,
                  title: strings.filter,

                  child: FilterAttendanceNotificationsReportsPage(
                    onSearch: onSearch,
                  ));
            },
            text: strings.select_project,
            elevation: 0,
            backgroundColor: kPrimary,
            radius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
