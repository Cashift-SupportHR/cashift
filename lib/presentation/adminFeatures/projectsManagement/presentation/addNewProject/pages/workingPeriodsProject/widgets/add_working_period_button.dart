import 'package:flutter/material.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/buttons/app_outline_button_icon.dart';
import 'add_working_periods_project_builder.dart';

///  Created by harbey on 7/27/2023.
class AddWorkingPeriodButton extends BaseStatelessWidget {
  final int projectId;
  final int companyId;

  final Function()? onRefresh;
  AddWorkingPeriodButton({required this.projectId, required this.companyId, required this.onRefresh});
  @override
  Widget build(BuildContext context) {
    return AppOutlineButtonIcon(
      icon: AppIcons.add,
      iconColor: kPrimary,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      text: strings.add_new_period,
      textStyle: kTextSemiBold.copyWith(fontSize: 20, color: kPrimary),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      onClick: () {
        showAddWorkingPeriodSheet(context, companyId: companyId ?? 0, projectId: projectId, title: strings.add_new_period, onRefresh: () {
          onRefresh!();
        });
      },
    );
  }
}
