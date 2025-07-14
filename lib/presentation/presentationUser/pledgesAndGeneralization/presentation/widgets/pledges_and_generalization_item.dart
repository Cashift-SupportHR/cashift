import 'package:flutter/material.dart';
import 'package:shiftapp/presentation/presentationUser/resources/colors.dart';
import 'package:shiftapp/presentation/presentationUser/resources/constants.dart';
import 'package:shiftapp/common/components/buttons/app_cupertino_button.dart';
import 'package:shiftapp/common/components/dialogs_manager.dart';
import 'package:shiftapp/common/components/texts/row_rich_texts.dart';
import 'package:shiftapp/utils/app_icons.dart';

import '../../../../../common/components/base/base_stateless_widget.dart';
import '../../../../../common/components/checkbox/multiple_choice_checkbox.dart';
import '../../../../../common/components/checkbox/single_choice_checkbox.dart';
import '../../../../../common/components/decorations/decorations.dart';
import '../../../../../common/components/image_builder.dart';
import '../../domain/entities/pledge_generalization.dart';
import '../../domain/entities/pledge_generalization_constants.dart';

///  Created by harbey on 7/4/2023.
class PledgesAndGeneralizationItem extends StatelessWidget {
  final PledgeGeneralization item;
  final int type;
  final Function() onReset;

  const PledgesAndGeneralizationItem(
      {Key? key, required this.item, required this.type, required this.onReset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: Decorations.decorationTabs,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kBuildImage(item.logo ?? '', border: 0, size: 30),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title ?? '',
                  style: kTextSemiBold.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                _Body(
                  description: item.subTitle ?? '',
                  checkboxText: item.clearanceText ?? '',
                  type: type,
                ),
                SizedBox(
                  height: 10,
                ),
                _Footer(
                  item: item,
                    onReset: onReset,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final String description;
  final String checkboxText;
  final int type;

  const _Body(
      {Key? key,
      required this.description,
      required this.checkboxText,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: kTextMedium.copyWith(fontSize: 12, color: kBlack_4D),
        ),
        SizedBox(
          height: 10,
        ),
        if (type == PledgeGeneralizationConstants.pledge)
          SingleChoiceCheckbox(
            items: [CheckboxItem(id: 1, text: checkboxText, checked: true)],
            onChanged: (value) {},
          ),
      ],
    );
  }
}

class _Footer extends BaseStatelessWidget {
  final PledgeGeneralization item;
  final Function() onReset;

  _Footer({
    Key? key,
    required this.item,
    required this.onReset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle =
        kTextSemiBold.copyWith(fontSize: 18, color: kOrange_09);
    TextStyle subTitleStyle =
        kTextMedium.copyWith(fontSize: 12, color: kBlack_4D);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRichText(
          title: strings.status,
          subTitle: item.statusText ?? '',
          titleStyle: titleStyle,
          subTitleStyle: subTitleStyle,
        ),
        SizedBox(
          height: 10,
        ),
        CustomRichText(
          title: strings.date_pledge,
          subTitle: item.clearanceDate ?? '',
          titleStyle: titleStyle,
          subTitleStyle: subTitleStyle,
        ),
        SizedBox(
          height: 10,
        ),
        if (item.hasAction ?? false)
          AppCupertinoButton(
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            radius: BorderRadius.circular(12),
            text: strings.reset,
            startIconPadding: EdgeInsets.symmetric(horizontal: 10),
            startIcon: kLoadSvgInCirclePath(
              AppIcons.resetOutline,
            ),
            onPressed: () {
              showDialogReset(context);
            },
          ),
      ],
    );
  }

  showDialogReset(BuildContext context) {
    return DialogsManager.baseDialog(
      context,
      confirmButtonName: strings.confirm_button,
      message: item.confirmMessage ?? '',
      icon: AppIcons.informationFill,
      hideCancelButton: false,
      onClickOk: () {
        onReset();
      },
    );
  }
}
