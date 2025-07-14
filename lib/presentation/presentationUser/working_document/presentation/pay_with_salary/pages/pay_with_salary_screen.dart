import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/common/components/icons/icon_text.dart';

import '../../../../../../utils/app_icons.dart';
import '../../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../resources/constants.dart';


class PayWithSalaryScreen extends BaseStatelessWidget {
  final List<String> data;
  PayWithSalaryScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          header(),

        ],
      ),
    );
  }

  Widget header(){
    return IconText(
      icon: AppIcons.working_document,
      text: strings.advantages_freelancer_document,
      sizedBoxWidth: 10,
      textStyle: kTextSemiBold.copyWith(fontSize: 24, color: kYellow_00),
    );
  }
}
