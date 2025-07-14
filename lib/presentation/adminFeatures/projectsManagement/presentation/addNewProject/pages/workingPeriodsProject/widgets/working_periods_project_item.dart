import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/shared/components/radio/custom_radio_list.dart';
import '../../../../../../../../utils/app_icons.dart';
import '../../../../../../../presentationUser/resources/colors.dart';
import '../../../../../../../presentationUser/resources/constants.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/buttons/app_icon_button.dart';
import '../../../../../../../shared/components/decorations/decorations.dart';
import '../../../../../data/models/index.dart';
import '../../../../../domain/entities/index.dart';

///  Created by harbey on 7/23/2023.
class WorkingPeriodsProjectItem extends BaseStatelessWidget {
  final WorkingPeriod item;
  final void Function()? onEdit;
  final void Function()? onDelete;

  WorkingPeriodsProjectItem({Key? key,  required this.item, this.onEdit, this.onDelete}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.shapeDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomRadioList(
              value: '',
              groupValue: '',
              title: item.name ?? '',
              titleStyle: kTextSemiBold.copyWith(color: kPrimary, fontSize: 20),
              subTitle: item.startTime,
              subTitleStyle: kTextMedium.copyWith(color: kGreen_72, fontSize: 12),
              onChanged: (value) {},
            ),
          ),
          AppIconButton(
            icon: AppIcons.edit,
            iconSize: 20,
            onTap: onEdit,
          ),
          SizedBox(
            width: 10,
          ),
          AppIconButton(
            icon: AppIcons.deleteOutline,
            iconSize: 20,
            onTap: onDelete,
          ),
        ],
      ),
    );
  }
}
