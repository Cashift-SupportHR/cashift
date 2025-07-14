import 'package:flutter/material.dart';

import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../../../../common/components/buttons/app_outline_button_icon.dart';
import '../../../../../../../../common/components/helper_widgets.dart';
import 'add_period_pricing_builder.dart';

///  Created by harbey on 7/27/2023.
class AddPeriodPricingButton extends BaseStatelessWidget {
  final int projectId;
  final int companyId;
  final Function()? onRefresh;
  AddPeriodPricingButton({
    Key? key,
    required this.projectId,
    required this.companyId,
    this.onRefresh,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppOutlineButtonIcon(
      icon: AppIcons.add,
      iconColor: kPrimary,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      text: strings.add_period_pricing,
      textStyle: kTextSemiBold.copyWith(fontSize: 20, color: kPrimary),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      onClick: () {
        return showAppModalBottomSheet(
          context: context,
          title: strings.add_period_pricing,
          isScrollControlled: true,
          isDivider: false,
          topMargin: 10,
          child: AddPeriodPricingBuilder(projectId: projectId, id: 0, onRefresh: onRefresh, companyId: companyId),
        );
      },
    );
  }
}
