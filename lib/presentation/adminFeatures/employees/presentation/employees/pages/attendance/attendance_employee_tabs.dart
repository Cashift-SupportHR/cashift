import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shiftapp/core/extensions/extensions.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/presentation/shared/components/app_widgets.dart';

import '../../../../domain/entities/EmpChasifterData.dart';
import '../../widgets/employees_item.dart';
import 'attendance_emplogee_page.dart';

class AttendanceEmployeeTabs extends StatefulWidget {
  final EmpChasifter item;

  const AttendanceEmployeeTabs({super.key, required this.item});
  @override
  State<StatefulWidget> createState() {
    return _AttendanceEmployeeTabsState();
  }
}

class _AttendanceEmployeeTabsState extends State<AttendanceEmployeeTabs>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final strings = Get.context!.getStrings();
    final tabController = TabController(length: 5, vsync: this);

    return AppScaffold(
      title: strings.attendance_departure,
      body: Column(
        children: [
          EmployeesItem(
            item: widget.item,
            onRefresh: () {},
            details: true,
            onChangeStatus: (t) {},
            onDeleteUser: (t) {},
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: TabBar(
                      indicatorColor: kOrange47,
                      indicatorWeight: 0.8,
                      indicatorPadding: EdgeInsets.only(left: 4, right: 4),
                      unselectedLabelStyle:
                          kTextRegularSilver.copyWith(fontSize: 12),
                      labelStyle: kTextRegular.copyWith(fontSize: 12),
                      labelColor: kPrimary,
                      isScrollable: true,
                      controller: tabController,
                      unselectedLabelColor: kSilverTwo,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabAlignment: TabAlignment.start,
                      tabs: [
                        Tab(
                          text: strings.attendance,
                        ),
                        Tab(text: strings.absence_days),
                        Tab(text: strings.delay_days),
                        Tab(text: strings.vacations),
                        Tab(text: strings.violations),
                        //  Tab(text: strings.violations)
                      ],
                    ),
                  ),
                  color: Colors.white,
                ),
                Expanded(
                  child: TabBarView(
                      controller: tabController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        AttendanceEmployeePage(
                          requestType: AttendanceType.attend,
                          empId: widget.item.id ?? 0,
                        ),
                        AttendanceEmployeePage(
                          requestType: AttendanceType.absence,
                          empId: widget.item.id ?? 0,
                        ),
                        AttendanceEmployeePage(
                          requestType: AttendanceType.delay,
                          empId: widget.item.id ?? 0,
                        ),
                        AttendanceEmployeePage(
                          requestType: AttendanceType.vacation,
                          empId: widget.item.id ?? 0,
                        ),
                        AttendanceEmployeePage(
                          requestType: AttendanceType.overtime,
                          empId: widget.item.id ?? 0,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
