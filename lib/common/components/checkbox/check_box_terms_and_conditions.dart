import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/texts/row_rich_texts.dart';

import '../../../presentation/presentationUser/resources/colors.dart';
import '../base/base_stateless_widget.dart';
import '../decorations/decorations.dart';
import 'custom_check_box.dart';

class CheckBoxTermsAndConditions extends BaseStatelessWidget {
  final dynamic Function(bool?)? onChanged;
   CheckBoxTermsAndConditions({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: Decorations.createRectangleDecoration(
        color: kRateBarIconColor.withOpacity(0.04),
          border: 0,
      ),
      child: CustomCheckBox(
        titleWidget: CustomRichText(
            title: strings.i_accept_to,
          subTitle: strings.copy_rights_title,
          titleStyle: kTextSemiBold.copyWith(color: kGreen_F6F, fontSize: 20),
          subTitleStyle: kTextMedium.copyWith(color: kOrange00, fontSize: 14),
          isMark: false,
        ),
        onChanged: (value) {
          onChanged!(value);
        },
      ),
    );
  }
}
