import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shiftapp/generated/assets.dart';
  import 'package:shiftapp/presentation/presentationUser/profile/view/widgets/profile_item_widget.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/base/app_widgets.dart';
import 'package:shiftapp/common/components/base/base_stateless_widget.dart';

import '../../../../core/services/routes.dart';

class AttendanceTypesPage extends BaseStatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        jobAttendance(context),
        const SizedBox(
          height: 20,
        ),
        overtimeAttendance(context)
      ],
    ),
      title: 'الحضور والانصراف',
    );
  }

  Widget jobAttendance(BuildContext context) {
    return ProfileItemWidget(
    label: 'تسجيل حضور وانصراف الدوام',
      onTap: (){
      Navigator.pushNamed(context, Routes.attendancePage);
      },
      icon: Image.asset(Assets.imageShiftTime,color: kPrimary,scale: 6.5,),
    );
  }

  Widget overtimeAttendance(BuildContext context) {
    return ProfileItemWidget(
      label: 'تسجيل حضور وانصراف مكمل',
      onTap: (){
        Navigator.pushNamed(context, Routes.overtimeAttendancePage);
      },
      icon: Image.asset(Assets.imageOvertime,color: kPrimary,scale: 6.5,),
    );
  }

}