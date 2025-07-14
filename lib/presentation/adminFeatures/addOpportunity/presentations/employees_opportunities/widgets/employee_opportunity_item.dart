import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../../common/components/base/user_info_widget_with_icon.dart';
import '../../../../../../common/components/checkbox/custom_check_box.dart';
import '../../../../../shared/components/decorations/decorations.dart';
import '../../../domain/entities/employee_opportunity.dart';

///  Created by harbey on 9/8/2023.
class EmployeeOpportunityItem extends StatelessWidget {
  final EmployeeOpportunity employee;
  final bool? value;
  final Function(EmployeeOpportunity) onSelectedEmployee;

  const EmployeeOpportunityItem(
      {Key? key, required this.employee, required this.onSelectedEmployee, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: Decorations.shapeDecoration(radius: 12),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: UserInfoWidgetWithIcon(
            imageSize: 80,
            image: employee.icon ?? '',
            name: employee.name ?? '',
            phone: employee.phoneNumber ?? '',
            job: employee.cityName ?? '',
              space: 8,
          ),
        ),
        checkbox(),
        starIcon(),
      ],
    );
  }

  Widget checkbox(){
    return  Padding(
      padding: const EdgeInsetsDirectional.only(top: 10, start: 15),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: CustomCheckBox(
          value: value ?? false,
          onChanged: (value) {
            onSelectedEmployee(employee);
          },
        ),
      ),
    );
  }
  Widget starIcon(){
    return  Padding(
      padding: const EdgeInsetsDirectional.only(top: 22, end: 25),
      child: Align(
        alignment: AlignmentDirectional.topEnd,
        child: kLoadSvgInCirclePath(employee.isFavorite == true ? AppIcons.star_bold : AppIcons.star_outline),
      ),
    );
  }
}
