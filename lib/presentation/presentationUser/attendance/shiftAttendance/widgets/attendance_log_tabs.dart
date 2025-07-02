
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/attendance/shiftAttendance/pages/attendance_log_page.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../pages/attendance_violation_page.dart';

class AttendanceLogTabs extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _AttendanceLogTabsState();
  }

}
class _AttendanceLogTabsState extends State<AttendanceLogTabs> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 5, vsync: this);
    final strings = Get.context!.getStrings();
  return  ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 700,),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 8),
              child: TabBar(
                indicatorColor: kOrange47,
                indicatorWeight: 0.8,
                indicatorPadding: EdgeInsets.only(left: 4,right:4),
                unselectedLabelStyle: kTextRegularSilver.copyWith(fontSize: 12),
                labelStyle: kTextRegular.copyWith(fontSize: 12),
                labelColor: kPrimary,
                isScrollable: true,
                controller: tabController,
                unselectedLabelColor:kSilverTwo ,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs:   [
                  Tab(text:strings.attendance,),
                  Tab(text: strings.absence_days),
                  Tab(text: strings.delay_days),
                  Tab(text: strings.vacations),
                  Tab(text: strings.violations)
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 2,right: 2,bottom: 2),
                child: TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children:[
                      AttendanceLogPage(requestType: AttendanceRequestType.attend,),
                      AttendanceLogPage(requestType: AttendanceRequestType.absence,),
                      AttendanceLogPage(requestType: AttendanceRequestType.delay,),
                      AttendanceLogPage(requestType: AttendanceRequestType.vacation,),
                      AttendanceViolationPage(),

                    ]),
              ),
            ),

          ],
        ),
      ),
    );
  }

}