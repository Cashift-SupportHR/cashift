import 'package:flutter/material.dart';

import '../../../../domain/entities/bail_requests/employee_services_status.dart';
import '../../../../utils/app_icons.dart';
import '../../../shared/components/icons/icon_text.dart';

class TitleIconServices extends StatelessWidget {
  final String title;
  final String? iconFirstStatus;
  final int status;
  const TitleIconServices({Key? key, required this.title, this.iconFirstStatus, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconText(
      text: title,
      icon:  status == EmployeeServicesStatus.waitingForReview
          ? (iconFirstStatus ?? AppIcons.waiting)
          : status == EmployeeServicesStatus.approved
          ? AppIcons.doneCircle
          : AppIcons.removeCircle,
      iconSize: status != EmployeeServicesStatus.approved
          ? 20 : 18,
    );
  }
}
