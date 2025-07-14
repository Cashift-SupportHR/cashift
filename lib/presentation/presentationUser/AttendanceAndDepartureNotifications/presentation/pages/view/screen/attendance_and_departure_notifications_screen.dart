import 'package:flutter/material.dart';

import '../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../domain/entities/AttendanceNotifiAction.dart';
import '../widgets/attendance_and_departure_notifications_item.dart';

class AttendanceAndDepartureNotificationsScreen extends BaseStatelessWidget {
  final List<AttendanceNotifiAction> data;

  AttendanceAndDepartureNotificationsScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => AttendanceAndDepartureNotificationsItem(
          attendanceNotifiAction: data[index]),
    );
  }
}
