import 'package:flutter/material.dart';

import '../../../../core/utils/validate.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../presentationUser/resources/constants.dart';
import '../../../shared/components/app_cupertino_button.dart';
import '../../../shared/components/base_stateless_widget.dart';
import '../../../shared/components/date_time/select_time_widget.dart';
import '../../../shared/components/drop_down_custom2.dart';
import '../../../shared/components/underline_widget.dart';
import '../../shared/data/models/update_attendance_params.dart';
import '../../shared/domain/entities/opportunities/attendance_status.dart';

class UpdateAttendanceWidget extends BaseStatelessWidget {
  final int employeeId;
  final int opportunityId;
  final Function(UpdateAttendanceParams) onUpdateAttendance;
  UpdateAttendanceWidget(
      {Key? key,
        required this.employeeId,
        required this.opportunityId,
        required this.onUpdateAttendance
      })
      : super(key: key);
  Map<String, dynamic> objectAttendanceStatus = {};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List attendanceStatusList = [
      {
        'id': AttendanceStatus.attendance,
        'name': strings.attendance_registration,
      },
      {
        'id': AttendanceStatus.departure,
        'name': strings.departure_registration,
      },
      {
        'id': AttendanceStatus.attendanceAndDeparture,
        'name': strings.attendance_and_departure_registration,
      },
      {
        'id': AttendanceStatus.absence,
        'name': strings.absence_registration,
      },
      {
        'id': AttendanceStatus.withdrawal,
        'name': strings.withdrawal_registration,
      },
    ];

    String beginningTime = '00:00';
    String endingTime = '00:00';
    String? attendanceStatus;
    int? attendanceStatusId;
    return Container(
      color: kWhite,
      height: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                strings.attendance_state,
                style: kTextBold.copyWith(color: kPrimary),
              ),
              const UnderlineWidget(),
              const SizedBox(height: 10),
              SizedBox(
                child: StatefulBuilder(
                    builder: (context, setState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DropDownCustom2(
                            items: attendanceStatusList
                                .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e['name'],
                                  style: kTextRegular.copyWith(fontSize: 12),
                                )))
                                .toList(),
                            onChanged: (Object? value) {
                              Map<String, dynamic> map = value as Map<String, dynamic>;
                              objectAttendanceStatus = map;
                              attendanceStatusId = map['id'];
                              attendanceStatus = map['name'];
                              setState(() {});
                            },
                            validator: (value) => Validate.validateRequired(
                                value?.toString(), strings.required_attendance_status),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          [
                            AttendanceStatus.attendance,
                            AttendanceStatus.departure,
                            AttendanceStatus.attendanceAndDeparture
                          ].contains(attendanceStatusId)
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                strings.recording_time,
                                style: kTextSemiBold.copyWith(color: kPrimary),
                              ),
                              const UnderlineWidget(),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  (attendanceStatusId ==
                                      AttendanceStatus.attendance || objectAttendanceStatus['name'] == strings.attendance_and_departure_registration)
                                      ? Expanded(
                                    child: SelectTimeWidget(
                                      title: strings.beginning_time,
                                      onTap: (time) {
                                        beginningTime =
                                        '${time?.hour ?? 00}:${time?.minute ?? 00}';
                                      },
                                    ),
                                  )
                                      : const SizedBox(),
                                  const SizedBox(width: 20),
                                  (attendanceStatusId ==
                                      AttendanceStatus.departure)
                                      ? Expanded(
                                    child: SelectTimeWidget(
                                      title: strings.end_time,
                                      onTap: (time) {
                                        endingTime =
                                        '${time?.hour ?? 00}:${time?.minute ?? 00}';
                                      },
                                    ),
                                  )
                                      : const SizedBox(),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                            ],
                          )
                              : const SizedBox(height: 100),
                        ],
                      );
                    }
                ),
              ),
              AppCupertinoButton(
                text: strings.save_button,
                textStyle:
                kTextBoldSmall.copyWith(color: kPrimaryLight, fontSize: 18),
                radius: BorderRadius.circular(8),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                margin: const EdgeInsets.only(top: 20),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    onUpdateAttendance(UpdateAttendanceParams(
                      id: employeeId,
                      oppId: opportunityId,
                      attendaceStatus: attendanceStatus,
                      statusId: attendanceStatusId,
                      startTime: beginningTime,
                      endTime: endingTime,
                    ));
                  }


                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

