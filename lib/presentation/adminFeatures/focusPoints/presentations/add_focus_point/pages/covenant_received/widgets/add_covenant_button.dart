import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/shared/components/image_builder.dart';

import '../../../../../../../../core/utils/app_icons.dart';
import '../../../../../../../shared/components/base_stateless_widget.dart';
import '../../../../../../../shared/components/decorations/decorations.dart';
import '../../../../../../../shared/components/icons/icon_text.dart';

///  Created by harbey on 5/16/2023.
class AddCovenantButton extends BaseStatelessWidget {
  final void Function()? onTap;
  AddCovenantButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: Decorations.boxDecorationBorder(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kLoadSvgInCirclePath(AppIcons.covenantOutline),
            const SizedBox(height: 10),
            IconText(
             text: strings.add_covenant,
              icon: AppIcons.add,
              iconColor: kPrimary,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
