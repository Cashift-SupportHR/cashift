
import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';

import '../../../../core/services/routes.dart';
import '../../../presentationUser/resources/colors.dart';
import '../../../../common/components/base/base_stateless_widget.dart';
import '../../home/pages/home_screen.dart';

class SkipButton extends BaseStatelessWidget {
  SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.profileScreen);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            strings.skip,
            textAlign: TextAlign.center,
            style: kTextBoldTitle.copyWith(color: kWhite, fontSize: 14),
          ),
          const SizedBox(width: 3),
        const Icon(
          Icons.arrow_forward,
          color: kWhite,
          size: 25,
        )
        //  const SizedBox(width: 10),
        ],
      ),
    );
  }
}
